import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';

class DInput extends StatefulWidget {
  DInput({super.key,required this.controller,required this.hintText,this.right,this.left,this.isPass, this.maxLine=1, this.borderRadius, this.bgColor, this.title, this.title2, this.require, this.onSubmit, this.onChange,this.typeInput});
  final TextEditingController controller;
  final String hintText;
  final String? title;
  final Widget? right;
  final Widget? left;
  final bool? isPass;
  final int? maxLine;
  final double? borderRadius;
  final Color? bgColor;
  final String? title2;
  final bool? require;
  final Function? onSubmit;
  final Function? onChange;
  final TextInputType? typeInput;

  @override
  State<DInput> createState() => _DInputState();
}

class _DInputState extends State<DInput> {
  bool showPass=false;

  @override
  void initState() {
    if(widget.isPass!=null)
      showPass=widget.isPass!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title!=null?
        RichText(
          text: TextSpan(
            text: widget.title!,
            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600,height: 1.2),
            children: <TextSpan>[
              TextSpan(text: ' ${widget.title2??''}', style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w500)),
              TextSpan(text: widget.require==true?'*':'',style: TextStyle(color: AppColors.primary,fontSize: 18.sp,height: 1)),
            ],
          ),
        )
            :SizedBox(),
        widget.title!=null?SizedBox(height: 5.sp,):SizedBox(),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: AppColors.grayE5),
            borderRadius: BorderRadius.circular(widget.borderRadius??60.sp),
            color: widget.bgColor
          ),
          child: Row(
            children: [
              widget.left!=null?Container(
                  margin: EdgeInsets.only(left: 15.sp),
                  child: widget.left!):SizedBox(),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: AppStyle.DEFAULT_14.copyWith(color: AppColors.textBlack.withOpacity(0.6))
                  ),
                  keyboardType: widget.typeInput??TextInputType.text,
                  onEditingComplete: () {
                    if(widget.onSubmit!=null) {
                      widget.onSubmit!();
                    }
                    else{
                      FocusScope.of(context).unfocus();
                    }
                  },
                  onChanged: (String text){
                    if(widget.onChange!=null){
                      widget.onChange!(text);
                    }
                  },
                  maxLines: widget.maxLine,
                  obscureText: showPass,
                  style: AppStyle.DEFAULT_14,
                ),
              ),
              if (widget.right!=null) Container(
                margin: EdgeInsets.only(right: 15.sp),
                  child: widget.right!),
              if (widget.isPass!=null&& widget.isPass==true) InkWell(
                onTap: (){
                  setState(() {
                    showPass=!showPass;
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(right: 15.sp),
                    child: SvgPicture.asset(
                      showPass==true?Assets.iconsEye:Assets.iconsCloseEye,color: AppColors.gray97,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}

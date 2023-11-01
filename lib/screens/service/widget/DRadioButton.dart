import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';

class DRadioButton extends StatefulWidget {
  const DRadioButton({super.key,required this.data,this.onChanged,this.isVertical=false});
  final List<String> data;
  final Function? onChanged;
  final bool isVertical;

  @override
  State<DRadioButton> createState() => _DRadioButtonState();
}

class _DRadioButtonState extends State<DRadioButton> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return widget.isVertical==false? Container(
      width: Get.width,
      decoration: BoxDecoration(
        // border: Border.all(width: 1)
      ),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: widget.data.length==2?WrapAlignment.spaceAround: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.start,
        runSpacing: 10.sp,
        // mainAxisAlignment:widget.data.length==2?MainAxisAlignment.spaceAround: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.data.length, (index) => _item(widget.data[index], index)),
      ),
    ):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment:widget.data.length==2?MainAxisAlignment.spaceAround: MainAxisAlignment.spaceBetween,
      // mainAxisAlignment:MainAxisAlignment.start,
      children: List.generate(widget.data.length, (index) => _item(widget.data[index], index)),
    );
  }

  Widget _item(String text, int index) {
    return InkWell(
      onTap: (){
        setState(() {
          groupValue = index;
        });
        if(widget.onChanged!=null)
        widget.onChanged!(index);
      },
      child:Container(
        margin: EdgeInsets.only(bottom: widget.isVertical==true?12.sp:0.sp),
        // decoration: BoxDecoration(
        //   border: Border.all(width: 1)
        // ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.sp,
              height: 30.sp,
              decoration: BoxDecoration(
                // border: Border.all(width: 1)
              ),
              child: Transform.scale(
                scale: 1.4,
                child: Radio<int>(
                    value: index,
                    activeColor: AppColors.primary,
                    groupValue: groupValue,
                    onChanged: (int? value) {
                      setState(() {
                        groupValue = value!;
                      });
                      if(widget.onChanged!=null) {
                        widget.onChanged!(index);
                      }
                    }),
              ),
            ),
            SizedBox(
              width: 6.sp,
            ),
            AppText(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

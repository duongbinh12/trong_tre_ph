import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';

class DCheckBox extends StatefulWidget {
  const DCheckBox({super.key,required this.data,this.onChanged,this.isVertical=false});
  final List<String> data;
  final Function? onChanged;
  final bool isVertical;

  @override
  State<DCheckBox> createState() => _DCheckBoxState();
}

class _DCheckBoxState extends State<DCheckBox> {
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
        children: List.generate(widget.data.length, (index) => ItemCheckBox(onChanged: (bool value){
          if(widget.onChanged!=null) widget.onChanged!(value);
        }, data: widget.data[index])),
      ),
    ):Column(
      mainAxisAlignment:widget.data.length==2?MainAxisAlignment.spaceAround: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.data.length, (index) => ItemCheckBox(onChanged: (bool value){
        if(widget.onChanged!=null) widget.onChanged!(value);
      }, data: widget.data[index])),
    );
  }
}

class ItemCheckBox extends StatefulWidget {
  const ItemCheckBox({super.key, required this.onChanged, required this.data});
  final String data;
  final Function onChanged;

  @override
  State<ItemCheckBox> createState() => _ItemCheckBoxState();
}

class _ItemCheckBoxState extends State<ItemCheckBox> {
  bool value=false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          value=!value;
        });
          widget.onChanged(value);
      },
      child:Container(
        margin: EdgeInsets.only(bottom: 0.sp),
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
                child: Checkbox(
                    value: value,
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.sp)
                    ),
                    onChanged: (bool? valuee) {
                      setState(() {
                        value=valuee!;
                      });
                        widget.onChanged(value);
                    }),
              ),
            ),
            SizedBox(
              width: 6.sp,
            ),
            AppText(
              widget.data,
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


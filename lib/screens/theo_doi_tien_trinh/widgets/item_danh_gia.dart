import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/service/widget/DCheckBox.dart';
import 'package:trong_tre/screens/service/widget/DRadioButton.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_text.dart';

class ItemDanhGia extends StatefulWidget {
  const ItemDanhGia({super.key, required this.data, required this.index});

  final data;
  final int index;

  @override
  State<ItemDanhGia> createState() => _ItemDanhGiaState();
}

class _ItemDanhGiaState extends State<ItemDanhGia> {
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.borderRed),
          borderRadius: BorderRadius.circular(15.sp),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0,
                color: AppColors.blue2.withOpacity(0.15))
          ]),
      margin: EdgeInsets.only(bottom: 8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 13.sp),
            width: Get.width,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.borderRed))),
            child: RichText(
              text: TextSpan(
                text: '${widget.index + 1}. ${widget.data['name']}',
                style: AppStyle.DEFAULT_16_BOLD,
                children: [
                  widget.data['require']
                      ? TextSpan(
                          text: '*',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary))
                      : TextSpan(),
                ],
              ),
            ),
          ),
          // SizedBox(height: 18.sp,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 13.sp),
            child: Column(
              children: [
                widget.data['isCheckbox'] == true
                    ? Container(
                        margin: EdgeInsets.only(bottom: 20.sp),
                        child: DCheckBox(data: widget.data['answer']))
                    : widget.data['listAnswer'] != null
                        ? Container(
                            margin: EdgeInsets.only(bottom: 20.sp),
                            child: Column(
                              children: List.generate(
                                  widget.data['listAnswer'].length,
                                  (index) => Container(
                                        margin: EdgeInsets.only(bottom:index==widget.data['listAnswer'].length-1?0: 10.sp),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              widget.data['listAnswer'][index]
                                                  ['name'],
                                              style: AppStyle.DEFAULT_14_BOLD
                                                  .copyWith(height: 1.2),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            DRadioButton(
                                                data: widget.data['listAnswer']
                                                    [index]['list']),
                                          ],
                                        ),
                                      )),
                            ),
                          )
                        : widget.data['answer'].length > 0
                            ? Container(
                                margin: EdgeInsets.only(bottom: 20.sp),
                                child:
                                    DRadioButton(data: widget.data['answer']))
                            : SizedBox(),
                widget.data['nhanXet'] == true
                    ? DInput(
                        controller: _noteController,
                        hintText: 'Nhập nhận xét',
                        borderRadius: 10.sp,
                        title: 'Nhận xét',
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}

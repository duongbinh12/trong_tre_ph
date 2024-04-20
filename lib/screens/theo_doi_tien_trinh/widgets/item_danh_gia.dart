import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/service/widget/DCheckBox.dart';
import 'package:trong_tre/screens/service/widget/DRadioButton.dart';
import 'package:trong_tre/services/entity/chi_tiet_nx_response.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_text.dart';

class ItemDanhGiaForm extends StatefulWidget {
  const ItemDanhGiaForm({super.key, required this.data, required this.index});

  final ItemDanhGia data;
  final int index;

  @override
  State<ItemDanhGiaForm> createState() => _ItemDanhGiaFormState();
}

class _ItemDanhGiaFormState extends State<ItemDanhGiaForm> {
  TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    _noteController.text=widget.data.noi_dung_nhan_xet??'';
    super.initState();
  }

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
                text: '${widget.data.tieu_de}',
                style: AppStyle.DEFAULT_16_BOLD,
                // children: [
                //   widget.data['require']
                //       ? TextSpan(
                //           text: '*',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: AppColors.primary))
                //       : TextSpan(),
                // ],
              ),
            ),
          ),
          // SizedBox(height: 18.sp,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 13.sp),
            child: Column(
              children: [
                // widget.data['isCheckbox'] == true
                //     ? Container(
                //         margin: EdgeInsets.only(bottom: 20.sp),
                //         child: DCheckBox(data: widget.data['answer']))
                //     :
                widget.data.cac_buoi!.isNotEmpty
                        ? Container(
                            margin: EdgeInsets.only(bottom: 20.sp),
                            child: Column(
                              children: List.generate(
                                  widget.data.cac_buoi!.length,
                                  (index) => Container(
                                        margin: EdgeInsets.only(bottom:index==widget.data.cac_buoi!.length-1?0: 10.sp),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              widget.data.cac_buoi![index].tieu_de??'',
                                              style: AppStyle.DEFAULT_14_BOLD
                                                  .copyWith(height: 1.2),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            DRadioButton(
                                                data: widget.data.cac_buoi![index].muc_do!,
                                                select: widget.data.cac_buoi![index].muc_do_da_cho??'',
                                              isReadonly: true,
                                            ),
                                          ],
                                        ),
                                      )),
                            ),
                          )
                        :widget.data.muc_do!=null&& widget.data.muc_do!.isNotEmpty
                            ? Container(
                                margin: EdgeInsets.only(bottom: 20.sp),
                                child:
                                widget.data.type==1?
                                DCheckBox(data: widget.data.muc_do!,
                                  selected:widget.data.muc_do_da_cho??'',
                                  onChanged: (bool value,int index1){
                                    if(value==true){
                                      print("qjwndqw ${widget.data.muc_do![index1]}");
                                      if(widget.data.muc_do_da_cho!=null)
                                      {
                                        widget.data.muc_do_da_cho =widget.data.muc_do_da_cho!+','+widget.data.muc_do![index1];
                                      }
                                      else{
                                        widget.data.muc_do_da_cho =widget.data.muc_do![index1];
                                      }
                                    }
                                  },
                                )
                                    :DRadioButton(data: widget.data.muc_do!,select: widget.data.muc_do_da_cho??'', isReadonly: true,))
                            : SizedBox(),
                widget.data.nhan_xet == true
                    ? DInput(
                        controller: _noteController,
                        hintText: '',
                        enable: false,
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

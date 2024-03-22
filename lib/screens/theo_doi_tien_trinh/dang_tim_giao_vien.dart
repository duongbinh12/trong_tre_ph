import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/history/controllers/history_controller.dart';
import 'package:trong_tre/services/entity/find_teacher_response.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/app_values.dart';
import '../../res/colors.dart';
import '../../services/entity/thong_tin_giao_vien_response.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DTitleIcon.dart';
import '../../widgets/app_text.dart';

class DangTimGiaoVien extends StatefulWidget {
  const DangTimGiaoVien({super.key, required this.id});

  final int id;

  @override
  State<DangTimGiaoVien> createState() => _DangTimGiaoVienState();
}

class _DangTimGiaoVienState extends State<DangTimGiaoVien> {
  HistoryController _historyController = Get.find<HistoryController>();
  TextEditingController _liDo=TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      _historyController.timGiaoVien(id: widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HistoryController>(builder: (controller) {
      if (controller.timGiaoVienData.value != null) {
        return Column(
          children: [
            _thongTinKhoaHoc(controller.timGiaoVienData.value!),
            if (controller.timGiaoVienData.value!.leaderKD != null)
              _contact(controller.timGiaoVienData.value!.leaderKD!),
            SizedBox(
              height: 56.h,
            ),
            if(controller.timGiaoVienData.value!.trang_thai!.id!=48) DButton(
                text: 'Hủy đơn'.tr,
                background: AppColors.grayE5,
                textColor: AppColors.textBlack,
                borderColor: AppColors.grayE5,
                onClick: onClickHuy)
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }

  Widget _thongTinKhoaHoc(FindTeacherData data) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 10,
                color: AppColors.blue2.withOpacity(0.15))
          ]),
      padding:
          EdgeInsets.only(left: 15.sp, right: 15.sp, top: 20.sp, bottom: 5.sp),
      child: Column(
        children: [
          DTitleIcon(
              icon: Assets.iconsBook,
              colorIcon: AppColors.primary,
              title: 'Thông tin khóa học'.tr),
          SizedBox(
            height: 24.sp,
          ),
          _itemThongTin(
              icon: Assets.iconsIcFile,
              left: 'Dịch vụ'.tr,
              right: AppText(
                data.dichVu ?? '',
                style: AppStyle.DEFAULT_14.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.primary),
              )),
          _itemThongTin(
              icon: Assets.iconsIcTrangThai,
              left: 'Trạng thái'.tr,
              right: AppText(
                data.soBuoiHoanThanh ?? '',
                style: AppStyle.DEFAULT_14.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.primary),
              )
              // right: RichText(
              //   text: TextSpan(
              //     text: '3/',
              //     style: AppStyle.DEFAULT_14.copyWith(
              //         color: AppColors.primary, fontWeight: FontWeight.w500),
              //     children: <TextSpan>[
              //       TextSpan(
              //           text: '5',
              //           style: TextStyle(color: AppColors.textBlack)),
              //     ],
              //   ),
              // )
              ),
          _itemThongTin(
              icon: Assets.iconsIcHocPhi,
              left: 'Học phí '.tr,
              right: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text:
                          '${AppValue.format_money(double.parse(data.tong_tien!))} ',
                      style: AppStyle.DEFAULT_14
                          .copyWith(fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'đ',
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 5.sp,
                  // ),
                  // SvgPicture.asset(
                  //   Assets.iconsTag,
                  //   height: 19.sp,
                  //   color: AppColors.green,
                  // ),
                  // Container(
                  //   height: 19.sp,
                  //   padding: EdgeInsets.only(right: 8.sp),
                  //   decoration: BoxDecoration(
                  //       color: AppColors.green,
                  //       borderRadius: BorderRadius.horizontal(
                  //           right: Radius.circular(3.sp))),
                  //   child: Center(
                  //     child: AppText(
                  //       data.trang_thai_thanh_toan ?? '',
                  //       textAlign: TextAlign.center,
                  //       style: AppStyle.DEFAULT_14.copyWith(
                  //           fontWeight: FontWeight.w600,
                  //           color: AppColors.white,
                  //           height: 1.2),
                  //     ),
                  //   ),
                  // )
                ],
              )),
          _itemThongTin(
              icon: Assets.iconsIcCalendar,
              left: 'Lịch học'.tr,
              right: AppText(
                data.lich_hoc ?? '',
                style:
                    AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
              )),
          _itemThongTin(

              icon: Assets.iconsEditCalendar,
              left: 'Thời gian'.tr,
              right: AppText(
                data.thoi_gian ?? '',
                style:
                    AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
              )),
          _itemThongTin(
              icon: Assets.iconsIcTime,
              left: 'Ca'.tr,
              right: Row(
                children: [
                  AppText(
                    data.chonCa ?? '',
                    style: AppStyle.DEFAULT_14
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  SvgPicture.asset(
                    Assets.iconsTag,
                    height: 19.sp,
                    color: AppColors.primary,
                  ),
                  Container(
                    height: 19.sp,
                    padding: EdgeInsets.only(right: 8.sp),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(3.sp))),
                    child: Center(
                      child: AppText(
                        '${data.so_gio} giờ',
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                            height: 1.2),
                      ),
                    ),
                  )
                ],
              )),
          _itemThongTin(
              icon: Assets.iconsIcLocation,
              left: 'Địa chỉ'.tr,
              right: AppText(
                data.dia_chi ?? '',
                style:
                    AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }

  Widget _itemThongTin(
      {required String icon, required String left, required Widget right}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 8.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.sp),
                    child: SvgPicture.asset(
                      icon,
                      width: 14.sp,
                      height: 14.sp,
                      color: AppColors.textBlack,
                    ),
                  ),
                  SizedBox(
                    width: 6.sp,
                  ),
                  Expanded(
                    child: AppText(
                      left,
                      style: AppStyle.DEFAULT_14,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: right),
        ],
      ),
    );
  }

  Widget _contact(GiaoVien data) {
    return Container(
      margin: EdgeInsets.only(top: 14.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 10,
                color: AppColors.blue2.withOpacity(0.15))
          ]),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Liên hệ với Quản lý ${data.hoten ?? ''}',
            style: AppStyle.DEFAULT_16_BOLD,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            children: [
              Expanded(
                  child: DButton(
                text: 'Gọi điện'.tr,
                left: SvgPicture.asset(
                  Assets.iconsCall,
                  width: 34.sp,
                  height: 34.sp,
                  color: AppColors.white,
                ),
                padH: 2.sp,
                padV: 2.sp,
                background: AppColors.blue,
                borderColor: AppColors.blue,
                onClick: () {
                  onClickCall(data.dien_thoai ?? '');
                },
              )),
              SizedBox(
                width: 7.sp,
              ),
              Expanded(
                  child: DButton(
                text: 'Nhắn tin'.tr,
                left: SvgPicture.asset(
                  Assets.iconsChat,
                  width: 34.sp,
                  height: 34.sp,
                  color: AppColors.white,
                ),
                padH: 2.sp,
                padV: 2.sp,
                background: AppColors.primary,
                borderColor: AppColors.primary,
                onClick: () {
                  onClickMess(data.dien_thoai ?? '');
                },
              ))
            ],
          )
        ],
      ),
    );
  }

  onClickCall(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    await launchUrl(launchUri);
  }

  onClickMess(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phone,
    );
    await launchUrl(launchUri);
  }

  onClickHuy() {
    NotificationDialog.createSimpleDialog(
        context: context,
        titleButton1: 'OK',
        titleButton2: 'Hủy',
        content: 'Bạn có chắc chắn muốn hủy đơn này?',
        onTap1: (){
         Get.back();
         NotificationDialog.createDialog(context: context, titleButton1: "HỦY",widgetContent:  Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             AppText('Nhập lí do',style: AppStyle.DEFAULT_16,),
             SizedBox(height: 5.h,),
             DInput(controller: _liDo, hintText: 'Nhập lí do',maxLine: 3,borderRadius: 8,),
             SizedBox(height: 20.h,),
             DButton(text: 'HỦY ĐƠN', onClick: (){
               _historyController.huyDon(id: widget.id,liDo: _liDo.text);
             })
           ],
         ));

        },
        type: 2,
        numberButton: 2);
  }
}

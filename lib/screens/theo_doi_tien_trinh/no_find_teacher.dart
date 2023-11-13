import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/container_text.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/app_values.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DTitleIcon.dart';
import '../../widgets/app_text.dart';

class NoFindTeacher extends StatelessWidget {
  const NoFindTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _thongTinKhoaHoc(),
      ],
    );
  }

  Widget _thongTinKhoaHoc() {
    return GetX<TheoDoiTienTrinhController>(builder: (controller) {
      if (controller.donHuy.value != null) {
        return Container(
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
          padding: EdgeInsets.only(top: 20.sp, bottom: 5.sp),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  children: [
                    Container(
                      width: 34.sp,
                      height: 34.sp,
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(7.sp)),
                      child: SvgPicture.asset(
                        Assets.iconsIcItemHistory,
                      ),
                    ),
                    SizedBox(
                      width: 8.sp,
                    ),
                    Expanded(
                      flex: 3,
                      child: RichText(
                        text: TextSpan(
                          text: 'Mã đơn hàng: ',
                          style: AppStyle.DEFAULT_14.copyWith(height: 1.3),
                          children: <TextSpan>[
                            TextSpan(
                                text: controller.donHuy.value!.ma_don_hang??'',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    ContainerText(text: controller.donHuy.value!.trang_thai??'', color: AppColors.orange)
                  ],
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Container(
                width: Get.width,
                color: AppColors.grayF2,
                height: 1,
              ),
              SizedBox(
                height: 15.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
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
                          controller.donHuy.value!.dichVu??'',
                          style: AppStyle.DEFAULT_14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary),
                        )),
                    _itemThongTin(
                        icon: Assets.iconsIcTrangThai,
                        left: 'Trạng thái'.tr,
                        right: RichText(
                          text: TextSpan(
                            text: controller.donHuy.value!.soBuoiHoanThanh??'',
                            style: AppStyle.DEFAULT_14.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500),
                            // children: <TextSpan>[
                            //   TextSpan(
                            //       text: '5',
                            //       style: TextStyle(color: AppColors.textBlack)),
                            // ],
                          ),
                        )),
                    _itemThongTin(
                        icon: Assets.iconsIcHocPhi,
                        left: 'Học phí '.tr,
                        right: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '${AppValue.format_money(double.parse(controller.donHuy.value!.tong_tien??'0'))} ',
                                style: AppStyle.DEFAULT_14
                                    .copyWith(fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'đ',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            SvgPicture.asset(
                              Assets.iconsTag,
                              height: 19.sp,
                              color: AppColors.green,
                            ),
                            Container(
                              height: 19.sp,
                              padding: EdgeInsets.only(right: 8.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(3.sp))),
                              child: Center(
                                child: AppText(
                                  controller.donHuy.value!.trang_thai_thanh_toan??'',
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
                        icon: Assets.iconsIcCalendar,
                        left: 'Lịch học'.tr,
                        right: AppText(
                          controller.donHuy.value!.lich_hoc??'',
                          style: AppStyle.DEFAULT_14
                              .copyWith(fontWeight: FontWeight.w500),
                        )),
                    _itemThongTin(
                        icon: Assets.iconsEditCalendar,
                        left: 'Thời gian'.tr,
                        right: AppText(
                          controller.donHuy.value!.thoi_gian??'',
                          style: AppStyle.DEFAULT_14
                              .copyWith(fontWeight: FontWeight.w500),
                        )),
                    _itemThongTin(
                        icon: Assets.iconsIcTime,
                        left: 'Ca'.tr,
                        right: Row(
                          children: [
                            AppText(
                              controller.donHuy.value!.chonCa??'',
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
                                  '${controller.donHuy.value!.so_gio} giờ',
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
                          controller.donHuy.value!.dia_chi??'',
                          style: AppStyle.DEFAULT_14
                              .copyWith(fontWeight: FontWeight.w500),
                        )),
                    // _itemThongTin(
                    //     icon: Assets.iconsIcCalendar,
                    //     left: 'Nội dung khảo sát'.tr,
                    //     right: DButton(
                    //         text: 'Nội dung khảo sát',
                    //         right: SvgPicture.asset(
                    //           Assets.iconsNext,
                    //           color: AppColors.primary,
                    //         ),
                    //         textStyle: AppStyle.DEFAULT_14.copyWith(
                    //             fontWeight: FontWeight.w600,
                    //             color: AppColors.primary,
                    //             height: 1.2),
                    //         background: AppColors.white,
                    //         padH: 8.sp,
                    //         onClick: onClickNoiDungKhaoSat)),
                  ],
                ),
              )
            ],
          ),
        );
      } else {
        return SizedBox();
      }
    });
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

  onClickNoiDungKhaoSat() {
    AppNavigator.navigateNoiDungKhaoSat('');
  }
}

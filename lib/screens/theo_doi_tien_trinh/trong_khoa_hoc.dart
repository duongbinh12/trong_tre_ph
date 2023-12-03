import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_values.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/chi_tiet_ca_day.dart';
import 'package:trong_tre/services/entity/thong_tin_giao_vien_response.dart';
import 'package:trong_tre/services/entity/thong_tin_khoa_hoc_response.dart';
import 'package:trong_tre/widgets/DTitleIcon.dart';
import 'package:trong_tre/widgets/DTittle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';

class TrongKhoaHoc extends StatefulWidget {
  const TrongKhoaHoc({super.key,required this.id});
  final int id;

  @override
  State<TrongKhoaHoc> createState() => _TrongKhoaHocState();
}

class _TrongKhoaHocState extends State<TrongKhoaHoc> {
  TheoDoiTienTrinhController _theoDoiTienTrinhController =
      Get.find<TheoDoiTienTrinhController>();
  int? id;

  @override
  void initState() {
    print("Dương ${widget.id}");
    if (widget.id != -1) {
      id = widget.id;
      Future.delayed(Duration(seconds: 0), () {
        _theoDoiTienTrinhController.getThongTinKhoaHoc(id: id!, buoi: 1);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetX<TheoDoiTienTrinhController>(builder: (controller) {
        if (controller.thongTinKhoaHoc.value != null) {
          ThongTinKhoaHocData data = controller.thongTinKhoaHoc.value!;
          return Column(
            children: [
              _teacher(data.giaoVien!, data.ma_don_hang ?? ''),
              SizedBox(
                height: 20.sp,
              ),
              _thongTinKhoaHoc(data),
              SizedBox(
                height: 20.sp,
              ),
              ChiTietCaDay(
                tienDo: data.tienDo!,
                giaoVien: data.giaoVien!,
                sdt: data.sdtQuanLy!,
                avatar: data.giaoVien!.anh_nguoi_dung ?? '',
                idKh: id!,
              ),
              SizedBox(
                height: 30 + MediaQuery.of(context).viewPadding.bottom,
              )
            ],
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }

  Widget _teacher(GiaoVien giaoVien, String maDon) {
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.grayF2))),
            child: Row(
              children: [
                Container(
                  width: 26.sp,
                  height: 26.sp,
                  padding: EdgeInsets.all(3.sp),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(7.sp)),
                  child: SvgPicture.asset(
                    Assets.iconsIcItemHistory,
                  ),
                ),
                SizedBox(
                  width: 9.sp,
                ),
                AppText(
                  'Mã đơn: ',
                  style: AppStyle.DEFAULT_14,
                ),
                AppText(
                  maDon,
                  style:
                      AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
            child: Row(
              children: [
                WidgetNetworkCacheImage(
                  image: giaoVien.anh_nguoi_dung ?? '',
                  width: 121.sp,
                  height: 121.sp,
                  fit: BoxFit.cover,
                  borderRadius: 100,
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Expanded(
                    child: Container(
                  height: 121.sp,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.orange),
                                borderRadius: BorderRadius.circular(50)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 2.sp),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 15.sp,
                                  color: AppColors.orange,
                                ),
                                SizedBox(
                                  width: 3.sp,
                                ),
                                AppText(
                                  giaoVien.danh_gia ?? '',
                                  style:
                                      AppStyle.DEFAULT_12.copyWith(height: 1.3),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 3.5.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(50.sp)),
                              child: AppText(
                                'Đang trong khóa học',
                                textAlign: TextAlign.center,
                                style: AppStyle.DEFAULT_12.copyWith(
                                    height: 1.2, color: AppColors.primary),
                              ),
                            ),
                          )
                        ],
                      ),
                      AppText(
                        giaoVien.hoten ?? '',
                        style: AppStyle.DEFAULT_16_BOLD.copyWith(height: 1.1),
                      ),
                      AppText(
                        giaoVien.trinh_do ?? '',
                        style: AppStyle.DEFAULT_14
                            .copyWith(height: 1.2, color: AppColors.gray7D),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              if (giaoVien.dien_thoai != null) {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path: giaoVien.dien_thoai ?? '',
                                );
                                await launchUrl(launchUri);
                              }
                            },
                            child: SvgPicture.asset(
                              Assets.iconsCall,
                              width: 38.sp,
                              height: 38.sp,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(
                            width: 8.sp,
                          ),
                          InkWell(
                            onTap: () async {
                              if (giaoVien.dien_thoai != null) {
                                final Uri launchUri = Uri(
                                  scheme: 'sms',
                                  path: giaoVien.dien_thoai ?? '',
                                );
                                await launchUrl(launchUri);
                              }
                            },
                            child: SvgPicture.asset(
                              Assets.iconsChat,
                              width: 38.sp,
                              height: 38.sp,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 1,
            color: AppColors.grayF2,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
            child: Row(
              children: [
                Expanded(
                    child: AppText(
                  'Thông tin giáo viên',
                  style:
                      AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
                Expanded(
                    child: DButton(
                        text: 'Xem chi tiết'.tr,
                        right: SvgPicture.asset(Assets.iconsNext),
                        textStyle: AppStyle.DEFAULT_14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            height: 1.2),
                        padH: 6.sp,
                        onClick: () {
                          onClickXemChiTietGV(giaoVien.id!);
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _thongTinKhoaHoc(ThongTinKhoaHocData data) {
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
                        TextSpan(
                            text: 'đ',
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
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
                        data.trang_thai_thanh_toan ?? '',
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
          _itemThongTin(
              icon: Assets.iconsIcCalendar,
              left: 'Nội dung khảo sát'.tr,
              right: DButton(
                  text: 'Nội dung khảo sát',
                  right: SvgPicture.asset(
                    Assets.iconsNext,
                    color: AppColors.primary,
                  ),
                  textStyle: AppStyle.DEFAULT_14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      height: 1.2),
                  background: AppColors.white,
                  padH: 8.sp,
                  onClick: () {
                    onClickNoiDungKhaoSat(data.noi_dung_khao_sat ?? '');
                  })),
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

  onClickXemChiTietGV(int id) {
    AppNavigator.navigateThongTinGiaoVien(id);
  }

  onClickNoiDungKhaoSat(String url) {
    AppNavigator.navigateNoiDungKhaoSat(url);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/service/widget/progress.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/services/entity/thong_tin_giao_vien_response.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';
import 'package:trong_tre/widgets/widget_handle.dart';
import 'package:url_launcher/url_launcher.dart';

class Servey extends StatefulWidget {
  const Servey({super.key, required this.id});

  final int id;

  @override
  State<Servey> createState() => _ServeyState();
}

class _ServeyState extends State<Servey> {
  TheoDoiTienTrinhController _theoDoiTienTrinhController =
      Get.find<TheoDoiTienTrinhController>();
  ThongTinGiaoVienData data = Get.arguments[2];

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        children: [
          _teacher(),
          SizedBox(
            height: 7.sp,
          ),
          _contact(),
          SizedBox(
            height: 100.sp,
          ),
          DButton(
              text: 'Xem nội dung khảo sát'.tr,
              right: SvgPicture.asset(
                Assets.iconsUpload,
                color: AppColors.primary,
              ),
              background: AppColors.grayF5,
              textColor: AppColors.primary,
              onClick: onClickKhaoSat),
          SizedBox(
            height: 17.sp,
          ),
          Row(
            children: [
              Expanded(
                  child: DButton(
                text: 'Từ chối'.tr,
                textColor: AppColors.textBlack,
                background: AppColors.grayE5,
                borderColor: AppColors.grayE5,
                onClick: onClickTuChoi,
              )),
              SizedBox(
                width: 15.sp,
              ),
              Expanded(
                  child: DButton(
                text: 'Đồng thuận'.tr,
                onClick: onClickDongThuan,
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget _teacher() {
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
            child: Row(
              children: [
                WidgetNetworkCacheImage(
                  image: data.giaoVien!.anh_nguoi_dung ?? '',
                  width: 91.sp,
                  height: 91.sp,
                  fit: BoxFit.cover,
                  borderRadius: 100,
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Expanded(
                    child: Container(
                  height: 91.sp,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: AppColors.orange),
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
                              data.giaoVien!.danh_gia ?? '',
                              style: AppStyle.DEFAULT_12.copyWith(height: 1.3),
                            ),
                          ],
                        ),
                      ),
                      AppText(
                        data.giaoVien!.hoten ?? '',
                        style: AppStyle.DEFAULT_16_BOLD.copyWith(height: 1.1),
                      ),
                      AppText(
                        'Giáo viên',
                        style: AppStyle.DEFAULT_14
                            .copyWith(height: 1.2, color: AppColors.gray7D),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.iconsCall,
                            width: 20.sp,
                            height: 20.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          AppText(
                            data.giaoVien!.dien_thoai ?? '',
                            style: AppStyle.DEFAULT_14.copyWith(
                                height: 1.2, fontWeight: FontWeight.w500),
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
                        onClick: onClickXemChiTietGV))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _contact() {
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
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Liên hệ với Quản lý vận hành',
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
                onClick: onClickCall,
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
                onClick: onClickMess,
              ))
            ],
          )
        ],
      ),
    );
  }

  onClickXemChiTietGV() {
    AppNavigator.navigateThongTinGiaoVien(data.giaoVien!.id!);
  }

  onClickCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: data.sdtQuanLy!,
    );
    await launchUrl(launchUri);
  }

  onClickKhaoSat() {
    AppNavigator.navigateNoiDungKhaoSat(data.noi_dung_khao_sat ?? '');
  }

  onClickDongThuan() {
    _theoDoiTienTrinhController.dongThuan(id: widget.id);
  }

  onClickMess() async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: data.sdtQuanLy!,
    );
    await launchUrl(launchUri);
  }

  onClickTuChoi() {
    NotificationDialog.createSimpleDialog(
        context: context,
        titleButton1: "OK",
        numberButton: 2,
        content: "Bạn có chắc chắn từ chối giáo viên này?",
        type: 2,
        onTap1: (){
          Get.back();
          _theoDoiTienTrinhController.tuChoi(id: widget.id);
        },
        titleButton2: "Hủy");
  }
}

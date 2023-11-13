import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/widget_contact.dart';
import 'package:trong_tre/services/entity/thong_tin_giao_vien_response.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class DanhGiaGiaoVien extends StatefulWidget {
  const DanhGiaGiaoVien({super.key});

  @override
  State<DanhGiaGiaoVien> createState() => _DanhGiaGiaoVienState();
}

class _DanhGiaGiaoVienState extends State<DanhGiaGiaoVien> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  TextEditingController _noteController = TextEditingController();
  TheoDoiTienTrinhController _theoDoiTienTrinhController =
      Get.find<TheoDoiTienTrinhController>();

  GiaoVien data = Get.arguments[0];
  int id=Get.arguments[1];
  double danhGia = 0;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        keyScaffold: ScaffoldKey,
        backgroundColor: AppColors.grayF5,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Column(
          children: [
            DHeaderShadow(
              title: 'Đánh giá giáo viên'.tr,
              showMenu: true,
              keyMenu: ScaffoldKey,
            ),
            SizedBox(
              height: 26.sp,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    _teacher(),
                    SizedBox(
                      height: 29.sp,
                    ),
                    AppText(
                      'Đánh giá Giáo viên này'.tr,
                      style: AppStyle.DEFAULT_18_BOLD,
                    ),
                    AppText(
                      '(Cho chúng tôi biết về suy nghĩ của bạn)'.tr,
                      style: AppStyle.DEFAULT_14.copyWith(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.sp),
                      itemSize: 32.sp,
                      tapOnlyMode: true,
                      itemBuilder: (context, _) => SvgPicture.asset(
                        Assets.iconsStar,
                        width: 32.sp,
                        height: 32.sp,
                      ),
                      onRatingUpdate: (rating) {
                        danhGia = rating;
                      },
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    DInput(
                      controller: _noteController,
                      hintText: 'Viết đánh giá',
                      maxLine: 5,
                      borderRadius: 10.sp,
                      bgColor: AppColors.white,
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    DButton(text: 'Gửi', onClick: onClickSend),
                    SizedBox(
                      height: 50.sp,
                    ),
                    WidgetContact()
                  ],
                ),
              ),
            ))
          ],
        ));
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
                  image:
                      data.anh_nguoi_dung??'',
                  width: 97.sp,
                  height: 97.sp,
                  fit: BoxFit.cover,
                  borderRadius: 100,
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Expanded(
                    child: Container(
                  height: 97.sp,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              data.danh_gia??'',
                              style: AppStyle.DEFAULT_12.copyWith(height: 1.3),
                            ),
                          ],
                        ),
                      ),
                      AppText(
                        data.hoten??'',
                        style: AppStyle.DEFAULT_16_BOLD.copyWith(height: 1.1),
                      ),
                      AppText(
                        data.trinh_do??'',
                        style: AppStyle.DEFAULT_14
                            .copyWith(height: 1.2, color: AppColors.gray7D),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  onClickSend() {
    if (danhGia != 0) {
      _theoDoiTienTrinhController.danhGiaGiaoVien(
          id: id, danhGia: danhGia, noiDung: _noteController.text);
    } else {
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: "OK",
          type: 2,
          content: "Hãy chọn số sao đánh giá",
          numberButton: 1);
    }
  }
}

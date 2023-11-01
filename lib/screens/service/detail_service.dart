import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/services/entity/chi_tiet_dich_vu_response.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../home/menu.dart';

class DetailService extends StatefulWidget {
  const DetailService({super.key});

  @override
  State<DetailService> createState() => _DetailServiceState();
}

class _DetailServiceState extends State<DetailService> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
  ServiceController _serviceController=Get.find<ServiceController>();

  List<String> arrCamKet = [
    'Nhân thân tốt',
    'Quản lý chuyên môn',
    'Đào tạo bài bản',
    'Phương pháp hiện đại',
    'Ổn định nhân sự',
  ];
  int id=Get.arguments;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _serviceController.getDetailService(id: id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        keyScaffold: ScaffoldKey,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Stack(
          children: [
            Container(width: Get.width, height: Get.height,),
            _header(),
            Positioned(
              left: 0,
              right: 0,
              top: Get.height * (259 / 852) - 25.sp,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.sp))
                ),
                padding: EdgeInsets.only(top: 30.sp),
                child: SingleChildScrollView(
                  child: GetX<ServiceController>(
                    builder: (controller) {
                      if(controller.detailService.value!=null) {
                        return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _first(controller.detailService.value!),
                          SizedBox(height: 25.sp,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  'Quyền lợi'.tr,
                                  style: AppStyle.DEFAULT_18_BOLD,
                                ),
                                SizedBox(height: 10.sp,),
                                Row(
                                  children: List.generate(controller.detailService.value!.quyenLoi!.length, (index) => Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    child: _itemQuyenLoi(
                                        Assets.imagesQuyenLoi1, controller.detailService.value!.quyenLoi![index].name??'',
                                        Color(0xffFF9383), Color(0xffFC4D32)),
                                  )),
                                ),
                                SizedBox(height: 45.sp,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            color: AppColors.blue2.withOpacity(0.15)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15.sp)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          WidgetContainerImage(
                                            image: Assets.imagesBgService,
                                            width: Get.width,
                                            height: 67.sp,
                                            fit: BoxFit.cover,
                                            borderRadius: BorderRadius.circular(
                                                15.sp),
                                          ),
                                          Positioned(
                                            left: 15.sp, top: 0, bottom: 0,
                                            child: Center(
                                              child: AppText(
                                                'Giá trị',
                                                style: AppStyle.DEFAULT_20_BOLD
                                                    .copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: AppColors.white),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              right: 26.sp, bottom: 7.sp,
                                              child: WidgetContainerImage(
                                                image: Assets.imagesGiaTri,
                                                width: 77.sp, height: 70.sp,
                                                fit: BoxFit.contain,
                                              ))
                                        ],
                                      ),
                                      SizedBox(height: 15.sp,),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 13.sp),
                                        child: AppText(
                                          controller.detailService.value!.gia_tri??'',
                                          style: AppStyle.DEFAULT_14,
                                        ),
                                      ),
                                      SizedBox(height: 27.sp,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 56.sp,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            color: AppColors.blue2.withOpacity(0.15)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15.sp)
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          WidgetContainerImage(
                                            image: Assets.imagesBgService,
                                            width: Get.width,
                                            height: 67.sp,
                                            fit: BoxFit.cover,
                                            borderRadius: BorderRadius.circular(
                                                15.sp),
                                          ),
                                          Positioned(
                                            right: 15.sp, top: 0, bottom: 0,
                                            child: Row(
                                              children: [
                                                AppText(
                                                  'Cam kết',
                                                  style: AppStyle.DEFAULT_20_BOLD
                                                      .copyWith(
                                                      fontWeight: FontWeight.w800,
                                                      color: AppColors.white),
                                                ),
                                                SizedBox(width: 10.sp,),
                                                SvgPicture.asset(
                                                  Assets.iconsCheck,
                                                  width: 24.sp,
                                                  height: 24.sp,
                                                )
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                              left: 22.sp, bottom: 0.sp,
                                              child: WidgetContainerImage(
                                                image: Assets.imagesCamKet,
                                                width: 75.sp, height: 94.sp,
                                                fit: BoxFit.contain,
                                              ))
                                        ],
                                      ),
                                      SizedBox(height: 15.sp,),
                                      Wrap(
                                        direction: Axis.horizontal,
                                        spacing: 15.sp,
                                        runSpacing: 10.sp,
                                        children: List.generate(
                                            controller.detailService.value!.cam_ket!.length, (index) =>
                                            Container(
                                              width: (Get.width - 20.sp - 20.sp -
                                                  15.sp - 15.sp - 15.sp) / 2,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets.iconsFirstLine,
                                                    width: 16.sp,
                                                    height: 16.sp,
                                                  ),
                                                  SizedBox(width: 5.sp,),
                                                  AppText(
                                                    controller.detailService.value!.cam_ket![index],
                                                    style: AppStyle.DEFAULT_14
                                                        .copyWith(
                                                        fontWeight: FontWeight
                                                            .w600),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 22.sp,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30.sp,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            color: AppColors.blue2.withOpacity(0.15)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15.sp)
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          WidgetContainerImage(
                                            image: Assets.imagesBgService,
                                            width: Get.width,
                                            height: 67.sp,
                                            fit: BoxFit.cover,
                                            borderRadius: BorderRadius.circular(
                                                15.sp),
                                          ),
                                          Positioned(
                                            left: 15.sp, top: 0, bottom: 0,
                                            child: Center(
                                              child: AppText(
                                                'Hợp đồng dịch vụ',
                                                style: AppStyle.DEFAULT_20_BOLD
                                                    .copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: AppColors.white),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              right: 27.sp, bottom: 0.sp,
                                              child: WidgetContainerImage(
                                                image: Assets.imagesHopDong,
                                                width: 79.sp, height: 59.sp,
                                                fit: BoxFit.contain,
                                              ))
                                        ],
                                      ),
                                      SizedBox(height: 15.sp,),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 13.sp),
                                        child: AppText(
                                          'Lưu ý đọc kỹ Điều khoản và Điều kiện của Hợp đồng dịch vụ trước khi đăng ký.',
                                          style: AppStyle.DEFAULT_14,
                                        ),
                                      ),
                                      SizedBox(height: 20.sp,),
                                      Container(
                                        width: (Get.width - 20.sp - 20.sp) / 2,
                                        child: DButton(
                                            text: 'Chi tiết hợp đồng',
                                            padH: 8.sp,
                                            textStyle: AppStyle.DEFAULT_14.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white,
                                                height: 1.3),
                                            right: SvgPicture.asset(
                                                Assets.iconsUpload
                                            ),
                                            onClick: (){
                                              onClickChiTietHopDong(controller.detailService.value!.hop_dong_dich_vu??'');
                                            }),
                                      ),
                                      SizedBox(height: 20.sp,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 120.sp,)
                              ],
                            ),
                          )
                        ],
                      );
                      } else return SizedBox();
                    }
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0, right: 0, bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: AppColors.blue2.withOpacity(0.15)
                      )
                    ],
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.sp))
                ),
                padding: EdgeInsets.only(left: 20.sp,
                    right: 20.sp,
                    top: 20.sp,
                    bottom: 20.sp + MediaQuery
                        .of(context)
                        .viewPadding
                        .bottom),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: RichText(
                        text: TextSpan(
                          text: 'Chỉ từ ',
                          style: AppStyle.DEFAULT_16.copyWith(
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(text: '350,000 ', style: AppStyle
                                .DEFAULT_18_BOLD.copyWith(
                                color: AppColors.primary)),
                            TextSpan(text: 'đ', style: AppStyle.DEFAULT_18_BOLD
                                .copyWith(color: AppColors.primary,
                                decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: DButton(
                            text: 'Đăng ký'.tr,
                            right: SvgPicture.asset(
                                Assets.iconsNext
                            ),
                            onClick: onClickDangKy))
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _header() {
    return Container(
      child: Stack(
        children: [
          WidgetContainerImage(
            image: Assets.imagesSlideService,
            width: Get.width,
            height: Get.height * (259 / 852),
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 0.sp, right: 0.sp, top: MediaQuery
              .of(context)
              .viewPadding
              .top + 15.sp,
              child: DHeader(title: 'Dịch vụ'.tr,
                colorTitle: AppColors.white,
                showMenu: true,
                keyMenu: ScaffoldKey,))
        ],
      ),
    );
  }

  Widget _first(ChiTietDichVuData data) {
    return Container(
      padding: EdgeInsets.only(bottom: 23.sp, left: 20.sp, right: 20.sp),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: AppColors.grayF2)
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Dịch vụ'.tr,
                  style: AppStyle.DEFAULT_16_BOLD,
                ),
                SizedBox(height: 12.sp,),
                AppText(
                  data.ten_dich_vu??'',
                  style: AppStyle.DEFAULT_22_BOLD.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      height: 1),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(50.sp)
            ),
            padding: EdgeInsets.symmetric(horizontal: 11.sp, vertical: 8.sp),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsGroup,
                  width: 15.sp,
                  height: 11.sp,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 5.sp,),
                AppText(
                  data.doTuoi??'',
                  style: AppStyle.DEFAULT_14.copyWith(
                      fontWeight: FontWeight.w600, height: 1),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemQuyenLoi(String image, String text, Color color1, Color color2) {
    return Stack(
      children: [
        Container(
          width: (Get.width - 20.sp - 20.sp - 10.sp - 10.sp - 10.sp) / 4,
          height: 112.sp,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color1,
                    color2
                  ]
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: AppColors.blue2.withOpacity(0.15)
                )
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.sp),
                  topRight: Radius.circular(25.sp),
                  bottomLeft: Radius.circular(12.sp),
                  bottomRight: Radius.circular(12.sp)
              )
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidgetContainerImage(
                image: image,
                width: 45.sp,
                height: 45.sp,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 7.sp,),
              SizedBox(
                height: 12.sp * 1.2 * 2 + 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text,
                      textAlign: TextAlign.center,
                      style: AppStyle.DEFAULT_12_BOLD.copyWith(
                          color: AppColors.white, height: 1.2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 0, right: 0, bottom: 6.sp,
          child: Center(
            child: Container(
              width: 32.sp,
              height: 4.sp,
              decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(21.sp)
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _itemQuyenLoi2({required String title}) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              WidgetContainerImage(
                image: Assets.imagesBgService,
                width: Get.width,
                height: 67.sp,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(15.sp),
              ),
              AppText(
                title,
                style: AppStyle.DEFAULT_20_BOLD.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  onClickChiTietHopDong(String hop_dong) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(minWidth: Get.width,maxHeight: Get.height*0.7),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp)),
          color: AppColors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 13.sp,),
            Container(
              width: 38.sp,
              height: 4.sp,
              decoration: BoxDecoration(
                color: AppColors.grayE5,
                borderRadius: BorderRadius.circular(50)
              ),
            ),
            SizedBox(height: 20.sp,),
            AppText(
              'Hợp đồng dịch vụ'.tr,
              style: AppStyle.DEFAULT_20_BOLD,
            ),
            SizedBox(height: 18.sp,),
            Expanded(
              child: SingleChildScrollView(
                child: AppText(hop_dong),
              ),
            ),
            SizedBox(height: 15.sp,),
            DButton(text: 'Đăng ký', onClick: onClickDangKy),
            SizedBox(height: 30.sp+MediaQuery.of(context).viewPadding.bottom,)
          ],
        ),
      );
    },);
  }

  onClickDangKy() {
    AppNavigator.navigateSignUpService(id);
  }
}

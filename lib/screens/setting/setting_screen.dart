import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/screens/setting/widget_support.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DHeader.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
  LoginController _loginController = Get.find<LoginController>();
  SettingController _settingController = Get.find<SettingController>();

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 0), () {
    //   if (_loginController.token != null) {
    //     _settingController.getMyInfo();
    //   }
    // });
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
            WidgetContainerImage(
              image: Assets.imagesBgPrimary,
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
                child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top + 20.sp,
                ),
                DHeader(
                    title: 'Cài đặt',
                    colorTitle: AppColors.white,
                    noBack: true,
                    showMenu: true,
                    keyMenu: ScaffoldKey),
                SizedBox(
                  height: 60.sp,
                ),
                Expanded(
                    child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.sp))),
                      padding: EdgeInsets.only(
                          top: 30.sp, left: 20.sp, right: 20.sp),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 95.sp,
                          ),
                          _loginController.token != null
                              ? _item(Assets.iconsKhieuNai, 'Khiếu nại/ Góp ý',
                                  onClick: () {
                                  AppNavigator.navigateComplain();
                                })
                              : SizedBox(),
                          _loginController.token != null
                              ? SizedBox(
                                  height: 10.sp,
                                )
                              : SizedBox(),
                          _item(Assets.iconsChiaSe, 'Chia sẻ Trông trẻ Pro',onClick: (){
                            try{
                              Share.share('${_loginController.dataLogin.value!.web}');
                            }catch(e){
                              print("error share ${e}");
                            }
                          }),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsTroGiup, 'Trợ giúp',
                              onClick: onClickSupport),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsTaiNguyen, 'Tham khảo/ Tài nguyên',onClick: ()async{
                            if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.tai_nguyen??''))) {
                            throw Exception('Could not launch tài nguyên');
                            }
                          }),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsCongDong, 'Cộng đồng',
                              right: Row(
                                children: [
                                  InkWell(
                                    onTap: ()async{
                                      if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.facebook??''))) {
                                        throw Exception('Could not launch tài nguyên');
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.sp),
                                      child: SvgPicture.asset(
                                        Assets.iconsFb2,
                                        width: 28.sp,
                                        height: 28.sp,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: ()async{
                                      if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.youtube??''))) {
                                        throw Exception('Could not launch tài nguyên');
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.sp),
                                      child: SvgPicture.asset(
                                        Assets.iconsYoutube,
                                        width: 28.sp,
                                        height: 28.sp,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: ()async{
                                      if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.web??''))) {
                                        throw Exception('Could not launch tài nguyên');
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.sp),
                                      child: SvgPicture.asset(
                                        Assets.iconsWeb,
                                        width: 28.sp,
                                        height: 28.sp,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _loginController.token != null?
                          _item(Assets.iconsDangXuat, 'Xóa tài khoản',
                              onClick: onClickDelete, right: SizedBox()): SizedBox(),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _loginController.token != null
                              ? _item(Assets.iconsDangXuat, 'Đăng xuất',
                                  onClick: onClickDangXuat, right: SizedBox())
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -30.sp,
                      left: 20.sp,
                      right: 20.sp,
                      child: _info(),
                    )
                  ],
                ))
              ],
            ))
          ],
        ));
  }
  onClickDelete() {
    NotificationDialog.createSimpleDialog(
        context: context,
        titleButton1: "OK",
        type: 2,
        content: "Xóa tài khoản sẽ mất khoảng 2-7 ngày để được hệ thống xem xét. Bạn chắc chắn muốn xóa tài khoản?",
        titleButton2: "Hủy",
        onTap1: (){
          _settingController.logOut((){
            _loginController.token=null;
            AppNavigator.navigateLogin();
          });
        },
        numberButton: 2);
  }

  Widget _info() {
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
      child: _loginController.token == null
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: InkWell(
                onTap: () {
                  AppNavigator.navigateLogin();
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Hãy ',
                      style: AppStyle.DEFAULT_16,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'đăng nhập',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary)),
                        TextSpan(text: ' để sử dụng tính năng này!'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : GetX<SettingController>(builder: (controller) {
              if (controller.myInfo.value != null) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.sp, horizontal: 15.sp),
                      child: Row(
                        children: [
                          WidgetNetworkCacheImage(
                            image:
                                controller.myInfo.value!.anh_nguoi_dung ?? '',
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: AppText(
                                        controller.myInfo.value!.hoten ?? '',
                                        style: AppStyle.DEFAULT_16_BOLD
                                            .copyWith(height: 1.1),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          AppNavigator.navigateProfile();
                                        },
                                        child:
                                            SvgPicture.asset(Assets.iconsEdit))
                                  ],
                                ),
                                AppText(
                                  controller.myInfo.value!.vai_tro ?? '',
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      height: 1.2, color: AppColors.gray7D),
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
                                      controller.myInfo.value!.dien_thoai ?? '',
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          height: 1.2,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
    );
  }

  Widget _item(String icon, String title, {Widget? right, Function? onClick}) {
    return InkWell(
      onTap: () {
        if (onClick != null) onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 8.5.sp),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                  blurRadius: 10,
                  color: AppColors.blue2.withOpacity(0.1))
            ]),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 30.sp,
              height: 30.sp,
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
                child: AppText(
              title,
              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
            )),
            SizedBox(
              width: 10.sp,
            ),
            right ??
                RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    Assets.iconsBack,
                    width: 8.sp,
                    height: 8.sp,
                    fit: BoxFit.contain,
                  ),
                )
          ],
        ),
      ),
    );
  }

  onClickSupport() {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxHeight: Get.height * 0.7),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.sp))),
            padding: EdgeInsets.only(
                left: 20.sp,
                right: 20.sp,
                top: 13.sp,
                bottom: 30 + MediaQuery.of(context).viewPadding.bottom),
            child: Column(
              children: [
                Container(
                  width: 38.sp,
                  height: 4.sp,
                  decoration: BoxDecoration(
                      color: AppColors.grayE5,
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                AppText(
                  'Liên hệ và trợ giúp'.tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.DEFAULT_20_BOLD,
                ),
                SizedBox(
                  height: 22.sp,
                ),
                Expanded(child: SingleChildScrollView(child: WidgetSupport())),
                SizedBox(
                  height: 40.sp,
                ),
                DButton(
                    text: 'Đóng',
                    onClick: () {
                      Get.back();
                    })
              ],
            ));
      },
    );
  }

  onClickDangXuat() {
    NotificationDialog.createSimpleDialog(
        context: context,
        titleButton1: "OK",
        titleButton2: "Hủy",
        content: "Bạn có chắc chắn muốn đăng xuất không?",
        onTap1: (){
          _settingController.logOut((){
            _loginController.token=null;
            AppNavigator.navigateLogin();
          });
        },
        numberButton: 1);
  }
}

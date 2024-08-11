import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/widget_dialog.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final SettingController _settingController=Get.find<SettingController>();
  final LoginController _loginController=Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top + 20.sp,
              ),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),
              GetX<SettingController>(
                  builder: (controller) {
                    if(controller.myInfo.value!=null) {
                      return Column(
                        children: [
                          WidgetNetworkImage(
                            image:
                            controller.myInfo.value!.anh_nguoi_dung??'',
                            width: 97.sp,
                            height: 97.sp,
                            fit: BoxFit.cover,
                            borderRadius: 50,
                          ),
                          SizedBox(
                            height: 14.sp,
                          ),
                          AppText(
                            controller.myInfo.value!.hoten??'',
                            style: AppStyle.DEFAULT_20_BOLD,
                          ),
                        ],
                      );
                    }
                    else {
                      return InkWell(
                        onTap: (){
                          AppNavigator.navigateLogin();
                        },
                        child: Column(
                          children: [
                            WidgetContainerImage(
                              image:Assets.imagesImgSplash,
                              width: 97.sp,
                              height: 97.sp,
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            SizedBox(
                              height: 14.sp,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              child: AppText(
                                'Hãy đăng nhập để sử dụng tính năng này',
                                textAlign: TextAlign.center,
                                style: AppStyle.DEFAULT_20_BOLD,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
              ),
              SizedBox(
                height: 40.sp,
              ),
              _itemMenu(
                  icon: Assets.iconsMenu1,
                  text: 'Hệ sinh thái giáo dục Mẹ yêu con',
                  onClick: () {
                    Get.back();
                    AppNavigator.navigateHeSinhThai();
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu2,
                  text: 'Giới thiệu App',
                  onClick: () {
                    Get.back();
                    AppNavigator.navigateGioiThieuApp();
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu3,
                  text: 'Chia sẻ với phụ huynh khác',
                  onClick: () {
                    try{
                      Share.share('${_loginController.dataLogin.value!.web}');
                    }catch(e){
                      print("error share ${e}");
                    }
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu4,
                  text: 'Liên hệ',
                  onClick: () {
                    Get.back();
                    AppNavigator.navigateLienHe();
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu5,
                  text: 'Link tải tài liệu',
                  onClick: () async{
                    if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.tai_lieu??''))) {
                      throw Exception('Could not launch tài liệu');
                    }
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu6,
                  text: 'Điều khoản sử dụng ứng dụng',
                  onClick: () async{
                    if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.dieu_khoan??''))) {
                      throw Exception('Could not launch tài liệu');
                    }
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu6,
                  text: 'Chính sách bảo mật',
                  onClick: () async{
                    if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.chinh_sach_bao_mat??''))) {
                      throw Exception('Could not launch tài liệu');
                    }
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu6,
                  text: 'Chính sách quy định',
                  onClick: () async{
                    if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.chinh_sach_dieu_khoan??''))) {
                      throw Exception('Could not launch tài liệu');
                    }
                  }),
              _itemMenu(
                  icon: Assets.iconsMenu6,
                  text: 'Quy chế sử dụng hoãn - hủy',
                  onClick: () async{
                    if (!await launchUrl(Uri.parse(_loginController.dataLogin.value!.quy_che_hoan_huy??''))) {
                      throw Exception('Could not launch tài liệu');
                    }
                  }),
              _loginController.token!=null? _itemMenu(
                  icon: Assets.iconsMenu7,
                  text: 'Đăng xuất',
                  onClick: () {
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
                  }):SizedBox()
            ],
          ),
        ));
  }

  Widget _itemMenu(
      {required String icon, required String text, required Function onClick}) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27.sp, vertical: 10.sp),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            SizedBox(
              width: 7.sp,
            ),
            Expanded(
                child: AppText(
              text,
              maxLines: 1,
              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
            )),
            Icon(
              Icons.navigate_next,
              size: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}

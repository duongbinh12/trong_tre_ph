import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController _loginController=Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: [
          SizedBox(
            height: 90.sp,
          ),
          WidgetContainerImage(
            image: Assets.imagesSplash,
            width: 107.sp,
            height: 105.sp,
            fit: BoxFit.contain,
          ),
          Expanded(
              child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'Kính chào Quý phụ huynh!'.tr,
                    style:
                        AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppText(
                    'Đăng nhập để tiếp tục'.tr,
                    style: AppStyle.DEFAULT_20_BOLD,
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  DButton(
                      text: 'Tiếp tục với Số điện thoại'.tr,
                      background: AppColors.white,
                      textColor: AppColors.textBlack,
                      borderColor: AppColors.grayE5,
                      left: SvgPicture.asset(
                        Assets.iconsPhone,
                        width: 26.sp,
                        height: 26.sp,
                        fit: BoxFit.contain,
                      ),
                      onClick: onClickPhone),
                  SizedBox(height: 15.sp,),
                  DButton(
                      text: 'Tiếp tục với Email'.tr,
                      background: AppColors.white,
                      textColor: AppColors.textBlack,
                      borderColor: AppColors.grayE5,
                      left: SvgPicture.asset(
                        Assets.iconsEmail,
                        width: 20.sp,
                        height: 20.sp,
                        fit: BoxFit.contain,
                      ),
                      onClick: onClickEmail),
                  // SizedBox(height: 15.sp,),
                  // DButton(
                  //     text: 'Tiếp tục với Facebook'.tr,
                  //     background: AppColors.white,
                  //     textColor: AppColors.textBlack,
                  //     borderColor: AppColors.grayE5,
                  //     left: WidgetContainerImage(
                  //       image: Assets.iconsFacebook,
                  //       width: 25.sp,
                  //       height: 25.sp,
                  //       fit: BoxFit.contain,
                  //     ),
                  //     onClick: onClickFb),
                  // SizedBox(height: 15.sp,),
                  // DButton(
                  //     text: 'Tiếp tục với Google'.tr,
                  //     background: AppColors.white,
                  //     textColor: AppColors.textBlack,
                  //     borderColor: AppColors.grayE5,
                  //     left: WidgetContainerImage(
                  //       image: Assets.iconsGoogle,
                  //       width: 25.sp,
                  //       height: 25.sp,
                  //       fit: BoxFit.contain,
                  //     ),
                  //     onClick: onClickGg),
                  SizedBox(height: 15.sp,),
                  InkWell(
                    onTap: (){
                      AppNavigator.navigateSignUp();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Bạn chưa có tài khoản? ',
                        style: AppStyle.DEFAULT_14,
                        children: [
                          TextSpan(text: 'Đăng ký', style: AppStyle.DEFAULT_14.copyWith(color: AppColors.blue)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Column(
            children: [
              AppText(
                'Sử dụng ứng dụng Trông trẻ Pro là bạn đã chấp nhận'.tr,
                style: AppStyle.DEFAULT_14,
              ),
              AppText(
                'Điều khoản và điều kiện'.tr,
                style: AppStyle.DEFAULT_14.copyWith(color: AppColors.blue),
              ),
              SizedBox(
                height: 30.sp + MediaQuery.of(context).viewPadding.bottom,
              )
            ],
          )
        ],
      ),
    );
  }

  onClickPhone() {
    AppNavigator.navigateLoginPhone();
  }

  onClickEmail() {
    AppNavigator.navigateLoginPhone(isPhone: false);
  }

  onClickFb() {
  }

  onClickGg() async{
    await _loginController.signInWithGoogle();
  }
}

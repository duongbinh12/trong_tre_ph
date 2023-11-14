import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/login/login.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../../common/routes/navigator.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({super.key});

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  LoginController _loginController = Get.find<LoginController>();
  bool isPhone = true;

  @override
  void initState() {
    isPhone = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: [
          WidgetContainerImage(
            image: Assets.imagesBgLogin,
            width: Get.width,
            height: Get.width * (303 / 393),
            fit: BoxFit.cover,
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.sp,
                      ),
                      AppText(
                        'Đăng nhập bằng số điện thoại của bạn',
                        style: AppStyle.DEFAULT_16
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 37.sp,
                      ),
                      DInput(
                          controller: isPhone
                              ? _phoneController
                              : _emailController,
                          typeInput:
                          isPhone ? TextInputType.number : TextInputType.text,
                          left: isPhone
                              ? Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        width: 1,
                                        color: AppColors.textBlack
                                            .withOpacity(0.6)))),
                            padding: EdgeInsets.only(right: 5.sp),
                            child: AppText(
                              '+84',
                              style: AppStyle.DEFAULT_16.copyWith(
                                  color:
                                  AppColors.textBlack.withOpacity(0.6)),
                            ),
                          )
                              : null,
                          hintText: !isPhone ? 'Email*' : ''),
                      SizedBox(
                        height: 15.sp,
                      ),
                      DInput(
                        controller: _passController,
                        hintText: 'Mật khẩu*',
                        isPass: true,
                        // right: SvgPicture.asset(
                        //   Assets.iconsEye,
                        //   color: AppColors.textBlack.withOpacity(0.6),
                        // )
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      DButton(text: 'Đăng nhập', onClick: onClickLogin),
                      SizedBox(
                        height: 15.sp,
                      ),
                      InkWell(
                        onTap: onClickForgotPass,
                        child: AppText(
                          'Quên mật khẩu?',
                          style:
                          AppStyle.DEFAULT_14.copyWith(color: AppColors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 50.sp,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: Get.width,
                            height: 1,
                            color: AppColors.grayLine,
                          ),
                          Positioned(
                              top: -6.sp,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp),
                                  color: AppColors.white,
                                  child: AppText(
                                    'Hoặc đăng nhập với',
                                    style: AppStyle.DEFAULT_14.copyWith(
                                        height: 1),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 35.sp,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: DButton(
                                  text: '',
                                  left: WidgetContainerImage(
                                    image: Assets.iconsFacebook,
                                    width: 25.sp,
                                    height: 25.sp,
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: 8.sp,
                                  background: AppColors.white,
                                  textColor: AppColors.textBlack,
                                  borderColor: AppColors.grayE5,
                                  onClick: onClickFb)),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Expanded(
                              child: DButton(
                                  text: '',
                                  left: WidgetContainerImage(
                                    image: Assets.iconsGoogle,
                                    width: 25.sp,
                                    height: 25.sp,
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: 8.sp,
                                  background: AppColors.white,
                                  textColor: AppColors.textBlack,
                                  borderColor: AppColors.grayE5,
                                  onClick: onClickFb)),
                          SizedBox(
                            width: 10.sp,
                          ),
                          Expanded(
                              child: DButton(
                                  text: '',
                                  left: SvgPicture.asset(
                                    isPhone
                                        ? Assets.iconsEmail
                                        : Assets.iconsLoginPhone,
                                    width: 25.sp,
                                    height: 25.sp,
                                    fit: BoxFit.contain,
                                  ),
                                  borderRadius: 8.sp,
                                  background: AppColors.white,
                                  textColor: AppColors.textBlack,
                                  borderColor: AppColors.grayE5,
                                  onClick: onClickEmail))
                        ],
                      ),
                      SizedBox(
                        height: 34.sp,
                      ),
                      InkWell(
                        onTap: () {
                          AppNavigator.navigateSignUp();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Bạn chưa có tài khoản? ',
                            style: AppStyle.DEFAULT_14,
                            children: [
                              TextSpan(
                                  text: 'Đăng ký',
                                  style: AppStyle.DEFAULT_14
                                      .copyWith(color: AppColors.blue)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  onClickLogin() {
    if (isPhone == true && _phoneController.text != "" &&
        _passController.text != "") {
      _loginController.loginPhone(
          _phoneController.text, _passController.text);
    }
    else if(isPhone == false && _emailController.text != "" &&
        _passController.text != "") {
      _loginController.loginEmail(
          _emailController.text, _passController.text);
    }
    else {
    NotificationDialog.createSimpleDialog(
    context: context,
    titleButton1: 'OK',
    content: "Hãy nhập đầy đủ thông tin",
    type: 2,
    numberButton: 1);
    }
  }

  void onClickForgotPass() {
    if (isPhone == true && _phoneController.text != "") {
      _loginController.getOtpPhone(_phoneController.text);
    }
    else if (isPhone == false && _emailController.text != "") {
      _loginController.getOtpEmail(_emailController.text);
    }
    else {
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: "OK",
          content: "Hãy nhập số điện thoại!",
          type: 2,
          numberButton: 1);
    }
  }

  onClickFb() {}

  onClickEmail() {
    setState(() {
      isPhone = !isPhone;
    });
  }
}

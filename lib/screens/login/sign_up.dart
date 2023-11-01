import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/login/policy.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/app_base_page.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _sdtController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _rePassController = TextEditingController();

  LoginController _loginController = Get.find<LoginController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _loginController.getPolicy();
    });
    super.initState();
  }

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
          SizedBox(height: 50.h,),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        'Đăng ký tài khoản'.tr,
                        style: AppStyle.DEFAULT_20_BOLD,
                      ),
                      SizedBox(
                        height: 40.sp,
                      ),
                      DInput(
                        controller: _emailController,
                        hintText: 'Email*',
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      DInput(
                        controller: _sdtController,
                        hintText: 'Số điện thoại*',
                        typeInput: TextInputType.number,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      DInput(
                        controller: _passController,
                        // right: SvgPicture.asset(
                        //   Assets.iconsEye,
                        //   width: 15.sp,
                        //   height: 15.sp,
                        //   fit: BoxFit.contain,
                        // ),
                        isPass: true,
                        hintText: 'Mật khẩu*',
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      DInput(
                        controller: _rePassController,
                        // right: SvgPicture.asset(
                        //   Assets.iconsEye,
                        //   width: 15.sp,
                        //   height: 15.sp,
                        //   fit: BoxFit.contain,
                        // ),
                        isPass: true,
                        hintText: 'Nhập lại mật khẩu*',
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      DButton(text: 'Tiếp tục', onClick: onClickNext),
                      SizedBox(
                        height: 15.sp,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Bạn đã có tài khoản? ',
                            style: AppStyle.DEFAULT_14,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Đăng nhập',
                                  style: AppStyle.DEFAULT_14
                                      .copyWith(color: AppColors.blue)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  onClickPhone() {}

  onClickNext() {
    if (_emailController.text != "" &&
        _sdtController.text != "" &&
        _passController.text != "" &&
        _rePassController.text != "") {
      if (_passController.text == _rePassController.text) {
        showModalBottomSheet(
          context: context,
          constraints: BoxConstraints(
              minHeight: Get.height / 2, maxHeight: Get.height * 0.7),
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Policy(
              onClick: () {
                _loginController.register(
                    email: _emailController.text,
                    dienThoai: _sdtController.text,
                    password: _passController.text,
                    passwordConfirm: _rePassController.text);
              },
            );
          },
        );
      } else {
        NotificationDialog.createSimpleDialog(
            context: context,
            titleButton1: "OK",
            type: 2,
            content: "Nhập lại mật khẩu không đúng!",
            numberButton: 1);
      }
    }
    else{
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: "OK",
          type: 2,
          content: "Hãy nhập đầy đủ thông tin!",
          numberButton: 1);
    }
  }
}

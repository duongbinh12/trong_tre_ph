import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  int count = 30;
  Timer? time;
  String phone = Get.arguments[0];
  int type = Get.arguments[1];
  String pin = "";

  LoginController _loginController = Get.find<LoginController>();

  @override
  void initState() {
    countDown();
    super.initState();
  }

  countDown() {
    time = Timer.periodic(new Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count = count - 1;
        });
      } else {
        time!.cancel();
      }
    });
  }

  @override
  void dispose() {
    if (time != null) time!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        child: Column(
      children: [
        Stack(
          children: [
            WidgetContainerImage(
              image: Assets.imagesBgOtp,
              width: Get.width,
              height: Get.width * (303 / 393),
              fit: BoxFit.cover,
            ),
            Positioned(
                top: MediaQuery.of(context).viewPadding.top + 10.sp,
                left: 10.sp,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: SvgPicture.asset(
                      Assets.iconsBack,
                    ),
                  ),
                ))
          ],
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(
                height: 30.sp,
              ),
              AppText(
                'Nhập mã xác thực gồm 6 chữ số đã gửi tới ${type == 1 ? "số" : "email"}',
                style:
                    AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600),
              ),
              AppText(
                type == 1
                    ? '+84${phone.substring(1, phone.length)}'
                        .replaceRange(3, 10, "*******")
                    : "${phone}",
                style:
                    AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 26.sp,
              ),
              Pinput(
                  onCompleted: (pinn) {
                    pin = pinn;
                  },
                  length: 6,
                  focusedPinTheme: PinTheme(
                    width: 52.sp,
                    height: 52.sp,
                    textStyle: AppStyle.DEFAULT_18_BOLD
                        .copyWith(color: AppColors.primary, height: 1),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 52.sp,
                    height: 52.sp,
                    textStyle: AppStyle.DEFAULT_18_BOLD
                        .copyWith(color: AppColors.primary, height: 1),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grayE5),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                  )),
              SizedBox(
                height: 31.sp,
              ),
              AppText(
                count.toString(),
                style: AppStyle.DEFAULT_18.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.red),
              ),
              SizedBox(
                height: 5.sp,
              ),
              AppText(
                'Bạn chưa nhận được mã?',
                style:
                    AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 3.sp,
              ),
              count != 0
                  ? AppText(
                      'Yêu cầu nhận mã mới sau 30s',
                      style: AppStyle.DEFAULT_14.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff292B2D).withOpacity(0.8)),
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          count = 30;
                        });
                        time =
                            Timer.periodic(new Duration(seconds: 1), (timer) {
                          if (count > 0) {
                            setState(() {
                              count = count - 1;
                            });
                          } else {
                            time!.cancel();
                          }
                        });
                      },
                      child: AppText(
                        'Gửi lại',
                        style: AppStyle.DEFAULT_16
                            .copyWith(color: AppColors.primary, height: 1.4),
                      ),
                    ),
              SizedBox(
                height: 22.sp,
              ),
              DButton(text: 'Tiếp theo', onClick: onClickNext)
            ],
          ),
        ))
      ],
    ));
  }

  onClickNext() {
    if (pin != "" && pin.length == 6) {
      if (type == 1) {
        _loginController.checkOtpPhone(phone, pin);
      }else{
        _loginController.checkOtpEmail(phone, pin);
      }
    } else {
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: "OK",
          type: 2,
          content: "Hãy nhập đúng mã PIN",
          numberButton: 1);
    }
  }
}

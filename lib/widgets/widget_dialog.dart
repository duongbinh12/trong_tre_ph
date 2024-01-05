import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '/res/res.dart';
import '/widgets/app_text.dart';
import '/widgets/widget_handle.dart';
// import 'package:permission_handler/permission_handler.dart';

import '../../res/app_styles.dart';
import '../../res/app_values.dart';

class NotificationDialog {

  static createDialog({
    required BuildContext context,
    String? title,
    Widget? widgetContent,
    bool? isButtonClose, barrierDismissible,
    String? image,
    double? heightImage, widthImage,
    String? content,
    required String titleButton1,
    Color? bgButton1,
    String? titleButton2, titleButton3,
    VoidCallback? onTap1, onTap2, onTap3,
    TextStyle? textStyle1, textStyle2, textStyle3,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            content: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isButtonClose == true ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: WidgetContainerImage(
                          image: 'assets/images/close_rounded.png',
                          height: 20,
                          width: 20,
                          onTap: () => Get.back(),
                        ),
                      ),
                      AppValue.vSpaceSmall
                    ],
                  ) : Container(),

                  image != null ? WidgetContainerImage(
                    image: image,
                    height: heightImage ?? 120.0,
                    width: widthImage ?? 200.0,
                  ) : Container(),
                  image != null ? AppValue.vSpaceSmall : AppValue.kEmptyWidget,

                  if(title!=null) Text(title ?? '',
                    style: AppStyle.DEFAULT_16.copyWith(
                        fontWeight: FontWeight.w500),),
                  AppValue.vSpaceSmall,

                  widgetContent == null ?
                  content != null ? Text(content,
                    style: AppStyle.DEFAULT_14.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.black),
                    textAlign: TextAlign.center,) : Container()
                      : widgetContent,
                  AppValue.vSpaceSmall,

                  titleButton2 != null ? AppValue.vSpaceTiny : AppValue
                      .kEmptyWidget,
                  titleButton2 != null ? TextButton(
                      onPressed: onTap2 ?? () => Get.back(),
                      child: Text(titleButton2, style: textStyle2 ??
                          AppStyle.DEFAULT_14.copyWith(color: Colors.black,
                              fontWeight: FontWeight.w400),)
                  ) : Container(),
                  titleButton3 != null ? TextButton(
                      onPressed: onTap3 ?? () => Get.back(),
                      child: Text(titleButton3, style: textStyle3 ??
                          AppStyle.DEFAULT_14.copyWith(color: Colors.black,
                              fontWeight: FontWeight.w400),)
                  ) : Container(),
                ],
              ),

            )
        );
      },
    );
  }


  static createSimpleDialog({
    required BuildContext context,
    String? title,
    required String titleButton1,
    required int numberButton,
    String? content,
    Color? bgButton1,
    bool? barrierDismissible,
    String? titleButton2, titleButton3,
    VoidCallback? onTap1, onTap2, onTap3,
    TextStyle? textStyle1, textStyle2, textStyle3,
    int type = 1
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? false,

      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(16.sp, 16.sp, 16.sp, 10.sp),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //borderRadius: BorderRadius.circular(12)
                  ),
                  width: Get.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Text(title != "" ? title! : type == 1
                      //     ? "Notification"
                      //     : "Oops..!!", style: AppStyle.DEFAULT_16.copyWith(
                      //     fontWeight: FontWeight.w600,
                      //     color: type == 1 ? AppColors.primary : Color(
                      //         0xffEB5757)),),
                      // SizedBox(height: 20.sp,),
                      Row(
                        children: [
                          Spacer(),
                          InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Icon(Icons.close,size: 25.sp,color: AppColors.black,))
                        ],
                      ),
                      SizedBox(height: 15.sp,),
                      content != null ? Text(content,
                        style: AppStyle.DEFAULT_16.copyWith(
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,) : Container(),
                      content != null ? AppValue.vSpaceTiny : AppValue
                          .kEmptyWidget,

                      numberButton==0?SizedBox(): numberButton != 3 ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          titleButton2 != null ? TextButton(
                              onPressed: onTap2 ?? () => Get.back(),
                              child: Text(titleButton2, style: textStyle2 ??
                                  AppStyle.DEFAULT_16_BOLD.copyWith(
                                      color: AppColors.black),)
                          ) : Container(),
                          titleButton2 != null
                              ? AppValue.hSpaceMedium
                              : Container(),
                          TextButton(
                              onPressed: onTap1 ?? () => Get.back(),
                              child: AppText(
                                titleButton1,
                                style: textStyle1 ??
                                    AppStyle.DEFAULT_16_BOLD.copyWith(
                                        color: AppColors.primary),
                              )
                          ),
                        ],
                      ) : Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: onTap1 ?? () => Get.back(),
                                child: AppText(
                                  titleButton1,
                                  style: textStyle1 ??
                                      AppStyle.DEFAULT_16_BOLD.copyWith(
                                          color: AppColors.primary),
                                  textAlign: TextAlign.end,
                                ),
                                style: ButtonStyle(
                                  alignment: Alignment.centerRight,
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                ),
                              ),
                              TextButton(
                                  onPressed: onTap2 ?? () => Get.back(),
                                  child: AppText(
                                    titleButton2 ?? 'titleButton2',
                                    style: textStyle2 ??
                                        AppStyle.DEFAULT_16_BOLD.copyWith(
                                            color: AppColors.primary),
                                    textAlign: TextAlign.end,
                                  )
                              ),
                              TextButton(
                                  onPressed: onTap3 ?? () => Get.back(),
                                  child: AppText(
                                    titleButton3 ?? 'Cancel',
                                    style: textStyle3 ??
                                        AppStyle.DEFAULT_16_BOLD.copyWith(
                                            color: AppColors.black),
                                    textAlign: TextAlign.end,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Positioned(
                    top: -45.sp,
                    left: 0, right: 0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                          clipBehavior: Clip.hardEdge,
                          width: 66.sp,
                          height: 66.sp,
                          child: Center(
                            child: Lottie.asset(
                              type == 1
                                  ? 'assets/lotties/done.json'
                                  : 'assets/lotties/fail.json', width: 54.sp,
                              height: 54.sp,),
                          ),
                      ),
                    ))
              ],
            )
        );
      },
    );
  }

}

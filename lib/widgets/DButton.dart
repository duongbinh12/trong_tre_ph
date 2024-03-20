import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../res/app_styles.dart';
import '../res/colors.dart';
import 'app_text.dart';

class DButton extends StatelessWidget {
  DButton(
      {Key? key,
      required this.text,
      required this.onClick,
      this.right,
      this.left,
      this.textStyle,
      this.background,
        this.borderColor,
        this.textAlign,
        this.borderRadius,
        this.padH,
        this.padV,
        this.isFlexible,
      this.textColor})
      : super(key: key);

  String text;
  Function onClick;
  Widget? right;
  Widget? left;
  TextStyle? textStyle;
  Color? background;
  Color? textColor;
  Color? borderColor;
  TextAlign? textAlign;
  double? borderRadius;
  double? padH;
  double? padV;
  bool? isFlexible;
  bool? isFull;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical:padH?? 10.sp, horizontal:padV?? 15.sp),
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   colors: [
            //     AppColors.primary,
            //     AppColors.primary,
            //   ]
            // ),
            color: background ?? AppColors.primary,
            border:
                Border.all(width: 1, color: borderColor ?? AppColors.primary),
            borderRadius: BorderRadius.circular(borderRadius??60.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            left ?? SizedBox(),
            text != ""
                ? SizedBox(
                    width: 5.sp,
                  )
                : SizedBox(),
            text != ""
                ?(left==null||isFlexible==true)? Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          // border: Border.all(width: 1)
                          ),
                      child: AppText(
                        text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign:textAlign?? TextAlign.center,
                        style: textStyle ??
                            AppStyle.DEFAULT_16.copyWith(
                                fontWeight: FontWeight.w600,
                                color: textColor ?? AppColors.white,
                                height: 1.5),
                      ),
                    ),
                  ):Expanded(
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(width: 1)
                ),
                child: AppText(
                  text,
                  maxLines: 1,
                  textAlign:textAlign?? TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ??
                      AppStyle.DEFAULT_16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: textColor ?? AppColors.white,
                          height: 1.5),
                ),
              ),
            )
                : SizedBox(),
            text != ""
                ? SizedBox(
                    width: 5.sp,
                  )
                : SizedBox(),
            right ?? SizedBox()
          ],
        ),
      ),
    );
  }
}

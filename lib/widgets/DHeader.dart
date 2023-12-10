import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../screens/home/home.dart';

class DHeader extends StatelessWidget {
  const DHeader(
      {super.key,
      required this.title,
      this.colorTitle,
      this.showMenu,
      this.noBack = false,
      this.keyMenu,
      this.onBack});

  final String title;
  final Color? colorTitle;
  final bool? showMenu;
  final bool? noBack;
  final GlobalKey<ScaffoldState>? keyMenu;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        noBack == false
            ? InkWell(
                onTap: () {
                  if(onBack!=null) {
                    onBack!();
                  } else {
                    Get.back();
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp),
                  child: SvgPicture.asset(
                    Assets.iconsBack,
                    width: 10.sp,
                    height: 20.sp,
                    fit: BoxFit.contain,
                    color: colorTitle ?? AppColors.black,
                  ),
                ),
              )
            : SizedBox(
                width: 48.sp,
                height: 40.sp,
              ),
        Expanded(
            child: AppText(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: AppStyle.DEFAULT_20_BOLD
              .copyWith(color: colorTitle ?? AppColors.black, height: 1.1),
        )),
        showMenu == true
            ? InkWell(
                onTap: () {
                  try {
                    keyMenu!.currentState!.openDrawer();
                  } catch (e) {
                    print("open menu ${e}");
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: SvgPicture.asset(
                    Assets.iconsMenu,
                    width: 30.sp,
                    height: 30.sp,
                    fit: BoxFit.contain,
                    color: colorTitle ?? AppColors.black,
                  ),
                ),
              )
            : SizedBox(
                width: 30.sp,
              )
      ],
    );
  }
}

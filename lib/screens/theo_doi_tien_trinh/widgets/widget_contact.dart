import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

class WidgetContact extends StatelessWidget {
  const WidgetContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          WidgetContainerImage(
            image: Assets.imagesImgContact,
            width: Get.width-20.sp-20.sp,
            height: (Get.width-20.sp-20.sp)*(105/353),
            fit: BoxFit.contain,
          ),
          Positioned(
            right: 30.sp,
              top: 20.sp,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Liên hệ với chúng tôi',
                style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600,color: AppColors.white),
              ),
              AppText(
                '0983.456.873',
                style: AppStyle.DEFAULT_24.copyWith(fontWeight: FontWeight.w700,color: AppColors.white),
              )
            ],
          ))
        ],
      ),
    );
  }
}

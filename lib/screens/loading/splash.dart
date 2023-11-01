import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      AppNavigator.navigateHome();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          WidgetContainerImage(
            image: Assets.imagesSplash,
            width: 157.sp,
            height: 153.sp,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 50.sp,),
          WidgetContainerImage(
            image: Assets.imagesImgSplash,
            width: Get.width,
            height: 400.sp,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

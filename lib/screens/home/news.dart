import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/home/gioi_thieu/tin_tuc.dart';
import 'package:trong_tre/widgets/DHeader.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import 'home.dart';
import 'menu.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      keyScaffold: ScaffoldKey,
      drawer: Drawer(
        width: Get.width*0.85,
        child: Menu(),
      ),
      child: Stack(
        children: [
          WidgetContainerImage(
            image: Assets.imagesBgPrimary,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Positioned.fill(child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top+20.sp,),
              DHeader(title: 'Tin Tức',colorTitle: AppColors.white,showMenu: true,keyMenu: ScaffoldKey),
              SizedBox(height: 5.sp,),
              Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp))
                  ),
                  padding: EdgeInsets.only(top: 30.sp),
                  child: TinTuc(noTitle: true,noScroll: false,isFull: true,)))
            ],
          ))
        ],
      ),
    );
  }
}

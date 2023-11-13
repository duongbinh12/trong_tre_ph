import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../home/menu.dart';

class GioiThieuApp extends StatefulWidget {
  const GioiThieuApp({super.key});

  @override
  State<GioiThieuApp> createState() => _GioiThieuAppState();
}

class _GioiThieuAppState extends State<GioiThieuApp> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
  SettingController _settingController = Get.find<SettingController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _settingController.getGioiThieu();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        keyScaffold: ScaffoldKey,
        backgroundColor: AppColors.grayF5,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Column(
          children: [
            DHeaderShadow(
              title: 'Giới thiệu APP'.tr,
              keyMenu: ScaffoldKey,
              showMenu: true,
            ),
            SizedBox(
              height: 24.sp,
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: GetX<SettingController>(builder: (controller) {
                  if (controller.gioiThieu.value != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetContainerImage(
                          image: Assets.imagesImgGioiThieu,
                          width: Get.width,
                          height: 156.sp,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        SizedBox(
                          height: 28.sp,
                        ),
                        AppText(
                          controller.gioiThieu.value!.title??'',
                          style: AppStyle.DEFAULT_18_BOLD,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        HtmlWidget(
                          controller.gioiThieu.value!.content??'',
                          textStyle: AppStyle.DEFAULT_14,
                        )
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
              }),
            ),
                ))
          ],
        ));
  }
}

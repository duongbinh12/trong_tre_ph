import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../home/menu.dart';
import '../setting/controllers/setting_controller.dart';

class HeSinhThai extends StatefulWidget {
  const HeSinhThai({super.key});

  @override
  State<HeSinhThai> createState() => _HeSinhThaiState();
}

class _HeSinhThaiState extends State<HeSinhThai> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  SettingController _settingController = Get.find<SettingController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _settingController.getHeSinhThai();
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
          title: 'Hệ sinh thái giáo dục'.tr,
          keyMenu: ScaffoldKey,
          showMenu: true,
        ),
        SizedBox(height: 24.sp,),
        Expanded(child: SingleChildScrollView(
          child: GetX<SettingController>(
            builder: (controller) {
              if(controller.heSinhThai.value!=null){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetNetworkImage(
                        image: controller.heSinhThai.value!.image??'',
                        width: Get.width,
                        height: 156.sp,
                        fit: BoxFit.cover,
                        borderRadius: 10.sp,
                      ),
                      SizedBox(height: 28.sp,),
                      HtmlWidget(
                        controller.heSinhThai.value!.content??'',
                        textStyle: AppStyle.DEFAULT_14,
                      )
                    ],
                  ),
                );
              }
              else {
                return SizedBox();
              }
            }
          ),
        ))
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DTitleIcon.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/app_text.dart';

class WidgetSupport extends StatefulWidget {
  const WidgetSupport({super.key});

  @override
  State<WidgetSupport> createState() => _WidgetSupportState();
}

class _WidgetSupportState extends State<WidgetSupport> {
  SettingController _settingController=Get.find<SettingController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _settingController.getLienHe();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<SettingController>(
      builder: (controller) {
        if(controller.lienHe.value!=null) {
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DTitleIcon(icon: Assets.iconsBuildings, title: 'Đơn vị chủ quản'.tr),
            SizedBox(
              height: 5.sp,
            ),
            AppText(
              controller.lienHe.value!.donViChuQuan??'',
              style: AppStyle.DEFAULT_14,
            ),
            SizedBox(
              height: 20.sp,
            ),
            DTitleIcon(
              icon: Assets.iconsIcLocation,
              title: 'Trụ sở'.tr,
              colorIcon: AppColors.primary,
            ),
            SizedBox(
              height: 5.sp,
            ),
            AppText(
              controller.lienHe.value!.truSo??'',
              style: AppStyle.DEFAULT_14,
            ),
            SizedBox(
              height: 20.sp,
            ),
            DTitleIcon(
              icon: Assets.iconsWebsite,
              title: 'Website'.tr,
              colorIcon: AppColors.primary,
            ),
            SizedBox(
              height: 5.sp,
            ),
            AppText(
              controller.lienHe.value!.website??'',
              style: AppStyle.DEFAULT_14,
            ),
            SizedBox(
              height: 20.sp,
            ),
            DTitleIcon(
              icon: Assets.iconsHotline,
              title: 'Hotline - Zalo 24/7'.tr,
              colorIcon: AppColors.primary,
            ),
            SizedBox(
              height: 5.sp,
            ),
            _hotLine('Hotline miền Bắc: ', '0963.459.888'),
            SizedBox(
              height: 8.sp,
            ),
            _hotLine('Hotline miền Nam: ', '0867.055.585'),
            SizedBox(
              height: 8.sp,
            ),
            _hotLine('Trực ban điêu hành: ', '0888.500.529'),
            SizedBox(
              height: 20.sp,
            ),
            DTitleIcon(
              icon: Assets.iconsEmail,
              title: 'Email'.tr,
              colorIcon: AppColors.primary,
            ),
            SizedBox(
              height: 5.sp,
            ),
            AppText(
              controller.lienHe.value!.email??'',
              style: AppStyle.DEFAULT_14,
            ),
          ],
        );
        }
        else return SizedBox();
      }
    );
  }

  Widget _hotLine(String title, String phone) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.bgRed),
          borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.only(left: 13.sp),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              AppText(
                title,
                style: AppStyle.DEFAULT_14,
              ),
              AppText(
                phone,
                style: AppStyle.DEFAULT_14_BOLD,
              ),
            ],
          )),
          InkWell(
            onTap: () async {
              final Uri launchUri = Uri(
                scheme: 'tel',
                path: phone,
              );
              await launchUrl(launchUri);
            },
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: SvgPicture.asset(
                Assets.iconsCall,
                width: 28.sp,
                height: 28.sp,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

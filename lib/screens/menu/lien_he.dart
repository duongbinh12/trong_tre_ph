import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/setting/widget_support.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../../widgets/DTitleIcon.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class LienHe extends StatefulWidget {
  const LienHe({super.key});

  @override
  State<LienHe> createState() => _LienHeState();
}

class _LienHeState extends State<LienHe> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

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
          title: 'Liên hệ'.tr,
          keyMenu: ScaffoldKey,
          showMenu: true,
        ),
        SizedBox(height: 24.sp,),
        Expanded(child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetContainerImage(
                  image: Assets.imagesImgLienHe,
                  width: Get.width,
                  height: 156.sp,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                SizedBox(height: 20.sp,),
                AppText('Thông tin liên hệ',style: AppStyle.DEFAULT_18_BOLD,),
                SizedBox(height: 20.sp,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DTitleIcon(icon: Assets.iconsBuildings, title: 'Đơn vị chủ quản'.tr),
                    SizedBox(height: 5.sp,),
                    AppText(
                      'Công ty TNHH Giáo dục Đào tạo Mẹ yêu con',
                      style: AppStyle.DEFAULT_14,
                    ),
                    SizedBox(height: 20.sp,),
                    DTitleIcon(icon: Assets.iconsIcLocation, title: 'Trụ sở'.tr,colorIcon: AppColors.primary,),
                    SizedBox(height: 5.sp,),
                    AppText(
                      'Tầng 1 Chung cư Platinum Residences, số 6 Nguyễn Công Hoan, phường Ngọc Khánh, quận Ba Đình, Hà Nội',
                      style: AppStyle.DEFAULT_14,
                    ),
                    SizedBox(height: 20.sp,),
                    DTitleIcon(icon: Assets.iconsWebsite, title: 'Website'.tr,colorIcon: AppColors.primary,),
                    SizedBox(height: 5.sp,),
                    AppText(
                      'meyeucon.edu.vn',
                      style: AppStyle.DEFAULT_14,
                    ),
                    SizedBox(height: 20.sp,),
                    DTitleIcon(icon: Assets.iconsHotline, title: 'Hotline - Zalo 24/7'.tr,colorIcon: AppColors.primary,),
                    SizedBox(height: 5.sp,),
                    _hotLine('Hotline miền Bắc: ', '0963.459.888'),
                    SizedBox(height: 8.sp,),
                    _hotLine('Hotline miền Nam: ', '0867.055.585'),
                    SizedBox(height: 8.sp,),
                    _hotLine('Trực ban điêu hành: ', '0888.500.529'),

                    SizedBox(height: 20.sp,),
                    DTitleIcon(icon: Assets.iconsEmail, title: 'Email'.tr,colorIcon: AppColors.primary,),
                    SizedBox(height: 5.sp,),
                    AppText(
                      'trongtrepro.myc@gmail.com',
                      style: AppStyle.DEFAULT_14,
                    ),
                    SizedBox(height: 40.sp,),

                  ],
                )
              ],
            ),
          ),
        ))
      ],
    ));
  }

  Widget _hotLine(String title,String phone){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: AppColors.bgRed),
          borderRadius: BorderRadius.circular(10.sp)
      ),
      padding: EdgeInsets.only(left: 13.sp),
      child: Row(
        children: [
          Expanded(child: Row(
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
            onTap: ()async{
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DTitleIcon.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/app_text.dart';

class WidgetSupport extends StatelessWidget {
  const WidgetSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp))
      ),
      padding: EdgeInsets.only(
          left: 20.sp,right: 20.sp,top: 13.sp,bottom: 30+MediaQuery.of(context).viewPadding.bottom
      ),
      child: Column(
        children: [
          Container(
            width: 38.sp,
            height: 4.sp,
            decoration: BoxDecoration(
                color: AppColors.grayE5,
                borderRadius: BorderRadius.circular(50)),
          ),
          SizedBox(
            height: 20.sp,
          ),
          AppText(
            'Liên hệ và trợ giúp'.tr,
            textAlign: TextAlign.center,
            style: AppStyle.DEFAULT_20_BOLD,
          ),
          SizedBox(height: 22.sp,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
              ),
            ),
          ),
          DButton(text: 'Đóng', onClick: (){
            Get.back();
          })
        ],
      ),
    );
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

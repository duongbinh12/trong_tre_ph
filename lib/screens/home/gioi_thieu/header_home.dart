import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/home/home.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key,this.keyMenu});
  final GlobalKey<ScaffoldState>? keyMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          WidgetContainerImage(
            image: Assets.imagesBgHome,
            width: Get.width,
            height: Get.width*(123/393),
            fit: BoxFit.cover,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.sp)),
          ),
          Positioned(
            left: 20.sp,right: 20.sp,bottom: 20.sp,
            child: Row(
              children: [
                GetX<SettingController>(
                  builder: (controller) {
                    if(controller.myInfo.value!=null) {
                      return WidgetNetworkImage(
                      image: controller.myInfo.value!.anh_nguoi_dung??'',
                      width: 42.sp,
                      height: 42.sp,
                      fit: BoxFit.cover,
                      borderRadius: 42.sp,
                    );
                    }
                    else {
                      return WidgetContainerImage(
                      image: Assets.iconsUserHome,
                      width: 42.sp,
                      height: 42.sp,
                      fit: BoxFit.contain,
                    );
                    }
                  }
                ),
                SizedBox(width: 8.sp,),
                AppText(
                  'Kính chào Quý phụ huynh!',
                  style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,color: AppColors.white),
                ),
                Spacer(),
                InkWell(
                  onTap: onClickMenu,
                  child: SvgPicture.asset(
                    Assets.iconsMenu,
                    width: 30.sp,
                    height: 30.sp,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onClickMenu() {
    keyMenu!.currentState!.openDrawer();
  }
}

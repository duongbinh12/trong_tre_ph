import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../generated/assets.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class NhanXetThanhCong extends StatefulWidget {
  const NhanXetThanhCong({super.key});

  @override
  State<NhanXetThanhCong> createState() => _NhanXetThanhCongState();
}

class _NhanXetThanhCongState extends State<NhanXetThanhCong> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        keyScaffold: ScaffoldKey,
        drawer: Drawer(
          width: Get.width * 0.85,
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
            Positioned.fill(
                child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top + 20.sp,
                ),
                DHeader(
                    title: 'Hoàn tất đánh giá'.tr,
                    colorTitle: AppColors.white,
                    showMenu: true,
                    keyMenu: ScaffoldKey),
                SizedBox(
                  height: 5.sp,
                ),
                Expanded(child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp))
                    ),
                    padding: EdgeInsets.only(top: 30.sp,left: 20.sp,right: 20.sp),
                    child: Column(
                      children: [
                        SizedBox(height: 40.sp,),
                        WidgetContainerImage(
                          image: Assets.imagesImgSuccessRate,
                          width: 193.sp,
                          height: 193.sp,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 33.sp,),
                        AppText(
                          'Cám ơn Phụ huynh đã gửi đánh giá',
                          style: AppStyle.DEFAULT_18_BOLD,
                        ),
                        AppText(
                          'Chúng tôi sẽ liên hệ lại sớm nhất có thể.',
                          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 60.sp,),
                        Row(
                          children: [
                            Expanded(child: DButton(
                                text: 'Về trang chủ',
                                background: AppColors.grayE5,
                                borderColor: AppColors.grayE5,
                                textColor: AppColors.textBlack,
                                onClick: onClickHome)),
                            SizedBox(width: 10.sp,),
                            Expanded(child: DButton(text: 'Quay lại tiến trình', onClick: onClickTienTrinh)),
                          ],
                        )
                      ],
                    )))
              ],
            ))
          ],
        ));
  }

  onClickHome() {
    AppNavigator.navigateHome();
  }

  onClickTienTrinh() {
    Get.back();
    Get.back();
  }
}

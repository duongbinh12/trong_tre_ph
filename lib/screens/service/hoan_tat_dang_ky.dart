import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/history/controllers/history_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../generated/assets.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class HoanTatDangKy extends StatefulWidget {
  const HoanTatDangKy({super.key});

  @override
  State<HoanTatDangKy> createState() => _HoanTatDangKyState();
}

class _HoanTatDangKyState extends State<HoanTatDangKy> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  // int id=Get.arguments;

  HistoryController _historyController=Get.find<HistoryController>();

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
            DHeader(title: 'Hoàn tất đăng ký'.tr,colorTitle: AppColors.white,noBack: true,showMenu: true,keyMenu: ScaffoldKey),
            SizedBox(height: 5.sp,),
            Expanded(child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp))
                ),
                padding: EdgeInsets.only(top: 30.sp,left: 20.sp,right: 20.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetContainerImage(
                      image: Assets.imagesSuccessSignUp,
                      width: Get.width/3*2,
                      height: Get.width/3*2,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 30.sp,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: AppText(
                        'Chúc mừng bạn đã đăng ký\n thành công dịch vụ',
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_18_BOLD,
                      ),
                    ),
                    SizedBox(height: 15.sp,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: AppText(
                        'Chúng tôi sẽ liên hệ lại sớm nhất có thể',
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 50.sp,),
                    DButton(text: 'Về trang chủ'.tr, onClick: onClickTheoDoi),
                    SizedBox(height: 12.sp,),
                    DButton(text: 'Ghi chú quan trọng'.tr,
                        background: AppColors.grayF7,
                        textColor: AppColors.primary,
                        right: SvgPicture.asset(
                          Assets.iconsUpload,
                          color: AppColors.primary ,
                        ),
                        onClick: onClickghiChu),
                  ],
                )))
          ],
        ))
      ],
    ));
  }

  onClickTheoDoi() {
    // _historyController.getThongTinGiaoVien(id: id.toString());
    AppNavigator.navigateHome();
  }

  onClickghiChu() {
  }
}

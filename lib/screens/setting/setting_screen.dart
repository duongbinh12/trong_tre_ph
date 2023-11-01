import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/screens/setting/widget_support.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DHeader.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
                    title: 'Cài đặt',
                    colorTitle: AppColors.white,
                    noBack: true,
                    showMenu: true,
                    keyMenu: ScaffoldKey),
                SizedBox(
                  height: 60.sp,
                ),
                Expanded(
                    child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.sp))),
                      padding: EdgeInsets.only(
                          top: 30.sp, left: 20.sp, right: 20.sp),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 95.sp,
                          ),
                          _item(Assets.iconsKhieuNai, 'Khiếu nại/ Góp ý',
                              onClick: () {
                            AppNavigator.navigateComplain();
                          }),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsChiaSe, 'Chia sẻ Trông trẻ Pro'),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsTroGiup, 'Trợ giúp',onClick: onClickSupport),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsTaiNguyen, 'Tham khảo/ Tài nguyên'),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsCongDong, 'Cộng đồng',
                              right: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.sp),
                                    child: SvgPicture.asset(
                                      Assets.iconsFb2,
                                      width: 28.sp,
                                      height: 28.sp,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.sp),
                                    child: SvgPicture.asset(
                                      Assets.iconsYoutube,
                                      width: 28.sp,
                                      height: 28.sp,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.sp),
                                    child: SvgPicture.asset(
                                      Assets.iconsWeb,
                                      width: 28.sp,
                                      height: 28.sp,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10.sp,
                          ),
                          _item(Assets.iconsDangXuat, 'Đăng xuất',
                              right: SizedBox()),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -30.sp,
                      left: 20.sp,
                      right: 20.sp,
                      child: _info(),
                    )
                  ],
                ))
              ],
            ))
          ],
        ));
  }

  Widget _info() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 10,
                color: AppColors.blue2.withOpacity(0.15))
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
            child: Row(
              children: [
                WidgetNetworkCacheImage(
                  image:
                      'https://allimages.sgp1.digitaloceanspaces.com/tipeduvn/2022/07/1657905893_880_Tuyen-Tap-Bo-Anh-Girl-Xinh-Dep-Nhat-Nam-2020.jpg',
                  width: 97.sp,
                  height: 97.sp,
                  fit: BoxFit.cover,
                  borderRadius: 100,
                ),
                SizedBox(
                  width: 15.sp,
                ),
                Expanded(
                    child: Container(
                  height: 97.sp,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: AppText(
                              'Nguyễn Hoàng Anh Thư',
                              style: AppStyle.DEFAULT_16_BOLD
                                  .copyWith(height: 1.1),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                AppNavigator.navigateProfile();
                              },
                              child: SvgPicture.asset(Assets.iconsEdit))
                        ],
                      ),
                      AppText(
                        'Phụ huynh',
                        style: AppStyle.DEFAULT_14
                            .copyWith(height: 1.2, color: AppColors.gray7D),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.iconsCall,
                            width: 20.sp,
                            height: 20.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(
                            width: 5.sp,
                          ),
                          AppText(
                            '0123 456 789',
                            style: AppStyle.DEFAULT_14.copyWith(
                                height: 1.2, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(String icon, String title, {Widget? right, Function? onClick}) {
    return InkWell(
      onTap: () {
        if (onClick != null) onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 8.5.sp),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                  blurRadius: 10,
                  color: AppColors.blue2.withOpacity(0.1))
            ]),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 30.sp,
              height: 30.sp,
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
                child: AppText(
              title,
              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
            )),
            SizedBox(
              width: 10.sp,
            ),
            right ??
                RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    Assets.iconsBack,
                    width: 8.sp,
                    height: 8.sp,
                    fit: BoxFit.contain,
                  ),
                )
          ],
        ),
      ),
    );
  }

  onClickSupport() {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxHeight: Get.height*0.7),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return WidgetSupport();
      },
    );
  }
}

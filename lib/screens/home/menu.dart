import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).viewPadding.top + 20.sp,
        ),
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(20.sp),
                child: Icon(
                  Icons.close,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
        WidgetNetworkImage(
          image:
              'https://gaixinhbikini.com/wp-content/uploads/2023/02/hinh-co-gai-xinh-dep-005.jpg',
          width: 97.sp,
          height: 97.sp,
          fit: BoxFit.cover,
          borderRadius: 50,
        ),
        SizedBox(
          height: 14.sp,
        ),
        AppText(
          'Nguyễn Văn A',
          style: AppStyle.DEFAULT_20_BOLD,
        ),
        SizedBox(
          height: 40.sp,
        ),
        _itemMenu(
            icon: Assets.iconsMenu1,
            text: 'Hệ sinh thái giáo dục Mẹ yêu con',
            onClick: () {
              Get.back();
              AppNavigator.navigateHeSinhThai();
            }),
        _itemMenu(
            icon: Assets.iconsMenu2,
            text: 'Giới thiệu App',
            onClick: () {
              Get.back();
              AppNavigator.navigateGioiThieuApp();
            }),
        _itemMenu(
            icon: Assets.iconsMenu3,
            text: 'Chia sẻ với phụ huynh khác',
            onClick: () {
              try{
                Share.share('check out my website https://example.com');
              }catch(e){
                print("error share ${e}");
              }
            }),
        _itemMenu(
            icon: Assets.iconsMenu4,
            text: 'Liên hệ',
            onClick: () {
              Get.back();
              AppNavigator.navigateLienHe();
            }),
        _itemMenu(
            icon: Assets.iconsMenu5,
            text: 'Link tải tài liệu',
            onClick: () {}),
        _itemMenu(
            icon: Assets.iconsMenu6,
            text: 'Điều khoản sử dụng ứng dụng',
            onClick: () {}),
        _itemMenu(
            icon: Assets.iconsMenu7,
            text: 'Đăng xuất',
            onClick: () {
              AppNavigator.navigateLogin();
            })
      ],
    ));
  }

  Widget _itemMenu(
      {required String icon, required String text, required Function onClick}) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27.sp, vertical: 10.sp),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            SizedBox(
              width: 7.sp,
            ),
            Expanded(
                child: AppText(
              text,
              maxLines: 1,
              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
            )),
            Icon(
              Icons.navigate_next,
              size: 20.sp,
            )
          ],
        ),
      ),
    );
  }
}

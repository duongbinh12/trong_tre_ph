import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

class ChangePassSuccess extends StatelessWidget {
  const ChangePassSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
          SvgPicture.asset(Assets.iconsSuccess),
          SizedBox(
            height: 55.sp,
          ),
          AppText(
            'Thay đổi mật khẩu thành công!',
            style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.sp,
          ),
          AppText(
            'Mật khẩu của bạn đã được thay đổi, hoàn tất quá trình đăng nhập để khám phá Trông trẻ Pro nhé!',
            textAlign: TextAlign.center,
            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 60.sp,
          ),
          DButton(
              text: 'Quay lại đăng nhập',
              onClick: () {
                AppNavigator.navigateLoginPhone();
              })
      ],
    ),
        ));
  }
}

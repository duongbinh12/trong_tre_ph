import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../res/app_styles.dart';
import 'app_text.dart';

class DTitleIcon extends StatelessWidget {
  const DTitleIcon({super.key, required this.icon, required this.title, this.colorIcon});
  final String icon,title;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: colorIcon,
        ),
        SizedBox(
          width: 5.sp,
        ),
        AppText(
          title,
          style: AppStyle.DEFAULT_18_BOLD,
        )
      ],
    );
  }
}

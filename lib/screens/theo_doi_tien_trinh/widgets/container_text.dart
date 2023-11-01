import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/app_text.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.symmetric(horizontal: 9.5.sp,vertical: 6.5.sp),
      child: AppText(
        text,
        textAlign: TextAlign.center,
        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500,color: color,height: 1.2),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/DHeader.dart';

class DHeaderShadow extends StatelessWidget {
  const DHeaderShadow({super.key, required this.title, this.colorTitle, this.showMenu=false, this.noBack=false, this.keyMenu});
  final String title;
  final Color? colorTitle;
  final bool? showMenu;
  final bool? noBack;
  final GlobalKey<ScaffoldState>? keyMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.sp)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 15,
            spreadRadius: 0,
            color: AppColors.blue2.withOpacity(0.15)
          )
        ]
      ),
      padding: EdgeInsets.only(top: 13.sp+MediaQuery.of(context).viewPadding.top),
      child: DHeader(
        title: title,
        keyMenu: keyMenu,
        showMenu: showMenu,
        colorTitle: colorTitle??AppColors.black,
        noBack: noBack,
      ),
    );
  }
}

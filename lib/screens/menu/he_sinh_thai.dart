import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../home/menu.dart';

class HeSinhThai extends StatefulWidget {
  const HeSinhThai({super.key});

  @override
  State<HeSinhThai> createState() => _HeSinhThaiState();
}

class _HeSinhThaiState extends State<HeSinhThai> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        keyScaffold: ScaffoldKey,
        backgroundColor: AppColors.grayF5,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Column(
      children: [
        DHeaderShadow(
          title: 'Hệ sinh thái giáo dục'.tr,
          keyMenu: ScaffoldKey,
          showMenu: true,
        ),
        SizedBox(height: 24.sp,),
        Expanded(child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetContainerImage(
                image: Assets.imagesImgHeSinhThai,
                width: Get.width,
                height: 156.sp,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              SizedBox(height: 28.sp,),
              AppText(
                'Hệ sinh thái giáo dục Mẹ yêu con',
                style: AppStyle.DEFAULT_18_BOLD,
              ),
              SizedBox(height: 20.sp,),
              AppText(
                """Trông Trẻ Pro là dự án “Trường học linh hoạt"
ra đời đáp ứng nhu cầu học tập phát triển không ngừng của trẻ em khi trường học phải đóng cửa trong đại dịch covid. Founder của dự án là Thạc sỹ giáo dục Vũ Thị Thúy, CEO của Hệ thống giáo dục mầm non Mẹ Yêu Con và Trung tâm tiếng Anh GrapeSEED Mẹ Yêu Con, người có 15 năm dành tâm huyết cho giáo dục. Sứ mệnh của dự án là “Đồng hành với giáo dục trẻ thơ trong mỗi gia đình. Xây dựng cộng đồng giáo viên tự chủ, tài năng linh hoạt".""",
                style: AppStyle.DEFAULT_14,
              )
            ],
          ),
        ))
      ],
    ));
  }
}

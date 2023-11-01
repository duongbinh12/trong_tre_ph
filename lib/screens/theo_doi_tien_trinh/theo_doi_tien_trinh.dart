import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/no_find_teacher.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/servey.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/trong_khoa_hoc.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../generated/assets.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../home/menu.dart';
import '../service/widget/progress.dart';

class TheoDoiTienTrinh extends StatefulWidget {
  const TheoDoiTienTrinh({super.key});

  @override
  State<TheoDoiTienTrinh> createState() => _TheoDoiTienTrinhState();
}

class _TheoDoiTienTrinhState extends State<TheoDoiTienTrinh> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  TheoDoiTienTrinhController _theoDoiTienTrinhController=Get.find<TheoDoiTienTrinhController>();

  int indexTab=1;
  bool isHuy=Get.arguments[1];

  @override
  void initState() {
    if(Get.arguments[0]!=null) {
      _theoDoiTienTrinhController.indexTab.value=Get.arguments[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      keyScaffold: ScaffoldKey,
      backgroundColor: AppColors.grayF5,
      drawer: Drawer(
        width: Get.width * 0.85,
        child: Menu(),
      ),
      child: GetX<TheoDoiTienTrinhController>(
        builder: (controller) {
          return Column(
            children: [
              DHeaderShadow(
                title:controller.indexTab.value==2? 'Khảo sát'.tr:'Theo dõi tiến trình'.tr,
                keyMenu: ScaffoldKey,
                showMenu: true,
              ),
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.sp,
                    ),
                    DProgress(progress: [
                      Assets.iconsStudent,
                      Assets.iconsReload,
                      Assets.iconsDangKyDichVu3,
                      Assets.iconsDangKyDichVu3,
                    ], title: [
                      "Đang tìm giáo viên",
                      isHuy==true?"Không tìm được giáo viên": "Khảo sát",
                      "Đang trong khóa học",
                      "Hoàn tất"
                    ], indexS: controller.indexTab.value),
                    SizedBox(
                      height: 23.sp,
                    ),
                    Expanded(child: (controller.indexTab.value==2&&isHuy==true)?NoFindTeacher():controller.indexTab.value==2?Servey():controller.indexTab.value==3?TrongKhoaHoc(): Container()),
                  ],
                ),
              ))
            ],
          );
        }
      ),
    );
  }
}

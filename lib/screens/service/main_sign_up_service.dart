import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/service/chon_hoc_phi.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/screens/service/sign_up_service.dart';
import 'package:trong_tre/screens/service/thanh_toan.dart';
import 'package:trong_tre/screens/service/widget/progress.dart';
import 'package:trong_tre/screens/service/xac_nhan_lich_hoc.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../generated/assets.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../home/menu.dart';

class MainSignUpService extends StatefulWidget {
  const MainSignUpService({super.key});

  @override
  State<MainSignUpService> createState() => _MainSignUpServiceState();
}

class _MainSignUpServiceState extends State<MainSignUpService> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  ServiceController _serviceController=Get.find<ServiceController>();

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
            GetX<ServiceController>(
              builder: (controller) {
                return DHeaderShadow(
                  title:controller.tabService.value==1? 'Đăng ký dịch vụ'.tr:controller.tabService.value==2?'Chọn gói học phí'.tr:controller.tabService.value==3?'Xác nhận lịch học'.tr:'Thanh toán'.tr,
                  keyMenu: ScaffoldKey,
                  showMenu: true,
                  colorTitle: AppColors.black,
                );
              }
            ),
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  SizedBox(height: 30.sp,),
                  GetX<ServiceController>(
                    builder: (controller) {
                      return DProgress(progress: [
                        Assets.iconsDangKyDichVu1,
                        Assets.iconsDangKyDichVu2,
                        Assets.iconsDangKyDichVu3,
                        Assets.iconsDangKyDichVu4
                      ],indexS: controller.tabService.value,);
                    }
                  ),
                  SizedBox(height: 16.sp,),
                  Expanded(child: GetX<ServiceController>(builder: (controller) {
                    if(controller.tabService.value==1){
                      return SignUpService();
                    }
                    else if(controller.tabService.value==2){
                      return ChonHocPhi();
                    }
                    else if(controller.tabService.value==3){
                      return XacNhanLichHoc();
                    }
                    else{
                      return ThanhToan();
                    }
                  },))
                ],
              ),
            ))
          ],
        ));
  }
}

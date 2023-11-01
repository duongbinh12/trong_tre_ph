import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';

import '../home/menu.dart';

class ThongTinHoaDon extends StatefulWidget {
  const ThongTinHoaDon({super.key});

  @override
  State<ThongTinHoaDon> createState() => _ThongTinHoaDonState();
}

class _ThongTinHoaDonState extends State<ThongTinHoaDon> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  TextEditingController _tenController = TextEditingController();
  TextEditingController _cmndController = TextEditingController();
  TextEditingController _diaChiController = TextEditingController();
  TextEditingController _maSoThueController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _hoTenConController = TextEditingController();
  TextEditingController _namSinhConController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        backgroundColor: AppColors.grayF5,
        keyScaffold: ScaffoldKey,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Column(
          children: [
            DHeaderShadow(
                title: 'Thông tin hóa đơn'.tr,
                showMenu: true,
                keyMenu: ScaffoldKey),
            SizedBox(
              height: 20.sp,
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                  children: [
                    SizedBox(
                      height: 10.sp,
                    ),
                    DInput(
                      controller: _tenController,
                      bgColor: AppColors.white,
                      title: "Họ và tên",
                      title2: "(Cá nhân hoặc Công ty)",
                      require: true,
                      hintText: 'Nhập tên',
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    DInput(
                      controller: _cmndController,
                      bgColor: AppColors.white,
                      title: "Số CMND/CCCD",
                      require: true,
                      hintText: 'Nhập thông tin',
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    DInput(
                      controller: _diaChiController,
                      bgColor: AppColors.white,
                      title: "Địa chỉ",
                      title2: "(Cá nhân hoặc công ty)",
                      require: true,
                      hintText: 'Nhập thông tin',
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    DInput(
                      controller: _maSoThueController,
                      bgColor: AppColors.white,
                      title: "Mã số thuế",
                      hintText: 'Nhập thông tin',
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    DInput(
                      controller: _emailController,
                      bgColor: AppColors.white,
                      title: "Email",
                      require: true,
                      hintText: 'Nhập email',
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    DInput(
                      controller: _hoTenConController,
                      bgColor: AppColors.white,
                      title: "Họ và tên con",
                      hintText: 'Nhập thông tin',
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    DInput(
                      controller: _namSinhConController,
                      bgColor: AppColors.white,
                      title: "Năm sinh con",
                      hintText: 'Nhập thông tin',
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    DButton(
                        text: 'Yêu cầu'.tr,
                        textColor: AppColors.textBlack,
                        background: AppColors.grayE5,
                        borderColor: AppColors.grayE5,
                        onClick: onClickYeuCau)
                  ],
              ),
            ),
                ))
          ],
        ));
  }

  onClickYeuCau() {
    if (_tenController.text != "" &&
        _diaChiController.text != "" &&
        _diaChiController.text != "" &&
        _emailController.text != "") {
      Get.back();
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: '',
          content:
              'Yêu cầu xuất hợp đồng và hoá đơn dịch vụ của bạn đang được xử lý, xin vui lòng kiểm tra email sau 24h không kể thứ 7, chủ nhật và các ngày nghỉ Lễ, Tết.',
          numberButton: 0);
    } else {
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: 'OK',
          content:
              'Hãy điền đủ thông tin trước khi yêu cầu!',
          numberButton: 1);
    }
  }
}

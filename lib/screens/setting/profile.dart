import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../../res/colors.dart';
import '../../widgets/DInput.dart';
import '../home/menu.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
  TextEditingController _hoTenController = TextEditingController();
  TextEditingController _sdtController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  SettingController _settingController = Get.find<SettingController>();

  XFile? _imagePicker;
  final ImagePicker _picker = ImagePicker();

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
              title: 'Thông tin cá nhân'.tr,
              keyMenu: ScaffoldKey,
              showMenu: true,
            ),
            SizedBox(
              height: 35.sp,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: GetX<SettingController>(builder: (controller) {
                  if (controller.myInfo.value != null) {
                    _hoTenController.text =
                        controller.myInfo.value!.hoten ?? '';
                    _sdtController.text =
                        controller.myInfo.value!.dien_thoai ?? '';
                    _emailController.text =
                        controller.myInfo.value!.email ?? '';
                    _addressController.text =
                        controller.myInfo.value!.dia_chi ?? '';
                    return Column(
                      children: [
                        InkWell(
                          onTap: onClickImage,
                          child: _imagePicker == null
                              ? WidgetNetworkCacheImage(
                                  image:
                                      controller.myInfo.value!.anh_nguoi_dung ??
                                          '',
                                  width: 97.sp,
                                  height: 97.sp,
                                  fit: BoxFit.cover,
                                  borderRadius: 100,
                                )
                              : WidgetContainerImageFile(
                                  image: File(_imagePicker!.path),
                                  width: 97.sp,
                                  height: 97.sp,
                                  fit: BoxFit.cover,
                                  borderRadius: 100,
                                ),
                        ),
                        SizedBox(
                          height: 25.sp,
                        ),
                        DInput(
                          controller: _hoTenController,
                          bgColor: AppColors.white,
                          title: "Họ và tên",
                          require: true,
                          hintText: 'Nhập họ tên',
                          borderRadius: 10,
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        DInput(
                          controller: _sdtController,
                          bgColor: AppColors.white,
                          title: 'Số điện thoại',
                          require: true,
                          enable: false,
                          hintText: 'Nhập số điện thoại',
                          borderRadius: 10,
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        DInput(
                          controller: _emailController,
                          bgColor: AppColors.white,
                          title: 'Email',
                          require: false,
                          enable: false,
                          hintText: 'Nhập email',
                          borderRadius: 10,
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        DInput(
                          controller: _addressController,
                          bgColor: AppColors.white,
                          title: 'Địa chỉ',
                          require: false,
                          hintText: 'Nhập địa chỉ',
                          borderRadius: 10,
                        ),
                        SizedBox(
                          height: 44.sp,
                        ),
                        DButton(
                            text: 'Lưu thay đổi',
                            background: AppColors.primary,
                            borderColor: AppColors.primary,
                            textColor: AppColors.white,
                            onClick: onClickSave)
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                }),
              ),
            ))
          ],
        ));
  }

  onClickSave() {
    print("dâta ${_settingController.myInfo.value!}");
    if (_hoTenController.text == "") {
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: "OK",
          type: 2,
          content: "Hãy nhập họ và tên",
          numberButton: 1);
    }
    else if(_hoTenController.text==_settingController.myInfo.value!.hoten&&(_addressController.text==""||_addressController.text==_settingController.myInfo.value!.dia_chi)){
      NotificationDialog.createSimpleDialog(
          context: context,
          titleButton1: "OK",
          type: 2,
          content: "Hãy thay đổi họ tên hoặc địa chỉ của bạn!",
          numberButton: 1);
    }else{
      _settingController.editInfo(_hoTenController.text, _addressController.text);
    }
  }

  void onClickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        _imagePicker = pickedFile;
      });
      _settingController.editAvatar(File(pickedFile!.path));
    } catch (e) {}
  }
}

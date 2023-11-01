import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
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
                child: Column(
                  children: [
                    InkWell(
                      onTap: onClickImage,
                      child: _imagePicker==null? WidgetNetworkCacheImage(
                        image:
                            'https://allimages.sgp1.digitaloceanspaces.com/tipeduvn/2022/07/1657905893_880_Tuyen-Tap-Bo-Anh-Girl-Xinh-Dep-Nhat-Nam-2020.jpg',
                        width: 97.sp,
                        height: 97.sp,
                        fit: BoxFit.cover,
                        borderRadius: 100,
                      ):WidgetContainerImageFile(
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
                    DButton(text: 'Lưu thay đổi',
                        background: AppColors.grayE5,
                        borderColor: AppColors.grayE5,
                        textColor: AppColors.textBlack,
                        onClick: onClickSave)
                  ],
                ),
              ),
            ))
          ],
        ));
  }

  onClickSave() {}

  void onClickImage() async{
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        _imagePicker=pickedFile;
      });
    } catch (e) {

    }
  }
}

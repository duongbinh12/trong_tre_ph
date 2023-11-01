import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../generated/assets.dart';
import '../../widgets/widget_handle.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  TextEditingController _passController = TextEditingController();
  TextEditingController _rePassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Column(
        children: [
          Stack(
            children: [
              WidgetContainerImage(
                image: Assets.imagesBgResetPass,
                width: Get.width,
                height: Get.width * (303 / 393),
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: MediaQuery.of(context).viewPadding.top + 10.sp,
                  left: 10.sp,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: SvgPicture.asset(
                        Assets.iconsBack,
                      ),
                    ),
                  ))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.sp,
                  ),
                  AppText(
                    'Tạo mật khẩu mới',
                    style: AppStyle.DEFAULT_16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 32.sp,
                  ),
                  DInput(
                      controller: _passController,isPass: true, hintText: 'Mật khẩu mới*'),
                  SizedBox(
                    height: 15.sp,
                  ),
                  DInput(
                      controller: _rePassController,
                      isPass: true,
                      hintText: 'Nhập lại mật khẩu mới*'),
                  SizedBox(height: 15.sp,),
                  DButton(text: 'Lưu mật khẩu', onClick: onClickSave)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  onClickSave() {
    AppNavigator.navigateChangePassSuccess();
  }
}

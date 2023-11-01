import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';

import '../../res/colors.dart';

class Policy extends StatefulWidget {
  const Policy({super.key,required this.onClick});
  final Function onClick;

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 38.sp,
            height: 4.sp,
            decoration: BoxDecoration(
                color: AppColors.grayE5,
                borderRadius: BorderRadius.circular(50)),
          ),
          SizedBox(
            height: 20.sp,
          ),
          AppText(
            'Điều khoản sử dụng'.tr,
            textAlign: TextAlign.center,
            style: AppStyle.DEFAULT_20_BOLD,
          ),
          SizedBox(
            height: 15.sp,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GetX<LoginController>(
                builder: (controller) {
                  if(controller.policy.value!="") {
                    return AppText(
                      controller.policy.value,
                      style: AppStyle.DEFAULT_14,
                    );
                  } else {
                    return SizedBox();
                  }
                }
              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                check=!check;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 30.sp,
                  height: 30.sp,
                  child: Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        value: check,
                        activeColor: AppColors.blue2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.sp)),
                        onChanged: (bool? value) {
                          setState(() {
                            check = value!;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                  child: AppText(
                    'Tôi đã đọc và đồng ý với các Điều khoản sử dụng ứng dụng của Trông trẻ Pro',
                    style: AppStyle.DEFAULT_14,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.sp,
          ),
          DButton(text: 'Đăng ký', onClick: onClickAccept)
        ],
      ),
    );
  }

  onClickAccept() {
    if(check==true){
      widget.onClick();
    }

  }
}

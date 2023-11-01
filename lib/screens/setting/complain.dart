import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/widget_contact.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../home/menu.dart';

class Complain extends StatefulWidget {
  const Complain({super.key});

  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  TextEditingController _gopYController = TextEditingController();

  bool checkSend=false;

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
              height: 28.sp,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: [
                      DInput(
                        controller: _gopYController,
                        hintText: 'Nhập nội dung',
                        bgColor: AppColors.white,
                        maxLine: 5,
                        borderRadius: 10.sp,
                        title: "Góp ý".tr,
                        onChange: (String text){
                          if(text!=""&&checkSend==false){
                            setState(() {
                              checkSend=true;
                            });
                          }
                          else if(text==""&&checkSend==true){
                            setState(() {
                              checkSend=false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      WidgetContact(),
                      SizedBox(
                        height: 22.sp,
                      ),
                      DButton(
                          text: 'Gửi',
                          background: checkSend==true?AppColors.primary:AppColors.grayE5,
                          borderColor:checkSend==true?AppColors.primary: AppColors.grayE5,
                          textColor:checkSend==true?AppColors.white: AppColors.textBlack,
                          onClick: onClickSend)
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  onClickSend() {

  }
}

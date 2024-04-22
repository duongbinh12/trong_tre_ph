import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/widgets/DHeader.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../widgets/DHeader_shadow.dart';

class XemKhaoSat extends StatefulWidget {
  const XemKhaoSat({super.key});

  @override
  State<XemKhaoSat> createState() => _XemKhaoSatState();
}

class _XemKhaoSatState extends State<XemKhaoSat> {
  int id=Get.arguments;
  TheoDoiTienTrinhController _controller=Get.find<TheoDoiTienTrinhController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _controller.xemKhaoSat(id: id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(child: Column(
      children: [
        DHeaderShadow(title: 'Xem nội dung khảo sát'),
        Expanded(
          child: GetX<TheoDoiTienTrinhController>(
            builder: (controller) {
              if(controller.linkKhaoSat.value!=null){
                return HtmlWidget(
                    controller.linkKhaoSat.value??''
                );
              }
              else return Center(
                child: AppText('Giáo viên chưa thực hiện khảo sát',style: AppStyle.DEFAULT_16.copyWith(fontStyle: FontStyle.italic),),
              );
            }
          ),
        )
      ],
    ));
  }
}

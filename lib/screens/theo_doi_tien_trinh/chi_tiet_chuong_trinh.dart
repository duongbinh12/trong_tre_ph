import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/container_text.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../home/menu.dart';

class ChiTietChuongTrinh extends StatefulWidget {
  const ChiTietChuongTrinh({super.key});

  @override
  State<ChiTietChuongTrinh> createState() => _ChiTietChuongTrinhState();
}

class _ChiTietChuongTrinhState extends State<ChiTietChuongTrinh> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      keyScaffold: ScaffoldKey,
      drawer: Drawer(
        width: Get.width*0.85,
        child: Menu(),
      ),
      child: Column(
        children: [
          DHeaderShadow(title: 'Chi tiết chương trình'.tr,showMenu: true,keyMenu: ScaffoldKey,),
          SizedBox(height: 10.sp,),
          Expanded(child: Stack(
            children: [
              Positioned(left: 0,right: 0,bottom: 0,child: WidgetContainerImage(
                image: Assets.imagesBgDetailProgram,
                width: Get.width,
                height: Get.width*(262/393),
                fit: BoxFit.cover,
              )),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  margin: EdgeInsets.only(top: 20.sp),
                  child: Column(
                    children: [
                      ItemChuongTrinh(),
                      SizedBox(height: 15.sp,),
                      ItemChuongTrinh(),
                      SizedBox(height: 15.sp,),
                      ItemChuongTrinh(),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class ItemChuongTrinh extends StatefulWidget {
  const ItemChuongTrinh({super.key});

  @override
  State<ItemChuongTrinh> createState() => _ItemChuongTrinhState();
}

class _ItemChuongTrinhState extends State<ItemChuongTrinh> {
  double? height=65.sp;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 15,
            spreadRadius: 0,
            color: AppColors.blue2.withOpacity(0.15)
          )
        ],
        borderRadius: BorderRadius.circular(10.sp)
      ),
      duration: Duration(milliseconds: 300),
      height: height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.sp,top: 15.sp,bottom: 10.sp),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1,color: AppColors.grayF2)
              )
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsBook,
                  width: 15.sp,
                  height: 15.sp,
                  color: AppColors.primary,
                ),
                SizedBox(width: 6.sp,),
                Expanded(child:AppText('Kế hoạch Bảo mẫu Pro 1',style: AppStyle.DEFAULT_18_BOLD,)),
                SizedBox(width: 10.sp,),
                ContainerText(text: '#1001', color: AppColors.primary),
                InkWell(
                  onTap: (){
                    if(height==null)
                    setState(() {
                      height=65.sp;
                    });
                    else{
                      setState(() {
                        height=null;
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: RotatedBox(
                      quarterTurns:height==null? 1:3,
                      child: SvgPicture.asset(
                        Assets.iconsBack,
                        width: 14.sp,
                        height: 14.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.sp,),
          ...List.generate(5, (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            margin: EdgeInsets.only(bottom: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Nội dung hoạt động buổi ${index+1}',style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600),),
                SizedBox(height: 10.sp,),
                AppText("""1. Tổ chức vui chơi có chủ đích cho trẻ, thực hiện bài dạy phát triển cho trẻ dưới sự chỉ đạo của Quản lý Chuyên môn
            
2. Sắp xếp không gian của trẻ (đồ cá nhân của bé, không gian học và chơi)""",style: AppStyle.DEFAULT_14.copyWith(),),
              ],
            ),
          ))
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/container_text.dart';
import 'package:trong_tre/services/entity/chuong_trinh_hoc_response.dart';
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

  TheoDoiTienTrinhController _theoDoiTienTrinhController =
      Get.find<TheoDoiTienTrinhController>();
  int caDayId = Get.arguments;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _theoDoiTienTrinhController.getChuongTrinhHoc(ca_day_id: caDayId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      keyScaffold: ScaffoldKey,
      drawer: Drawer(
        width: Get.width * 0.85,
        child: Menu(),
      ),
      child: Column(
        children: [
          DHeaderShadow(
            title: 'Chi tiết chương trình'.tr,
            showMenu: true,
            keyMenu: ScaffoldKey,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: WidgetContainerImage(
                    image: Assets.imagesBgDetailProgram,
                    width: Get.width,
                    height: Get.width * (262 / 393),
                    fit: BoxFit.cover,
                  )),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  margin: EdgeInsets.only(top: 20.sp),
                  child:
                  GetX<TheoDoiTienTrinhController>(builder: (controller) {
                    if (controller.chuongTrinhHocList.value != null) {
                      return Column(
                          children:
                          // [

                          List.generate(controller.chuongTrinhHocList.value!.length, (index) => Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: controller.chuongTrinhHocList.value![index].ten_chuong_trinh??'',
                                  style: AppStyle.DEFAULT_18_BOLD,
                                  children: <TextSpan>[
                                    TextSpan(text: controller.chuongTrinhHocList.value![index].name??'', style: AppStyle.DEFAULT_18_BOLD.copyWith(color: AppColors.primary))
                                  ],
                                ),
                              ),
                              ...List.generate(controller.chuongTrinhHocList.value![index].goiHoc!.length, (index1) => ItemChuongTrinh(data: controller.chuongTrinhHocList.value![index].goiHoc![index1],))
                            ],
                          ))
                        // ]
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
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
  const ItemChuongTrinh({super.key,required this.data});
  final ChuongTrinhHocData data;

  @override
  State<ItemChuongTrinh> createState() => _ItemChuongTrinhState();
}

class _ItemChuongTrinhState extends State<ItemChuongTrinh> {
  double? height = 65.sp;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 0,
                color: AppColors.blue2.withOpacity(0.15))
          ],
          borderRadius: BorderRadius.circular(10.sp)),
      duration: Duration(milliseconds: 300),
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.sp, top: 15.sp, bottom: 10.sp),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.grayF2))),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsBook,
                  width: 15.sp,
                  height: 15.sp,
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: 6.sp,
                ),
                Expanded(
                    child: AppText(
                      'Bài học',
                      style: AppStyle.DEFAULT_18_BOLD,
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                ContainerText(text: '#${widget.data.tieu_de}', color: AppColors.primary),
                InkWell(
                  onTap: () {
                    if (height == null)
                      setState(() {
                        height = 65.sp;
                      });
                    else {
                      setState(() {
                        height = null;
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: RotatedBox(
                      quarterTurns: height == null ? 1 : 3,
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
          SizedBox(
            height: 15.sp,
          ),
          if(widget.data.giaoCu!=null&&widget.data.giaoCu!.isNotEmpty) Wrap(

            children: List.generate(widget.data.giaoCu!.length, (index) => Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: AppColors.grayE5),
                  borderRadius: BorderRadius.circular(10.sp)
              ),
              margin: EdgeInsets.only(left: 15.w),
              clipBehavior: Clip.antiAlias,
              width: 156.w,
              child: Column(
                children: [
                  WidgetNetworkImage(image: widget.data.giaoCu![index].image??'',width: 154.w,height: 105.h,fit: BoxFit.contain,borderRadius: 0,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 6.h),
                    decoration: BoxDecoration(
                        color: AppColors.orange
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppText(
                            'Gói giáo cụ',
                            style: AppStyle.DEFAULT_12_BOLD.copyWith(color: AppColors.white),
                          ),
                        ),
                        SizedBox(width: 6.sp,),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(50.sp)
                          ),
                          child: AppText(
                            widget.data.giaoCu![index].code??'',
                            textAlign: TextAlign.center,
                            style: AppStyle.DEFAULT_14.copyWith(color: AppColors.orange,fontWeight: FontWeight.w600),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
          SizedBox(
            height: 15.sp,
          ),
          ...List.generate(
              widget.data.buoiHoc!.length,
                  (index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                margin: EdgeInsets.only(bottom: 15.sp),
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Nội dung hoạt động buổi ${widget.data.buoiHoc![index].buoi}',
                      style: AppStyle.DEFAULT_14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    HtmlWidget(
                      widget.data.buoiHoc![index].noi_dung??'',
                      textStyle: AppStyle.DEFAULT_14.copyWith(),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

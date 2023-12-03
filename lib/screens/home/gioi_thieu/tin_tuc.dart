import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/home/controllers/home_controller.dart';
import 'package:trong_tre/services/api/api.dart';
import 'package:trong_tre/services/entity/tin_tuc_response.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/DTittle.dart';

class TinTuc extends StatefulWidget {
  const TinTuc({super.key, this.noTitle = false, this.noScroll = true,this.isFull=false});

  final bool? noTitle;
  final bool? noScroll;
  final bool? isFull;

  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {

  HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        children: [
          widget.noTitle == false
              ? DTitle(
                  title: 'Tin tức'.tr,
                  showMore: (){
                    onClickShowMore();
                  },
                )
              : SizedBox(),
          widget.noTitle == false
              ? SizedBox(
                  height: 20.sp,
                )
              : SizedBox(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetX<HomeController>(builder: (controller) {
              if (controller.listTabTinTuc.value != null) {
                return Row(
                  children: List.generate(
                      controller.listTabTinTuc.value!.length,
                      (index) => InkWell(
                            onTap: () {
                              _homeController.changeIndexTab(index);
                              _homeController.getNews(
                                  type: controller
                                      .listTabTinTuc.value![index].id!,
                                  page: 1,
                                  limit: 10,
                                  tuKhoa: "",
                                  sort: 1);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.sp, horizontal: 8.sp),
                              decoration: BoxDecoration(
                                  color: controller.indexTab.value == index
                                      ? AppColors.primary
                                      : AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50.sp)),
                              constraints: BoxConstraints(minWidth: 86.sp),
                              margin: EdgeInsets.only(right: 4.sp),
                              child: AppText(
                                controller.listTabTinTuc.value![index].name ??
                                    '',
                                textAlign: TextAlign.center,
                                style: AppStyle.DEFAULT_14.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: controller.indexTab.value == index
                                        ? AppColors.white
                                        : AppColors.black,
                                    height: 1),
                              ),
                            ),
                          )),
                );
              } else
                return SizedBox();
            }),
          ),
          SizedBox(
            height: 18.sp,
          ),
          // ...List.generate(tinTuc.length, (index) => _item(tinTuc[index])),
          GetX<HomeController>(builder: (controller) {
            if (controller.listTinTuc.value != null) {
              if (controller.listTinTuc.value!.length > 0) {
                return ListView.builder(
                  itemCount:widget.isFull==true? controller.listTinTuc.value!.length:controller.listTinTuc.value!.length>3?3:controller.listTinTuc.value!.length,
                  physics: widget.noScroll == true
                      ? NeverScrollableScrollPhysics()
                      : BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _item(controller.listTinTuc.value![index]);
                  },
                );
              }
              else{
                return Center(child: AppText("Không có dữ liệu",style: AppStyle.DEFAULT_16.copyWith(fontStyle: FontStyle.italic),),);
              }
            } else
              return SizedBox();
          })
        ],
      ),
    );
  }

  Widget _item(ItemNews data) {
    return InkWell(
      onTap: ()async{
        if (!await launchUrl(Uri.parse(data.link??''))) {
          throw Exception('Could not launch');
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 11.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                  blurRadius: 10,
                  color: AppColors.blue2.withOpacity(0.15))
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.sp, vertical: 6.sp),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.sp),
                          bottomLeft: Radius.circular(10.sp))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.iconsClock,
                        width: 15.sp,
                        height: 15.sp,
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      AppText(
                        data.date ?? '',
                        style: AppStyle.DEFAULT_12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            height: 1.3),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 19.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data.tieu_de ?? '',
                          style: AppStyle.DEFAULT_14_BOLD,
                        ),
                        SizedBox(
                          height: 8.sp,
                        ),
                        HtmlWidget(
                          data.noi_dung ?? '',
                          textStyle: AppStyle.DEFAULT_12,

                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.sp,
                  ),
                  WidgetNetworkCacheImage(
                    image: data.anh_dai_dien ?? '',
                    width: 80.sp,
                    height: 80.sp,
                    fit: BoxFit.cover,
                    borderRadius: 10.sp,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onClickShowMore() {
    AppNavigator.navigateNews();
  }
}

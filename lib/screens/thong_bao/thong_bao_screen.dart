import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../generated/assets.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class ThongBaoScreen extends StatefulWidget {
  const ThongBaoScreen({super.key});

  @override
  State<ThongBaoScreen> createState() => _ThongBaoScreenState();
}

class _ThongBaoScreenState extends State<ThongBaoScreen> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  List<String> title = ['Tất cả', 'Đơn hàng', 'Khuyến mãi', 'Khác'];

  int indexSelect = 0;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        keyScaffold: ScaffoldKey,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Stack(
          children: [
            WidgetContainerImage(
              image: Assets.imagesBgPrimary,
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
                child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top + 20.sp,
                ),
                DHeader(
                    title: 'Thông báo',
                    colorTitle: AppColors.white,
                    noBack: true,
                    showMenu: true,
                    keyMenu: ScaffoldKey),
                SizedBox(
                  height: 5.sp,
                ),
                Expanded(
                    child: Container(
                      width: Get.width,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30.sp))),
                  padding:
                      EdgeInsets.only(top: 30.sp, left: 20.sp, right: 20.sp),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              title.length,
                              (index) => InkWell(
                                onTap: (){
                                  setState(() {
                                    indexSelect=index;
                                  });
                                },
                                child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(46.sp),
                                          color: index == indexSelect
                                              ? AppColors.primary
                                              : AppColors.primary
                                                  .withOpacity(0.15)),
                                      padding: EdgeInsets.symmetric(horizontal: 17.sp,vertical: 12.sp),
                                      margin: EdgeInsets.only(right: 4.sp),
                                      child: AppText(
                                        title[index],
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: index == indexSelect
                                                ? AppColors.white
                                                : AppColors.textBlack,
                                            height: 1.2),
                                      ),
                                    ),
                              )),
                        ),
                      ),
                      SizedBox(height: 10.sp,),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 20.sp),
                          itemCount: 3,
                          shrinkWrap: true,
                          // clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 20.sp),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppText(
                                        '10/08/2023',
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500,color: AppColors.gray7D,height: 1),
                                      ),
                                      Expanded(child: Container(
                                        width: Get.width,
                                        height: 1,color: AppColors.grayE5,
                                        margin: EdgeInsets.only(bottom: 2.sp),
                                      ))
                                    ],
                                  ),
                                  SizedBox(height: 15.sp,),
                                  ...List.generate(3, (index) => _item())
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ))
          ],
        ));
  }

  Widget _item(){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            color: AppColors.blue2.withOpacity(0.15)
          )
        ]
      ),
      margin: EdgeInsets.only(bottom: 12.sp,left: 2.sp,right: 2.sp),
      padding: EdgeInsets.symmetric(horizontal: 13.sp,vertical: 13.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.sp,
            height: 48.sp,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: AppColors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50)
            ),
            child: SvgPicture.asset(
              Assets.iconsIcItemHistory,
              width: 28.sp,
              height: 28.sp,
              color: AppColors.green,
            ),
          ),
          SizedBox(width: 13.sp,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Buổi học đã hoàn thành!',
                  style: AppStyle.DEFAULT_18_BOLD.copyWith(height: 1.1),
                ),
                SizedBox(height: 8.sp,),
                AppText(
                  '10 phút trước • 11/08/2023',
                  style: AppStyle.DEFAULT_12.copyWith(height: 1.2),
                ),
                SizedBox(height:10.sp,),
                Container(
                  width: Get.width,
                  height: 1,
                  color: AppColors.grayE5,
                ),
                SizedBox(height: 10.sp,),
                AppText(
                  """Ca dạy của giáo viên bắt đầu lúc 8h00.
Bạn vui lòng kiểm tra lại thông tin.
Chúc bạn may mắn!""",
                  style: AppStyle.DEFAULT_14.copyWith(height: 1.2),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

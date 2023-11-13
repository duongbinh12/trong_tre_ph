import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/thong_bao/controllers/thong_bao_controller.dart';
import 'package:trong_tre/services/entity/thong_bao_response.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../common/routes/navigator.dart';
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

  LoginController _loginController = Get.find<LoginController>();
  ThongBaoController _thongBaoController = Get.find<ThongBaoController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _thongBaoController.getThongBao(type: "", page: 1, sort: 1, tuKhoa: "");
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
                  child: _loginController.token != null
                      ? Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: GetX<ThongBaoController>(
                                  builder: (controller) {
                                if (controller.listType.value != null) {
                                  return Row(
                                    children: List.generate(
                                        controller.listType.value!.length,
                                        (index) => InkWell(
                                              onTap: () {
                                                setState(() {
                                                  indexSelect = index;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            46.sp),
                                                    color: index == indexSelect
                                                        ? AppColors.primary
                                                        : AppColors.primary
                                                            .withOpacity(0.15)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 17.sp,
                                                    vertical: 12.sp),
                                                margin: EdgeInsets.only(
                                                    right: 4.sp),
                                                child: AppText(
                                                  controller.listType
                                                          .value![index].name ??
                                                      '',
                                                  style: AppStyle.DEFAULT_14
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: index ==
                                                                  indexSelect
                                                              ? AppColors.white
                                                              : AppColors
                                                                  .textBlack,
                                                          height: 1.2),
                                                ),
                                              ),
                                            )),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              }),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Expanded(
                              child: GetX<ThongBaoController>(
                                  builder: (controller) {
                                if (controller.listThongBao.value != null) {
                                  return ListView.builder(
                                    padding: EdgeInsets.only(top: 20.sp),
                                    itemCount:
                                        controller.listThongBao.value!.length,
                                    shrinkWrap: true,
                                    // clipBehavior: Clip.none,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 20.sp),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                AppText(
                                                  controller.listThongBao
                                                          .value![index].date ??
                                                      '',
                                                  style: AppStyle.DEFAULT_14
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.gray7D,
                                                          height: 1),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  width: Get.width,
                                                  height: 1,
                                                  color: AppColors.grayE5,
                                                  margin: EdgeInsets.only(
                                                      bottom: 2.sp),
                                                ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.sp,
                                            ),
                                            ...List.generate(
                                                controller.listThongBao
                                                    .value![index].data!.length,
                                                (index1) => _item(controller
                                                    .listThongBao
                                                    .value![index]
                                                    .data![index1]))
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else
                                  return SizedBox();
                              }),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            WidgetContainerImage(
                              image: Assets.imagesBgLogin,
                              width: Get.width,
                              height: (Get.width) * 303 / 393,
                              fit: BoxFit.contain,
                            ),
                            InkWell(
                              onTap: () {
                                AppNavigator.navigateLogin();
                              },
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Hãy ',
                                    style: AppStyle.DEFAULT_16,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'đăng nhập',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary)),
                                      TextSpan(
                                          text: ' để sử dụng tính năng này!'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ))
              ],
            ))
          ],
        ));
  }

  Widget _item(ItemThongBao data) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.sp),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 10,
                color: AppColors.blue2.withOpacity(0.15))
          ]),
      margin: EdgeInsets.only(bottom: 12.sp, left: 2.sp, right: 2.sp),
      padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 13.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: 48.sp,
          //   height: 48.sp,
          //   padding: EdgeInsets.all(10.sp),
          //   decoration: BoxDecoration(
          //     color: AppColors.green.withOpacity(0.2),
          //     borderRadius: BorderRadius.circular(50)
          //   ),
          //   child: SvgPicture.asset(
          //     Assets.iconsIcItemHistory,
          //     width: 28.sp,
          //     height: 28.sp,
          //     color: AppColors.green,
          //   ),
          // ),
          WidgetNetworkImage(
            image: data.image ?? '',
            width: 48.sp,
            height: 48.sp,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 13.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  data.tieu_de ?? '',
                  style: AppStyle.DEFAULT_18_BOLD.copyWith(height: 1.1),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                AppText(
                  data.created ?? '',
                  style: AppStyle.DEFAULT_12.copyWith(height: 1.2),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  width: Get.width,
                  height: 1,
                  color: AppColors.grayE5,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                AppText(
                  data.noi_dung ?? '',
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

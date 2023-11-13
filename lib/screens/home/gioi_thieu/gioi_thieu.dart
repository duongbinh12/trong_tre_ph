import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/home/controllers/home_controller.dart';
import 'package:trong_tre/screens/home/gioi_thieu/header_home.dart';
import 'package:trong_tre/screens/home/gioi_thieu/tin_tuc.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/services/api/api.dart';
import 'package:trong_tre/services/entity/home_response.dart';
import 'package:trong_tre/widgets/DTittle.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../../login/controllers/login_controller.dart';

class GioiThieu extends StatefulWidget {
  const GioiThieu({super.key, required this.ScaffoldKey});

  final GlobalKey<ScaffoldState> ScaffoldKey;

  @override
  State<GioiThieu> createState() => _GioiThieuState();
}

class _GioiThieuState extends State<GioiThieu> {
  PageController _pageController = PageController();
  PageController _pageDichVuController = PageController();

  List dichVu = [
    {'image': Assets.iconsDichVu1, 'name': 'Bảo mẫu Pro', 'status': 1},
    {'image': Assets.iconsDichVu4, 'name': 'Năng khiếu thể thao', 'status': 1},
    {'image': Assets.iconsDichVu2, 'name': 'Giáo dục sớm', 'status': 1},
    {'image': Assets.iconsDichVu5, 'name': 'Gia sư', 'status': 1},
    {
      'image': Assets.iconsDichVu3,
      'name': 'Thực hành kỹ năng cuộc sống',
      'status': 2
    },
    {'image': Assets.iconsDichVu6, 'name': 'Tư vấn và đào tạo', 'status': 1},
  ];

  HomeController _homeController = Get.find<HomeController>();
  LoginController _loginController = Get.find<LoginController>();
  SettingController _settingController = Get.find<SettingController>();
  ScrollController _bannerController=ScrollController();
  ScrollController _dichVuController=ScrollController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _homeController.getHome();
      if (_loginController.token != null) {
        _settingController.getMyInfo();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderHome(
          keyMenu: widget.ScaffoldKey,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 21.sp,
              ),
              _slide(),
              SizedBox(
                height: 15.sp,
              ),
              Container(
                width: Get.width,
                height: 10.sp,
                color: AppColors.grayF7,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 10.sp, right: 10.sp, top: 20.sp, bottom: 25.sp),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp),
                      child: DTitle(title: 'Các dịch vụ'),
                    ),
                    SizedBox(
                      height: 11.sp,
                    ),
                    GetX<HomeController>(builder: (controller) {
                      if (controller.listDichVu.value != null) {
                        return SizedBox(
                          height: (Get.width - 10.sp - 10.sp - 15.sp - 15.sp) /
                                  3 +
                              (Get.width - 10.sp - 10.sp - 15.sp - 15.sp) / 3 +
                              15.sp +
                              20.sp,
                          child: GridView.builder(
                            itemCount: controller.listDichVu.value!.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.sp, horizontal: 10.sp),
                            scrollDirection: Axis.horizontal,
                            physics: PageScrollPhysics(),
                            controller: _dichVuController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15.sp,
                                    mainAxisSpacing: 15.sp,
                                    mainAxisExtent: (Get.width -
                                            20.sp -
                                            20.sp -
                                            15.sp -
                                            15.sp) /
                                        3),
                            itemBuilder: (context, index) {
                              return _item(controller.listDichVu.value![index]);
                            },
                          ),
                        );
                      } else
                        return SizedBox();
                    }),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Center(
                      child: ScrollIndicator(
                        scrollController: _dichVuController,
                        width: 20.sp,
                        height: 5.sp,
                        indicatorWidth: 20.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.grayD9),
                        indicatorDecoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: 10.sp,
                color: AppColors.grayF7,
              ),
              SizedBox(
                height: 19.sp,
              ),
              TinTuc(),
            ],
          ),
        ))
      ],
    );
  }

  Widget _slide() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Stack(
        children: [
          GetX<HomeController>(builder: (controller) {
            if (controller.listBanner.value != null) {
              return SingleChildScrollView(
                controller: _bannerController,
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                child: Row(
                  children: List.generate(controller.listBanner.value!.length, (index) => WidgetNetworkCacheImage(
                    image: controller.listBanner.value![index].image??'',
                    width: Get.width - 20.sp - 20.sp,
                    height: (Get.width - 20.sp - 20.sp) * (200 / 353),
                    fit: BoxFit.cover,
                    borderRadius: 10.sp,
                  )),
                ),
              );
            } else
              return SizedBox();
          }),
          Positioned(
            left: 10.sp,
            right: 10.sp,
            bottom: 10.sp,
            child: Center(
              child: ScrollIndicator(
                scrollController: _bannerController,
                width: 20.sp,
                height: 5.sp,
                indicatorWidth: 20.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.grayD9),
                indicatorDecoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _item(ItemDichVu data) {
    return InkWell(
      onTap: () {
        AppNavigator.navigateService(data.id!);
      },
      child: Opacity(
        opacity: data.khoa_dich_vu==0? 1:0.5,
        child: Container(
          width: (Get.width - 20.sp - 20.sp - 15.sp - 15.sp) / 3,
          height: (Get.width - 20.sp - 20.sp - 15.sp - 15.sp) / 3,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.sp),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: AppColors.blue2.withOpacity(0.15))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetNetworkCacheImage(
                image: "${Endpoint.BASE_URL}/${data.image ?? ''}",
                width: 52.sp,
                height: 47.sp,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 12.sp,
              ),
              AppText(
                data.ten_dich_vu ?? '',
                textAlign: TextAlign.center,
                style: AppStyle.DEFAULT_14.copyWith(
                    fontWeight: FontWeight.w600, height: 1.2, fontSize: 13.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}

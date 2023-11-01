import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/screens/history/history_screen.dart';
import 'package:trong_tre/screens/home/gioi_thieu/gioi_thieu.dart';
import 'package:trong_tre/screens/home/menu.dart';
import 'package:trong_tre/screens/home/screen.dart';
import 'package:trong_tre/screens/setting/setting_screen.dart';
import 'package:trong_tre/screens/thong_bao/thong_bao_screen.dart';

import '../../res/app_styles.dart';
import '../../res/app_values.dart';
import '../../res/colors.dart';
import '../../widgets/app_base_page.dart';
import '../../widgets/app_text.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/widget_handle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  int page=0;
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();


  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: AppBasePage(
          appBarBottom: MyAppBar.bottomEmpty(
            backgroundColor: AppColors.black,
          ),
          keyScaffold: ScaffoldKey,
          drawer: Drawer(
            width: Get.width*0.85,
            child: Menu(),
          ),
          child: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: AppText('tap_to_close'.tr,
                  style: AppStyle.DEFAULT_14.copyWith(color: Colors.white)),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                         GioiThieu(ScaffoldKey: ScaffoldKey),
                         HistoryScreen(),
                         ThongBaoScreen(),
                         SettingScreen(),
                        ],
                      )),
                  //Divider(thickness: 1,),

                  _buildMenu()
                ],
              ),
            ),
          )),
    );
  }
  _buildMenu() {
    return Container(
        height: 80.sp,
        width: Get.width,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp)),
          boxShadow: [
            BoxShadow(
              color: AppColors.blue2.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: Row(children: [
          itemMenu(
              image:page==0?Assets.iconsHomeS :Assets.assetsIconsHome,
              index: 0,
              title: 'Giới thiệu'.tr),
          itemMenu(
              image: page==1?Assets.iconsClockS :Assets.iconsHistory,
              index: 1,
              title: 'Lịch sử'),
          itemMenu(
              image: page==2?Assets.iconsNotificationS :Assets.iconsNotification,
              index: 2,
              title: 'Thông báo'),
          itemMenu(
              image: page==3?Assets.iconsSettingS :Assets.iconsSetting,
              index: 3,
              title: 'Cài đặt'),
        ]));
  }

  itemMenu(
      {required String image,
        required int index,
        required String title,
        String? avatar}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController?.index = index;
          page = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(),
        width: Get.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 30.sp,
              width: 30.sp,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8.sp,),
            AppText(
              title,
              style: AppStyle.DEFAULT_14
                  .copyWith(color: page == index ? AppColors.primary : null,fontWeight: FontWeight.w500),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}

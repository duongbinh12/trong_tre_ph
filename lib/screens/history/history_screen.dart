import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/history/controllers/history_controller.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import 'package:trong_tre/services/entity/history_order_response.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../common/routes/navigator.dart';
import '../../generated/assets.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  List<String> dropdown = ['Mới nhất', 'Cũ nhất'];
  String valueDropdown = 'Mới nhất';
  TextEditingController _matKhauController = TextEditingController();
  LoginController _loginController = Get.find<LoginController>();
  HistoryController _historyController = Get.find<HistoryController>();
  SettingController _settingController = Get.find<SettingController>();
  ScrollController _scrollController=ScrollController();
  int page=1;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      if (_loginController.token != null) {
        _historyController.getHistory(page: 1, tuKhoa: "", sort: 1);
      }
    });


    _scrollController.addListener(() {
      if(_scrollController.offset==_scrollController.position.maxScrollExtent  ){
        _historyController.getHistory(page: page+1, tuKhoa: "", sort: dropdown.indexOf(valueDropdown)==0?1:0);
        page=page+1;
      }

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
              child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top + 20.sp,
            ),
            DHeader(
                title: 'Lịch sử',
                colorTitle: AppColors.white,
                noBack: true,
                showMenu: true,
                keyMenu: ScaffoldKey),
            SizedBox(
              height: 5.sp,
            ),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.sp))),
                    padding:
                        EdgeInsets.only(top: 30.sp, left: 20.sp, right: 20.sp),
                    child: _loginController.token != null
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AppText(
                                      'Danh sách đơn của bạn'.tr,
                                      style: AppStyle.DEFAULT_18_BOLD,
                                    ),
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      items: dropdown
                                          .map((String item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: AppText(
                                                  item,
                                                  style: AppStyle.DEFAULT_14,
                                                ),
                                              ))
                                          .toList(),
                                      value: valueDropdown,
                                      onChanged: (String? value) {
                                        _historyController.getHistory(page: 1, tuKhoa: "", sort: dropdown.indexOf(value!)==0?1:0);
                                        setState(() {
                                          valueDropdown = value;
                                        });
                                      },
                                      dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15.sp))),
                                      customButton: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.grayF2,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14.sp, vertical: 9.sp),
                                        child: Row(
                                          children: [
                                            AppText(
                                              valueDropdown,
                                              style: AppStyle.DEFAULT_14
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1),
                                            ),
                                            SizedBox(
                                              width: 5.sp,
                                            ),
                                            RotatedBox(
                                              quarterTurns: 3,
                                              child: SvgPicture.asset(
                                                Assets.iconsBack,
                                                width: 8.sp,
                                                height: 8.sp,
                                                color: AppColors.textBlack,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Expanded(
                                child: GetX<HistoryController>(
                                    builder: (controller) {
                                  if (controller.listHistory.value != null) {
                                    if (controller
                                        .listHistory.value!.isNotEmpty) {
                                      return RefreshIndicator(
                                        onRefresh: () {
                                          _historyController.getHistory(page: 1, tuKhoa: "", sort: 1);
                                          page=1;
                                          return Future<void>.delayed(const Duration(milliseconds: 500));
                                        },
                                        child: ListView.builder(
                                          controller: _scrollController,
                                          itemCount: controller
                                              .listHistory.value!.length,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.only(top: 5.sp),
                                          itemBuilder: (context, index) {
                                            return _itemHistory(controller
                                                .listHistory.value![index]);
                                          },
                                        ),
                                      );
                                    } else {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.iconsClock,
                                            width: 80.w,
                                            height: 80.w,
                                            color: AppColors.textBlack
                                                .withOpacity(0.3),
                                          ),
                                          AppText(
                                            'Danh sách lịch sử trống',
                                            style: AppStyle.DEFAULT_16.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.textBlack
                                                    .withOpacity(0.3)),
                                          )
                                        ],
                                      );
                                    }
                                  } else {
                                    return const SizedBox();
                                  }
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
                                        const TextSpan(
                                            text: ' để sử dụng tính năng này!'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )))
          ]))
        ],
      ),
    );
  }

  Widget _itemHistory(ItemHistoryOrder data) {
    Color colorItem = data.trang_thai!.id == 47
        ? AppColors.blue
        : data.trang_thai!.id == 46
            ? AppColors.orange2
        : data.trang_thai!.id == 48
        ? AppColors.green
    :data.trang_thai!.id==49?const Color(0xff29A0EB)
    :data.trang_thai!.id==45?const Color.fromRGBO(255,183,97,1)
            : AppColors.primary;
    // Color colorItem=AppColors.orange;
    return InkWell(
      onTap: () {
        if(data.trang_thai!.id==45){
          AppNavigator.navigateTheoDoiTienTrinh(1,id: data.id);
        }
        else if(data.trang_thai!.id==46){
          _historyController.getThongTinGiaoVien(id: data.id.toString());
        }
        else if(data.trang_thai!.id==50){
          AppNavigator.navigateTheoDoiTienTrinh(2,id: data.id,isHuy: true);
        }
        else{
          if(data.trang_thai!.id==47)
            AppNavigator.navigateTheoDoiTienTrinh(3,id: data.id);
          else AppNavigator.navigateTheoDoiTienTrinh(4,id: data.id);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.sp, left: 1.sp, right: 1.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: AppColors.grayF2,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                  blurRadius: 10,
                  color: AppColors.blue2.withOpacity(0.15))
            ]),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15.sp)),
                color: AppColors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.grayF2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp),
                      bottomLeft: Radius.circular(30.sp),
                    )),
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
                child: Row(
                  children: [
                    Container(
                      width: 34.sp,
                      height: 34.sp,
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                          color: colorItem,
                          borderRadius: BorderRadius.circular(7.sp)),
                      child: SvgPicture.asset(
                        Assets.iconsIcItemHistory,
                      ),
                    ),
                    SizedBox(
                      width: 8.sp,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Mã đơn hàng: ',
                              style: AppStyle.DEFAULT_14.copyWith(height: 1.3,fontSize: 13.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: data.ma_don_hang??'',
                                    style:
                                        const TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          AppText(
                            data.created??'',
                            style: AppStyle.DEFAULT_12.copyWith(height: 1.3),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Flexible(
                      flex: 2,
                      child: DButton(
                          text: data.trang_thai!.name??'',
                          padH: 9.sp,
                          padV: 3.w,
                          background: colorItem,
                          borderColor: colorItem,
                          textStyle: AppStyle.DEFAULT_14.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              height: 1.2,
                              color: AppColors.white),
                          onClick: onClick),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.sp),
                    bottomLeft: Radius.circular(15.sp),
                    bottomRight: Radius.circular(15.sp),
                  )),
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcFile,
                              width: 12.sp,
                              height: 12.sp,
                              color: AppColors.textBlack,
                            ),
                            SizedBox(
                              width: 6.sp,
                            ),
                            AppText(
                              'Dịch vụ'.tr,
                              style: AppStyle.DEFAULT_14,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: AppText(
                            data.dichVu??'',
                            style: AppStyle.DEFAULT_14
                                .copyWith(fontWeight: FontWeight.w500),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorItem.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.sp, vertical: 9.sp),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  '${data.soBuoiHoanThanh??''} ',
                              style: AppStyle.DEFAULT_14_BOLD
                                  .copyWith(height: 1.2,fontSize: 13.sp),
                              children: <TextSpan>[
                                const TextSpan(
                                    text: ' buổi',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcCalendar,
                              width: 12.sp,
                              height: 12.sp,
                              color: AppColors.textBlack,
                            ),
                            SizedBox(
                              width: 6.sp,
                            ),
                            AppText(
                              'Lịch đặt'.tr,
                              style: AppStyle.DEFAULT_14.copyWith(height: 1.2),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                data.chonCa??'',
                                style: AppStyle.DEFAULT_14.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.2),
                              ),
                              SizedBox(
                                height: 13.sp,
                              ),
                              AppText(
                                data.thoi_gian??'',
                                style: AppStyle.DEFAULT_14.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.2),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onClick() {}

  void onClickItem(ItemHistoryOrder data) {
    showModalBottomSheet(
      context: context,
      constraints:
          BoxConstraints(minWidth: Get.width, maxHeight: Get.height * 0.7),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.sp))),
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 13.sp,
                ),
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
                  'Nhập mật khẩu'.tr,
                  style: AppStyle.DEFAULT_20_BOLD,
                ),
                SizedBox(
                  height: 27.sp,
                ),
                DInput(
                    controller: _matKhauController,
                    isPass: true,
                    onSubmit: () {
                      onSubmitMatKhau(data.id!,data.trang_thai!.id!);
                    },
                    hintText: 'Mật khẩu*'),
                SizedBox(
                  height: 14.sp,
                ),
                InkWell(
                  onTap: onClickForgotPass,
                  child: AppText(
                    'Quên mật khẩu?',
                    style: AppStyle.DEFAULT_14.copyWith(color: AppColors.blue),
                  ),
                ),
                SizedBox(
                  height: 30.sp +
                      MediaQuery.of(context).viewPadding.bottom +
                      MediaQuery.of(context).viewInsets.bottom,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void onClickForgotPass() {
    Get.back();
    _settingController.logOut((){
      _loginController.token=null;
      AppNavigator.navigateLogin();
    });
    // AppNavigator.navigateForgotPass();
  }

  onSubmitMatKhau(int id,int idTrangThai) {
    if(_matKhauController.text!="") {
      _historyController.checkPass(pass: _matKhauController.text, id: id,idTrangThai: idTrangThai);
    }
    // Get.back();
    // if (status == 4)
    //   AppNavigator.navigateTheoDoiTienTrinh(2, isHuy: true);
    // else
    //   AppNavigator.navigateTheoDoiTienTrinh(3);
  }
}

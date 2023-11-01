import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
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

  List data = [
    {
      'status': 1,
      'nameStatus': 'Sắp diễn ra',
      'soBuoiDaDay': 0,
      'tongSoBuoi': 5,
    },
    {
      'status': 2,
      'nameStatus': 'Đang dạy',
      'soBuoiDaDay': 3,
      'tongSoBuoi': 5,
    },
    {
      'status': 3,
      'nameStatus': 'Hoàn tất',
      'soBuoiDaDay': 5,
      'tongSoBuoi': 5,
    },
    {
      'status': 4,
      'nameStatus': 'Hủy',
      'soBuoiDaDay': 0,
      'tongSoBuoi': 5,
    },
    {
      'status': 2,
      'nameStatus': 'Đang dạy',
      'soBuoiDaDay': 3,
      'tongSoBuoi': 5,
    },
    {
      'status': 3,
      'nameStatus': 'Hoàn tất',
      'soBuoiDaDay': 5,
      'tongSoBuoi': 5,
    },
  ];
  List<String> dropdown=['Mới nhất','Cũ nhất'];
  String valueDropdown='Mới nhất';
  TextEditingController _matKhauController=TextEditingController();

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
                    child: Column(
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
                                      .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: AppText(
                                      item,
                                      style: AppStyle.DEFAULT_14,
                                    ),
                                  ))
                                      .toList(),
                                value: valueDropdown,
                                onChanged: (String? value) {
                                  setState(() {
                                    valueDropdown = value!;
                                  });
                                },
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.sp)
                                  )
                                ),
                                customButton: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.grayF2,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14.sp, vertical: 9.sp),
                                  child: Row(
                                    children: [
                                      AppText(
                                        valueDropdown,
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w500, height: 1),
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
                          child: ListView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 5.sp),
                            itemBuilder: (context, index) {
                              return _itemHistory(data[index]);
                            },
                          ),
                        )
                      ],
                    )))
          ]))
        ],
      ),
    );
  }

  Widget _itemHistory(data) {
    Color colorItem=data['status'] == 1
        ? AppColors.blue
        : data['status'] == 2
        ? AppColors.primary
        : data['status'] == 3
        ? AppColors.gray60
        : AppColors.orange;
    return InkWell(
      onTap: (){
        onClickItem(data['status']);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.sp, left: 1.sp, right: 1.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: AppColors.grayF2,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                  blurRadius: 10,
                  color: AppColors.blue2.withOpacity(0.15))
            ]),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp)),
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
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
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
                              style: AppStyle.DEFAULT_14.copyWith(height: 1.3),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '0123456789',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          AppText(
                            '04/08/2023 • 08:30',
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
                          text: data['nameStatus'],
                          padH: 9.sp,
                          background: colorItem,
                          borderColor: colorItem,
                          textStyle: AppStyle.DEFAULT_14.copyWith(
                              fontWeight: FontWeight.w500,
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
                            'Bảo mẫu Pro',
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
                              text: '${data['soBuoiDaDay']}/${data['tongSoBuoi']} ',
                              style:
                                  AppStyle.DEFAULT_14_BOLD.copyWith(height: 1.2),
                              children: <TextSpan>[
                                TextSpan(
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
                                'Ca sáng (7:00 - 11:00)',
                                style: AppStyle.DEFAULT_14.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.2),
                              ),
                              SizedBox(
                                height: 13.sp,
                              ),
                              AppText(
                                '07/08/2023 - 11/08/2023',
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

  void onClickItem(int status) {
    showModalBottomSheet(
        context: context,
        constraints: BoxConstraints(minWidth: Get.width,maxHeight: Get.height*0.7),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp))
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp
              ),
              child: Column(
                children: [
                  SizedBox(height: 13.sp,),
                  Container(
                    width: 38.sp,
                    height: 4.sp,
                    decoration: BoxDecoration(
                        color: AppColors.grayE5,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  SizedBox(height: 20.sp,),
                  AppText(
                    'Nhập mật khẩu'.tr,
                    style: AppStyle.DEFAULT_20_BOLD,
                  ),
                  SizedBox(height: 27.sp,),
                  DInput(
                      controller: _matKhauController,
                      isPass: true,
                      onSubmit: (){
                        onSubmitMatKhau(status);
                      },
                      hintText: 'Mật khẩu*'),
                  SizedBox(height: 14.sp,),
                  InkWell(
                    onTap: onClickForgotPass,
                    child: AppText(
                      'Quên mật khẩu?',
                      style: AppStyle.DEFAULT_14.copyWith(color: AppColors.blue),
                    ),
                  ),
                  SizedBox(height: 30.sp+MediaQuery.of(context).viewPadding.bottom+MediaQuery.of(context).viewInsets.bottom,)
                ],
              ),
            ),
          );
        },
    );
  }

  void onClickForgotPass() {
    Get.back();
    AppNavigator.navigateForgotPass();
  }

  onSubmitMatKhau(int status) {
    Get.back();
    if(status==4) AppNavigator.navigateTheoDoiTienTrinh(2,isHuy: true);
    else AppNavigator.navigateTheoDoiTienTrinh(3);
  }
}

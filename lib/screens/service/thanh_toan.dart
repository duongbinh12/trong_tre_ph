import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DRowText.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

class ThanhToan extends StatefulWidget {
  const ThanhToan({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<ThanhToan> createState() => _ThanhToanState();
}

class _ThanhToanState extends State<ThanhToan>
    {
  @override
  bool get wantKeepAlive => true;
  List phuongThuc = [
    {
      'image': Assets.iconsVnPay,
      'title': 'VNPAY (-5% tối đa 100k qua QR)',
      'content': 'Thẻ ATM/Visa/Master/QR'
    },
    {
      'image': Assets.iconsAppota,
      'title': 'AppotaPay',
      'content': 'Qua ứng dụng AppotaPay'
    },
    {
      'image': Assets.iconsBanking,
      'title': 'Chuyển khoản',
      'content': 'Qua tài khoản Internet Banking'
    }
  ];

  int groupValue = 0;
  int valueInHoaDon = 1;
  bool checkDongY = false;
  final ServiceController _serviceController = Get.find<ServiceController>();
  double goiHoc = 0;
  double phuCap = 0;
  double tongTien = 0;

  @override
  void initState() {
    goiHoc = (double.parse(_serviceController
            .listBuoiHoc.value![_serviceController.indexBuoi].thanh_tien!)) +
        (double.parse(_serviceController.listBuoiHoc
                    .value![_serviceController.indexBuoi].thanh_tien!) /
                2) *
            (_serviceController.soLuongBe.value - 1);
    phuCap = (_serviceController.tienAnTrua.value +
            _serviceController.tienThemGio.value) *
        // _serviceController.soLuongBe.value *
        _serviceController
            .listBuoiHoc.value![_serviceController.indexBuoi].so_buoi!;
    tongTien = goiHoc + phuCap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              phuongThuc.length,
              (index) => ItemPhuongThuc(
                  icon: phuongThuc[index]['image'],
                  title: phuongThuc[index]['title'],
                  content: phuongThuc[index]['content'],
                  onChange: () {
                    setState(() {
                      groupValue = index;
                    });
                  },
                  groupValue: groupValue,
                  index: index)),
          SizedBox(
            height: 15.sp,
          ),
          DottedLine(
            dashColor: AppColors.textBlack.withOpacity(0.3),
          ),
          SizedBox(
            height: 20.sp,
          ),
          DRowText(
            textL: 'Tổng tiền'.tr,
            money: tongTien,
          ),
          SizedBox(
            height: 20.sp,
          ),
          DottedLine(
            dashColor: AppColors.textBlack.withOpacity(0.3),
          ),
          SizedBox(
            height: 20.sp,
          ),
          InkWell(
            onTap: () async {
              if (valueInHoaDon == 1) {
                AppNavigator.navigateThongTinHoaDon(Get.arguments,(int value){
                  setState(() {
                    valueInHoaDon=value;
                  });
                });
              }
              setState(() {
                valueInHoaDon = valueInHoaDon == 0 ? 1 : 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.sp)),
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'Xuất Hợp đồng và Hóa đơn dịch vụ'.tr,
                          style: AppStyle.DEFAULT_14
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        AppText(
                          'Bạn muốn xuất Hợp đồng và Hóa đơn điện tử?'.tr,
                          style: AppStyle.DEFAULT_12.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlack.withOpacity(0.6)),
                        )
                      ],
                    ),
                  ),
                  IgnorePointer(
                    child: Container(
                      width: 25.sp,
                      height: 25.sp,
                      decoration: BoxDecoration(),
                      child: Radio(
                        value: valueInHoaDon,
                        activeColor: AppColors.primary,
                        onChanged: (int? value) {
                          setState(() {
                            valueInHoaDon = valueInHoaDon == 0 ? 1 : 0;
                          });
                          // if(widget.onChanged!=null) {
                          //   widget.onChanged!(index);
                          // }
                        },
                        groupValue: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.sp,
          ),
          InkWell(
            onTap: () {
              setState(() {
                checkDongY = !checkDongY;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30.sp,
                  height: 30.sp,
                  child: Checkbox(
                    value: checkDongY,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    activeColor: AppColors.blue,
                    onChanged: (value) {
                      setState(() {
                        checkDongY = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Tôi đã đọc và đồng ý với ',
                      style: AppStyle.DEFAULT_14,
                      children: [
                        TextSpan(
                            text: 'Hợp đồng dịch vụ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                onClickHopDong();
                              }),
                        TextSpan(text: ' của Trông trẻ Pro'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          DButton(
              text: 'Thanh toán',
              right: SvgPicture.asset(
                Assets.iconsNext,
                color:
                    checkDongY == false ? AppColors.textBlack : AppColors.white,
              ),
              background:
                  checkDongY == false ? AppColors.grayE5 : AppColors.primary,
              textColor:
                  checkDongY == false ? AppColors.textBlack : AppColors.white,
              borderColor:
                  checkDongY == false ? AppColors.grayE5 : AppColors.primary,
              onClick: onClickThanhToan)
        ],
      ),
    );
  }

  onClickThanhToan() {
    if (checkDongY) {
      if ((valueInHoaDon == 0 && _serviceController.xuatHoaDon == true) ||
          valueInHoaDon == 1) {
        _serviceController.taoDon(
            dich_vu_id: Get.arguments,
            hocPhi: goiHoc.toString(),
            phuCap: phuCap.toString(),
            tongTien: tongTien.toString(),
            hinh_thuc_thanh_toan_id: (groupValue == 0
                    ? 23
                    : groupValue == 1
                        ? 24
                        : 25)
                .toString());
      } else {
        NotificationDialog.createSimpleDialog(
            context: context,
            titleButton1: "OK",
            type: 2,
            content: "Bạn chưa điền thông tin hợp đồng, hóa đơn dịch vụ!",
            numberButton: 1);
      }

      // AppNavigator.navigatechuyenKhoan(Get.arguments);
    }
  }

  void onClickHopDong() {
    showModalBottomSheet(
      context: context,
      constraints:
          BoxConstraints(minWidth: Get.width, maxHeight: Get.height * 0.7),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        bool checkBox = checkDongY;
        return StatefulBuilder(builder: (context, setState1) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.sp)),
                color: AppColors.white),
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
                  'Hợp đồng dịch vụ'.tr,
                  style: AppStyle.DEFAULT_20_BOLD,
                ),
                SizedBox(
                  height: 18.sp,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: HtmlWidget(_serviceController.detailService.value!.hop_dong_dich_vu??''),
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                InkWell(
                  onTap: () {
                    setState1(() {
                      checkBox = !checkBox;
                    });
                    setState(() {
                      checkDongY = checkBox;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30.sp,
                        height: 30.sp,
                        child: Checkbox(
                          value: checkBox,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          activeColor: AppColors.blue,
                          onChanged: (value) {
                            setState1(() {
                              checkBox = value!;
                            });
                            setState(() {
                              checkDongY = checkBox;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Tôi đã đọc và đồng ý với ',
                            style: AppStyle.DEFAULT_14,
                            children: [
                              TextSpan(
                                text: 'Hợp đồng dịch vụ',
                              ),
                              TextSpan(text: ' của Trông trẻ Pro'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                DButton(
                    text: 'Thanh toán',
                    right: SvgPicture.asset(
                      Assets.iconsNext,
                      color: checkBox == false
                          ? AppColors.textBlack
                          : AppColors.white,
                    ),
                    background: checkBox == false
                        ? AppColors.grayE5
                        : AppColors.primary,
                    textColor: checkBox == false
                        ? AppColors.textBlack
                        : AppColors.white,
                    borderColor: checkBox == false
                        ? AppColors.grayE5
                        : AppColors.primary,
                    onClick: (){
                      Get.back();
                      onClickThanhToan();
                    }),
                SizedBox(
                  height: 30.sp + MediaQuery.of(context).viewPadding.bottom,
                )
              ],
            ),
          );
        });
      },
    );
  }
}

class ItemPhuongThuc extends StatefulWidget {
  const ItemPhuongThuc(
      {super.key,
      required this.icon,
      required this.title,
      required this.content,
      required this.index,
      required this.onChange,
      required this.groupValue});

  final String icon, title, content;
  final int index;
  final Function onChange;
  final int groupValue;

  @override
  State<ItemPhuongThuc> createState() => _ItemPhuongThucState();
}

class _ItemPhuongThucState extends State<ItemPhuongThuc> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChange();
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.index == widget.groupValue
                ? AppColors.bgRed
                : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                color: widget.index == widget.groupValue
                    ? AppColors.borderRed
                    : AppColors.white),
            boxShadow: widget.index == widget.groupValue
                ? [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 0,
                        color: AppColors.blue2.withOpacity(0.15))
                  ]
                : []),
        margin: EdgeInsets.only(bottom: 10.sp),
        padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 15.sp),
        child: Row(
          children: [
            WidgetContainerImage(
              image: widget.icon,
              width: 50.sp,
              height: 50.sp,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 15.sp,
            ),
            Expanded(
                child: Column(
              children: [
                AppText(
                  widget.title,
                  style:
                      AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600),
                ),
                AppText(
                  widget.content,
                  style: AppStyle.DEFAULT_14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlack.withOpacity(0.6)),
                )
              ],
            )),
            Container(
              width: 25.sp,
              height: 25.sp,
              decoration: BoxDecoration(),
              child: Radio<int>(
                  value: widget.index,
                  activeColor: AppColors.primary,
                  groupValue: widget.groupValue,
                  onChanged: (int? value) {
                    widget.onChange();
                    // if(widget.onChanged!=null) {
                    //   widget.onChanged!(index);
                    // }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/screens/service/widget/DCalendar.dart';
import 'package:trong_tre/screens/service/widget/DRadioButton.dart';
import 'package:trong_tre/screens/service/widget/progress.dart';
import 'package:trong_tre/screens/service/widget/select_shift.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../home/menu.dart';

class SignUpService extends StatefulWidget {
  const SignUpService({super.key});

  @override
  State<SignUpService> createState() => _SignUpServiceState();
}

class _SignUpServiceState extends State<SignUpService> {
  int indexThu = 0;
  List<String> thu = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
  DateTime _thoiGianPick=DateTime.now();
  int dichVuId=Get.arguments;

  ServiceController _serviceController=Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.sp,
          ),
          _thongtinDichVu(),
          SizedBox(
            height: 20.sp,
          ),
          _diaDiem(),
          SizedBox(
            height: 20.sp,
          ),
          _thoiGian(),
          SizedBox(
            height: 20.sp,
          ),
          SelectShift(dichVuId: dichVuId,),
          SizedBox(height: 38.sp,),
          DButton(text: 'Tiếp tục',right: SvgPicture.asset(
            Assets.iconsNext,
            width: 18.sp,
            height: 18.sp,
          ), onClick: onClickNext),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom+20.sp,)
        ],
      ),
    );
  }

  Widget _thongtinDichVu() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
      child: Column(
        children: [
          _title(icon: Assets.iconsIcFile, title: 'Thông tin dịch vụ'),
          SizedBox(
            height: 26.sp,
          ),
          Row(
            children: [
              Expanded(
                child: AppText(
                  'Bảo mẫu Pro',
                  style:
                      AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                  child: DButton(
                      text: 'Chi tiết dịch vụ',
                      padH: 7.sp,
                      textStyle: AppStyle.DEFAULT_14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          height: 1.3),
                      right: SvgPicture.asset(Assets.iconsUpload),
                      onClick: onClickChiTietDichVu))
            ],
          )
        ],
      ),
    );
  }

  Widget _diaDiem() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
      child: Column(
        children: [
          _title(icon: Assets.iconsIcLocation, title: 'Địa điểm'.tr),
          SizedBox(
            height: 15.sp,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.grayE5),
                borderRadius: BorderRadius.circular(10.sp)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Nhập thông tin rõ số nhà, tầng, tòa, đường...'.tr,
                  hintStyle: AppStyle.DEFAULT_14.copyWith(
                      color: AppColors.textBlack.withOpacity(0.6), height: 1.2),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(15.sp)),
              style: AppStyle.DEFAULT_16.copyWith(height: 1.2),
            ),
          )
        ],
      ),
    );
  }

  Widget _thoiGian() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child:
                      _title(icon: Assets.iconsIcCalendar, title: 'Thời gian'.tr)),
              Expanded(
                  child: InkWell(
                onTap: onClickTime,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(50.sp)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 7.sp),
                  child: Row(
                    children: [
                      Expanded(
                          child: AppText(
                        '${_thoiGianPick.month}/${_thoiGianPick.year}',
                        style: AppStyle.DEFAULT_14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            height: 1.2),
                      )),
                      SvgPicture.asset(
                        Assets.iconsIcCalendar,
                        color: AppColors.white,
                        width: 12.sp,
                        height: 14.sp,
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 20.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                thu.length, (index) => ItemThu(title: thu[index])),
          ),
          SizedBox(
            height: 10.sp,
          )
        ],
      ),
    );
  }

  Widget _title({required String icon, required String title}) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
        ),
        SizedBox(
          width: 5.sp,
        ),
        AppText(
          title,
          style: AppStyle.DEFAULT_18_BOLD,
        )
      ],
    );
  }

  onClickChiTietDichVu() {}

  void onClickTime() {
    showModalBottomSheet(
      context: context,
      constraints:
          BoxConstraints(minWidth: Get.width, maxHeight: Get.height),
      isScrollControlled: true,backgroundColor: Colors.transparent,
      builder: (context) {
        return DCalendar(onClickPick: (DateTime selectDay){
          setState(() {
            _thoiGianPick=selectDay;
          });
        },);
      },
    );
  }

  onClickNext() {
    _serviceController.nextTab();
  }
}

class ItemThu extends StatefulWidget {
  const ItemThu({super.key, required this.title});

  final String title;

  @override
  State<ItemThu> createState() => _ItemThuState();
}

class _ItemThuState extends State<ItemThu> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sp),
            color: selected ? AppColors.primary : AppColors.grayE5),
        width: (Get.width - 20.sp - 20.sp - 13.sp - 13.sp - (6 * 6.sp)) / 7,
        height: (Get.width - 20.sp - 20.sp - 13.sp - 13.sp - (6 * 6.sp)) / 7,
        child: Center(
          child: AppText(
            widget.title,
            textAlign: TextAlign.center,
            style: AppStyle.DEFAULT_16.copyWith(
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.white : AppColors.textBlack,
                height: 1.2),
          ),
        ),
      ),
    );
  }
}

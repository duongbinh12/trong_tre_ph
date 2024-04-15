import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';

import '../../../generated/assets.dart';
import '../../../res/app_styles.dart';
import '../../../res/colors.dart';
import '../../../widgets/app_text.dart';
import 'DRadioButton.dart';

class SelectShift extends StatefulWidget {
  const SelectShift({super.key, required this.dichVuId});

  final int dichVuId;

  @override
  State<SelectShift> createState() => _SelectShiftState();
}

class _SelectShiftState extends State<SelectShift> {
  int select_ca = 0;
  int select_gio = 0;
  int? gio=7,phut=30;

  ServiceController _serviceController = Get.find<ServiceController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _serviceController.getCa(widget.dichVuId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.sp)),
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
          child: Column(
            children: [
              _title(icon: Assets.iconsIcTime, title: 'Chọn ca'.tr),
              SizedBox(
                height: 18.sp,
              ),
              GetX<ServiceController>(builder: (controller) {
                if (controller.listCa.value != null) {
                  List<String> dataCa = [];
                  for (int i = 0; i < controller.listCa.value!.length; i++) {
                    dataCa.add(controller.listCa.value![i].name!);
                  }
                  return DRadioButton(
                    data: dataCa,
                    onChanged: (int index) {
                      setState(() {
                        select_ca = index;
                        select_gio = 0;
                      });
                      _serviceController.indexCa = index;
                      _serviceController.indexGio = 0;
                      _serviceController.getKhungGio(
                          widget.dichVuId, controller.listCa.value![index].id!);
                    },
                  );
                } else {
                  return SizedBox();
                }
              })
            ],
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(
                  width: 1, color: AppColors.primary.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: AppColors.blue2.withOpacity(0.15))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 10.h),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: _title(title: 'Giờ bắt đầu'.tr)),
                    Expanded(
                        flex: 1,
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
                                      '$gio:$phut',
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
              ),
              GetX<ServiceController>(builder: (controller) {
                if (controller.listKhungGio.value != null && controller.listKhungGio.value!.isNotEmpty) {
                  List<String> dataKhung = [];
                  for (int i = 0;
                      i < controller.listKhungGio.value!.length;
                      i++) {
                    dataKhung
                        .add(controller.listKhungGio.value![i].khung_gio!);
                  }
                  return Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 13.sp, vertical: 15.sp),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: AppColors.primary.withOpacity(0.2)))),
                    child: DRadioButton(
                      data: dataKhung,
                      onChanged: (int index) {
                        setState(() {
                          select_gio = index;
                        });
                        _serviceController.indexGio = index;
                        _serviceController.idKhungGioCa =
                            controller.listKhungGio.value![index].id!;
                      },
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
              SizedBox(
                height: 18.sp,
              ),
              GetX<ServiceController>(builder: (controller) {
                if (controller.listKhungGio.value != null) {
                  if (controller.listKhungGio.value!.isNotEmpty) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 13.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Thời lượng ',
                              style: AppStyle.DEFAULT_16_BOLD,
                              children: <TextSpan>[
                                TextSpan(
                                    text: controller.listKhungGio
                                        .value![select_gio].khung_gio,
                                    style: AppStyle.DEFAULT_16_BOLD
                                        .copyWith(color: AppColors.primary)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          HtmlWidget(
                            controller
                                    .listKhungGio.value![select_gio].noi_dung ??
                                '',
                            textStyle: AppStyle.TEXT_16,
                          ),
                          SizedBox(
                            height: 18.sp,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 13.sp,vertical: 10),
                      child: AppText(
                        'Không có thông tin ca dạy',
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_16
                            .copyWith(fontStyle: FontStyle.italic),
                      ),
                    );
                  }
                } else
                  return SizedBox();
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _title({String? icon, required String title}) {
    return Row(
      children: [
        if(icon!=null) SvgPicture.asset(
          icon,
        ),
        if(icon!=null) SizedBox(
          width: 5.sp,
        ),
        AppText(
          title,
          style: AppStyle.DEFAULT_18_BOLD,
        )
      ],
    );
  }

  onClickNext() {}

  void onClickTime() async{
    TimeOfDay? selectedTime24Hour=await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 30),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    setState(() {
      gio=selectedTime24Hour!.hour;
      phut=selectedTime24Hour.minute;
    });
    _serviceController.gioBatDau="${gio!<10?"0$gio":gio}:$phut";
  }
}

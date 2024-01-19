import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';

import '../../../res/app_styles.dart';
import '../../../res/colors.dart';
import '../../../widgets/app_text.dart';

class DCalendar extends StatefulWidget {
  const DCalendar({super.key, required this.onClickPick});

  final Function onClickPick;

  @override
  State<DCalendar> createState() => _DCalendarState();
}

class _DCalendarState extends State<DCalendar> {
  List<String> thu = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _tempDay;

  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp)),
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
              'Điều chỉnh thời gian'.tr,
              style: AppStyle.DEFAULT_20_BOLD,
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(13.sp),
                      child: SvgPicture.asset(
                        Assets.iconsBack,
                        width: 16.sp,
                        height: 16.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Expanded(child: AppText(
                    'Tháng ${_focusedDay.month} | ${_focusedDay.year}',
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAULT_20_BOLD.copyWith(
                        color: AppColors.white),
                  )),
                  InkWell(
                    onTap: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(13.sp),
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(
                          Assets.iconsBack,
                          width: 16.sp,
                          height: 16.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              locale: 'vi_VN',
              headerVisible: false,
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekHeight: (Get.width - 20.sp - 20.sp - 7.sp * 6) / 7 +
                  10.sp,
              rowHeight: 1.sp + 1.sp + 10.sp + 32.sp + 24.sp + 2.sp + 5.sp,
              onCalendarCreated: (pageController) =>
              _pageController = pageController,
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              currentDay: DateTime.now(),
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay) && selectedDay.day>=DateTime.now().day) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  return Container(
                    decoration: BoxDecoration(
                        color: day.weekday == 6
                            ? AppColors.blue
                            : day.weekday == 7
                            ? AppColors.primary
                            : AppColors.grayE5,
                        borderRadius: BorderRadius.circular(100)),
                    margin: EdgeInsets.only(right: 7.sp, bottom: 10.sp),
                    child: Center(
                      child: AppText(
                        thu[day.weekday - 1],
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_16_BOLD.copyWith(
                            color: (day.weekday == 6 || day.weekday == 7)
                                ? AppColors.white
                                : AppColors.textBlack),
                      ),
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.sp,
                            color: (day == _selectedDay&& day.day>=DateTime.now().day)
                                ? AppColors.blue
                                : AppColors.grayE5),
                        borderRadius: BorderRadius.circular(5.sp)),
                    width: (Get.width - 20.sp - 20.sp - 2.sp * 6) / 7,
                    padding: EdgeInsets.only(bottom: 32.sp),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      margin: EdgeInsets.only(
                          top: 5.sp, left: 5.sp, right: 5.sp),
                      child: AppText(
                        day.day.toString(),
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_16.copyWith(
                            fontWeight: FontWeight.w600,
                            color:(day.day<DateTime.now().day)?AppColors.textBlack.withOpacity(0.5): day.weekday == 6
                                ? AppColors.blue
                                : day.weekday == 7
                                ? AppColors.primary
                                : AppColors.textBlack),
                      ),
                    ),
                  );
                },
                markerBuilder: (context, day, events) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 18.sp),
                    child: AppText(
                      Lunar.fromDate(day).getDay() == 1
                          ? "${Lunar.fromDate(day).getDay()}/${Lunar.fromDate(
                          day).getMonth()}"
                          : Lunar.fromDate(day).getDay().toString(),
                      style: AppStyle.DEFAULT_10
                          .copyWith(
                          fontWeight: FontWeight.w600, fontSize: 9.sp),
                    ),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: day == _selectedDay
                                ? AppColors.blue
                                : AppColors.grayE5),
                        borderRadius: BorderRadius.circular(5.sp)),
                    width: (Get.width - 20.sp - 20.sp - 2.sp * 6) / 7,
                    padding: EdgeInsets.only(bottom: 32.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(5.sp)),
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      margin: EdgeInsets.only(
                          top: 5.sp, left: 5.sp, right: 5.sp),
                      child: AppText(
                        day.day.toString(),
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_16.copyWith(
                            fontWeight: FontWeight.w600, color: AppColors
                            .white),
                      ),
                    ),
                  );
                },
                outsideBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.sp,
                            color: day == _selectedDay
                                ? AppColors.blue
                                : AppColors.grayE5),
                        borderRadius: BorderRadius.circular(5.sp)),
                    width: (Get.width - 20.sp - 20.sp - 2.sp * 6) / 7,
                    padding: EdgeInsets.only(bottom: 32.sp),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      margin: EdgeInsets.only(
                          top: 5.sp, left: 5.sp, right: 5.sp),
                      child: AppText(
                        day.day.toString(),
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack.withOpacity(0.5)),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 25.sp,
            ),
            Row(
              children: [
                Expanded(
                    child: DButton(
                        text: 'Hủy',
                        background: AppColors.primary.withOpacity(0.1),
                        borderColor: AppColors.primary.withOpacity(0.1),
                        textColor: AppColors.textBlack,
                        onClick: () {
                          Get.back();
                        })),
                SizedBox(
                  width: 9.sp,
                ),
                Expanded(
                    child:
                    DButton(text: 'Chọn ngày bắt đầu', onClick: onClickChon)),
              ],
            ),
            SizedBox(height: MediaQuery
                .of(context)
                .viewPadding
                .bottom + 20.sp,)
          ],
        ),
      ),
    );
  }

  onClickChon() {
    if (_selectedDay!=null) {
      if(_selectedDay!.difference(DateTime.now()).inDays>=1){
        Get.back();
          widget.onClickPick(_selectedDay);
      }
      else{
        NotificationDialog.createSimpleDialog(context: context,
            titleButton1: 'OK',
            title: "Thông báo",
            content: "Ngày bắt đầu sớm nhất của dịch vụ là sau hôm nay 2 ngày!",
            numberButton: 1);
      }
    }
    else {
      NotificationDialog.createSimpleDialog(context: context,
          titleButton1: 'OK',
          title: "Thông báo",
          content: "Bạn hãy chọn ngày",
          numberButton: 1);
    }
  }
}

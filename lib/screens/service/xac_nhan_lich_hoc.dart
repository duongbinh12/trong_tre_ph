import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DRowText.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../res/app_styles.dart';
import '../../widgets/app_text.dart';

class XacNhanLichHoc extends StatefulWidget {
  const XacNhanLichHoc({super.key});

  @override
  State<XacNhanLichHoc> createState() => _XacNhanLichHocState();
}

class _XacNhanLichHocState extends State<XacNhanLichHoc> {
  ServiceController _serviceController=Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _thongTinDichVu(),
          SizedBox(
            height: 20.sp,
          ),
          _thongTinLopHoc(),
          SizedBox(height: 20.sp,),
          _goiDichVu(),
          SizedBox(height: 29.sp,),
          DottedLine(
            dashColor: AppColors.textBlack.withOpacity(0.3),
          ),
          SizedBox(height: 20.sp,),
          DRowText(textL: 'Tổng tiền'.tr,money: 2157500,styleR: AppStyle.DEFAULT_20_BOLD.copyWith(height: 1.2,color: AppColors.primary),),
          SizedBox(height: 20.sp,),
          DottedLine(
            dashColor: AppColors.textBlack.withOpacity(0.3),
          ),
          SizedBox(height: 29.sp,),
          DButton(text: 'Xác nhận và thanh toán'.tr,
              right: SvgPicture.asset(
                Assets.iconsNext
              ),
              onClick: onClickNext),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom+30.sp,)
        ],
      ),
    );
  }

  Widget _thongTinDichVu() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
      child: Column(
        children: [
          _title(icon: Assets.iconsIcFile, title: 'Thông tin dịch vụ'.tr),
          SizedBox(
            height: 26.sp,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AppText(
                  'Bảo mẫu Pro',
                  style: AppStyle.DEFAULT_16
                      .copyWith(fontWeight: FontWeight.w500, height: 1.1),
                ),
              ),
              Expanded(
                flex: 3,
                child: DButton(
                    text: 'Chi tiết chương trình'.tr,
                    right: SvgPicture.asset(Assets.iconsUpload),
                    padH: 8.sp,
                    textStyle: AppStyle.DEFAULT_14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        height: 1.1),
                    onClick: onClickChiTietCT),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _thongTinLopHoc() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
      child: Column(
        children: [
          _title(icon: Assets.iconsBook, title: 'Thông tin lớp học'.tr),
          SizedBox(
            height: 27.sp,
          ),
          _itemThongTin(
              icon: Assets.iconsIcLocation,
              title: 'Địa chỉ',
              content: 'Số 5, Ngách 128/6/6 Khâm Thiên, Đống Đa, Hà Nội'),
          SizedBox(
            height: 16.sp,
          ),
          _itemThongTin(
              icon: Assets.iconsNote,
              title: 'Ghi chú/dặn dò',
              content: """• Con dễ gần, cá tính, ham tìm 
   hiểu và hiếu động.
• Yêu cầu giáo viên kinh nghiệm,   
   tận tâm và thân thiện.
• Có giáo án cho bé phát triển về 
   thể chất, chơi nhiều môn thể 
   thao, dạy bé Tiếng Anh mầm 
   non về nhận biết chữ, số đếm."""),
          SizedBox(
            height: 16.sp,
          ),
          _itemThongTin(
              icon: Assets.iconsIcCalendar,
              title: 'Lịch học'.tr,
              content: 'Thứ 2,4,6 hàng tuần'),
          SizedBox(height: 16.sp,),
          _itemThongTin(
              icon: Assets.iconsEditCalendar,
              title: 'Thời gian'.tr,
              content: '07/08/2023 - 11/08/2023'),
          SizedBox(height: 16.sp,),
          _itemThongTin(
              icon: Assets.iconsIcTime,
              title: 'Ca'.tr,
              content: 'Ca sáng (7:00 - 11:00)'),
          SizedBox(height: 25.sp,)
        ],
      ),
    );
  }
  
  Widget _goiDichVu(){
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
      child: Column(
        children: [
          _title(icon: Assets.iconsWallet, title: 'Gói dịch vụ'.tr),
          SizedBox(height: 21.sp,),
          DRowText(textL: 'Gói 5 buổi'.tr,money: 1757500,),
          SizedBox(height: 16.sp,),
          DRowText(textL: 'Phụ cấp'.tr,money: 500000,),
        ],
      ),
    );
  }

  Widget _itemThongTin(
      {required String icon, required String title, required String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              width: 14.sp,
              height: 14.sp,
              color: AppColors.black,
            ),
            SizedBox(
              width: 6.sp,
            ),
            Expanded(
              child: AppText(
                title,
                style: AppStyle.DEFAULT_14.copyWith(height: 1.2),
              ),
            )
          ],
        )),
        SizedBox(
          width: 8.sp,
        ),
        Expanded(
          flex: 3,
          child: AppText(
            content,
            style: AppStyle.DEFAULT_14
                .copyWith(fontWeight: FontWeight.w500, height: 1.2),
          ),
        )
      ],
    );
  }

  Widget _title(
      {required String icon, required String title, Color? colorIcon}) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: colorIcon,
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

  onClickChiTietCT() {}

  onClickNext() {
    _serviceController.nextTab();
  }
}

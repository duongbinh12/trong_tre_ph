import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/container_text.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DTitleIcon.dart';
import 'package:trong_tre/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/colors.dart';
import '../../../services/entity/thong_tin_giao_vien_response.dart';
import '../../../services/entity/thong_tin_khoa_hoc_response.dart';
import '../../../widgets/widget_handle.dart';

class ChiTietCaDay extends StatefulWidget {
  const ChiTietCaDay({super.key,required this.tienDo,required this.giaoVien,required this.sdt,required this.avatar,required this.idKh});
  final TienDo tienDo;
  final GiaoVien giaoVien;
  final String sdt;
  final String avatar;
  final int idKh;

  @override
  State<ChiTietCaDay> createState() => _ChiTietCaDayState();
}

class _ChiTietCaDayState extends State<ChiTietCaDay> {
  int buoi = 1;
  TheoDoiTienTrinhController _theoDoiTienTrinhController=Get.find<TheoDoiTienTrinhController>();

  @override
  void initState() {
    buoi=widget.tienDo.buoi!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                    blurRadius: 10,
                    color: AppColors.blue2.withOpacity(0.15))
              ]),
          padding: EdgeInsets.only(
              left: 15.sp, right: 15.sp, top: 20.sp, bottom: 15.sp),
          child: Column(
            children: [
              DTitleIcon(
                icon: Assets.iconsBook,
                title: 'Chi tiết ca dạy'.tr,
                colorIcon: AppColors.primary,
              ),
              SizedBox(
                height: 17.sp,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.borderRed),
                    borderRadius: BorderRadius.circular(8.sp)),
                padding: EdgeInsets.symmetric(horizontal: 13.sp),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20.sp))),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if(buoi > 1){
                                _theoDoiTienTrinhController.getThongTinKhoaHoc(id: widget.idKh, buoi: buoi-1);
                                setState(() {
                                  buoi = buoi - 1;
                                });
                              }

                            },
                            child: Padding(
                              padding: EdgeInsets.all(14.sp),
                              child: SvgPicture.asset(Assets.iconsBack,
                                  width: 16.sp,
                                  height: 16.sp,
                                  fit: BoxFit.contain,
                                  color: AppColors.white),
                            ),
                          ),
                          Expanded(
                              child: AppText(
                            'Buổi ${buoi}/${widget.tienDo.tong_buoi}',
                            textAlign: TextAlign.center,
                            style: AppStyle.DEFAULT_18_BOLD
                                .copyWith(color: AppColors.white),
                          )),
                          InkWell(
                            onTap: () {
                              if(buoi < widget.tienDo.tong_buoi!){
                                _theoDoiTienTrinhController.getThongTinKhoaHoc(id: widget.idKh, buoi: buoi+1);
                                setState(() {
                                  buoi = buoi + 1;
                                });
                              }

                            },
                            child: Padding(
                              padding: EdgeInsets.all(14.sp),
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: SvgPicture.asset(Assets.iconsBack,
                                    width: 16.sp,
                                    height: 16.sp,
                                    fit: BoxFit.contain,
                                    color: AppColors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.sp,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcCalendar,
                              height: 14.sp,
                              color: AppColors.textBlack,
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            AppText(
                              widget.tienDo.ngay_day??'',
                              style: AppStyle.DEFAULT_14.copyWith(
                                  fontWeight: FontWeight.w500, height: 1.2),
                            )
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcTime,
                              height: 14.sp,
                              color: AppColors.textBlack,
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            AppText(
                              widget.tienDo.ca_day??'',
                              maxLines: 1,
                              style: AppStyle.DEFAULT_14.copyWith(
                                  fontWeight: FontWeight.w500, height: 1.2),
                            )
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 17.sp,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 1, color: AppColors.grayF2),
                        bottom: BorderSide(width: 1, color: AppColors.grayF2),
                      )),
                      padding: EdgeInsets.symmetric(vertical: 20.sp),
                      child: Row(
                        children: [
                          Expanded(
                              child: AppText(
                            'Chương trình học',
                            style: AppStyle.DEFAULT_16.copyWith(
                                fontWeight: FontWeight.w600, height: 1.2),
                          )),
                          Expanded(
                              child: DButton(
                                  text: 'Xem chi tiết'.tr,
                                  right: SvgPicture.asset(Assets.iconsNext),
                                  textStyle: AppStyle.DEFAULT_14.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white),
                                  padH: 5.sp,
                                  onClick: onClickXemChiTiet))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    if(widget.tienDo.trang_thai!.id==77)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetNetworkCacheImage(
                          image:
                              widget.avatar,
                          width: 48.sp,
                          height: 48.sp,
                          fit: BoxFit.cover,
                          borderRadius: 100,
                        ),
                        SizedBox(
                          width: 11.sp,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Nhận xét buổi học',
                                style: AppStyle.DEFAULT_16.copyWith(
                                    fontWeight: FontWeight.w600, height: 1.2),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              AppText(
                                widget.tienDo.nhan_xet_buoi_hoc??'',
                                style:
                                    AppStyle.DEFAULT_14.copyWith(height: 1.2),
                              ),
                              SizedBox(
                                height: 11.sp,
                              ),
                              Container(
                                width: Get.width / 3,
                                child: DButton(
                                    text: 'Xem chi tiết'.tr,
                                    right: SvgPicture.asset(Assets.iconsNext),
                                    background: AppColors.blue,
                                    borderColor: AppColors.blue,
                                    padV: 8.sp,
                                    textStyle: AppStyle.DEFAULT_14.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                    padH: 5.sp,
                                    onClick: onClickXemNhanXet),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.sp),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: AppColors.grayF2))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Liên hệ với Quản lý vận hành',
                                style: AppStyle.DEFAULT_14
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 7.sp,
                              ),
                              ContainerText(
                                  text: widget.tienDo.trang_thai!.name??'',
                                  color: widget.tienDo.trang_thai!.id == 77
                                      ? AppColors.green
                                      : widget.tienDo.trang_thai!.id == 76
                                          ? AppColors.blue
                                          : widget.tienDo.trang_thai!.id == 75
                                              ? AppColors.textBlack
                                              : AppColors.green)
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: ()async{
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path: widget.sdt,
                                  );
                                  await launchUrl(launchUri);
                                },
                                child: SvgPicture.asset(
                                  Assets.iconsCall,
                                  width: 38.sp,
                                  height: 38.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(
                                width: 8.sp,
                              ),
                              InkWell(
                                onTap: ()async{
                                  final Uri launchUri = Uri(
                                    scheme: 'sms',
                                    path: widget.sdt,
                                  );
                                  await launchUrl(launchUri);
                                },
                                child: SvgPicture.asset(
                                  Assets.iconsChat,
                                  width: 38.sp,
                                  height: 38.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        buoi==widget.tienDo.tong_buoi? Column(
          children: [
            SizedBox(
              height: 40.sp,
            ),
            AppText(
              'Vui lòng đánh giá giáo viên để cải thiện chất lượng dịch vụ.',
              style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15.sp,
            ),
            DButton(
                text: 'Đánh giá giáo viên'.tr,
                right: SvgPicture.asset(Assets.iconsNext),
                onClick: onClickDanhGiaGV)
          ],
        ):SizedBox()
      ],
    );
  }

  onClickXemChiTiet() {
    AppNavigator.navigateChiTietChuongTrinh(widget.tienDo.id!);
  }

  onClickDanhGiaGV() {
    AppNavigator.navigateDanhGiaGiaoVien(widget.giaoVien,widget.idKh);
  }

  onClickXemNhanXet() {
    AppNavigator.navigateNhanXetBuoiHoc(widget.tienDo.id!);
  }
}

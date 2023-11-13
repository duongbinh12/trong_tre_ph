import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/widget_handle.dart';

import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/app_text.dart';
import '../home/menu.dart';

class ChuyenKhoan extends StatefulWidget {
  const ChuyenKhoan({super.key});

  @override
  State<ChuyenKhoan> createState() => _ChuyenKhoanState();
}

class _ChuyenKhoanState extends State<ChuyenKhoan> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  XFile? _imagePicker;
  ServiceController _serviceController=Get.find<ServiceController>();
  int dichVuId=Get.arguments;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _serviceController.getInfoBanking(dichVuId.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        backgroundColor: AppColors.grayF5,
        keyScaffold: ScaffoldKey,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Column(
      children: [
        DHeaderShadow(title: 'Chuyển khoản'.tr),
        SizedBox(height: 20.sp,),
        Expanded(child: SingleChildScrollView(
          child: GetX<ServiceController>(
            builder: (controller) {
              if(controller.bankingData.value!=null) {
                return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    SizedBox(height: 13.sp,),
                    _title(icon: Assets.iconsBanking2, title: 'Thông tin chuyển khoản'.tr),
                    SizedBox(height: 12.sp,),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: GradientBoxBorder(
                          gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [AppColors.primary, AppColors.blue2]),
                          width: 2.sp,
                        ),
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
                      child: WidgetNetworkImage(
                        image: controller.bankingData.value!.img??'',
                        width: Get.width,
                        height: 300.h,
                        fit: BoxFit.contain,
                      )
                      // Column(
                      //   children: [
                      //     SvgPicture.asset(
                      //       Assets.iconsMBbank,
                      //     ),
                      //     SizedBox(height: 14.sp,),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         border: Border.all(width: 1,color: AppColors.grayDA),
                      //         borderRadius: BorderRadius.circular(5.sp)
                      //       ),
                      //       child: QrImageView(
                      //         data: 'This is a simple QR code ',
                      //         version: QrVersions.auto,
                      //         padding: EdgeInsets.all(5.sp),
                      //         size: 115.sp,
                      //         gapless: false,
                      //       ),
                      //     ),
                      //     SizedBox(height: 16.sp,),
                      //     AppText(
                      //       'Tên chủ TK: CÔNG TY TNHH GIÁO DỤC ĐÀO TẠO MẸ YÊU CON',
                      //       textAlign: TextAlign.center,
                      //       style: AppStyle.DEFAULT_12,
                      //     ),
                      //     AppText(
                      //       'STK: 2688666888',
                      //       style: AppStyle.DEFAULT_12_BOLD,
                      //     ),
                      //     AppText(
                      //       'Ngân hàng thương mại cổ phần Quân đội MB Bank',
                      //       textAlign: TextAlign.center,
                      //       style: AppStyle.DEFAULT_12,
                      //     ),
                      //   ],
                      // )
                      ,
                    ),
                    SizedBox(height: 28.sp,),
                    _title(icon: Assets.iconsBanking2,colorIcon: AppColors.orange, title: 'Cú pháp chuyển khoản'.tr),
                    SizedBox(height: 11.sp,),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.sp)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 13.sp),
                      child: Row(
                        children: [
                          Expanded(child: AppText(
                            controller.bankingData.value!.ghiChu??'',
                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                          )),
                          SizedBox(width: 15.sp,),
                          InkWell(
                            onTap: ()async{
                              try{
                                await Clipboard.setData(const ClipboardData(text: "(Ho va ten) + 3985 thanh toan chuong trinh Gia su Pro"));
                                Fluttertoast.showToast(
                                    msg: "Đã lưu vào bộ nhớ tạm",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: AppColors.primary.withOpacity(0.5),
                                    textColor: Colors.white,
                                    fontSize: 16.sp
                                );
                              }catch(e){
                                print("error chuyển khoản ${e}");
                              }

                            },
                            child: Container(
                              width: 30.sp,
                              height: 30.sp,
                              padding: EdgeInsets.all(7.sp),
                              decoration: BoxDecoration(
                                color: AppColors.bgRed,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: SvgPicture.asset(
                                Assets.iconsCopy,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25.sp,),
                    _title(icon: Assets.iconsNote, title: 'Ghi chú'.tr,isRequired: true),
                    SizedBox(height: 10.sp,),
                    AppText(
                      '(Phụ huynh sau khi thanh toán thành công sẽ gửi ảnh chụp màn hình chuyển khoản để chúng tôi xác nhận thông tin)',
                      style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 15.sp,),
                    InkWell(
                      onTap: onClickPickImage,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(width: 1,color: AppColors.grayE5),
                          color: AppColors.white
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 8.sp),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppText(
                                _imagePicker!=null?"Đã tải lên 1 ảnh".tr: 'Tải ảnh lên'.tr,
                                style: AppStyle.DEFAULT_14.copyWith(color: AppColors.textBlack.withOpacity(0.6)),
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.iconsIcUpload
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.sp,),
                    Row(
                      children: [
                        Expanded(child: DButton(text: 'Quay lại'.tr,
                            isFlexible: true,
                            textColor: AppColors.textBlack,
                            borderColor: AppColors.grayE5,
                            background: AppColors.grayE5,
                            left: RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset(
                                Assets.iconsNext,
                                color: AppColors.textBlack,
                              ),
                            )
                            , onClick: onClickBack)),
                        SizedBox(width: 15.sp,),
                        Expanded(child: DButton(text: 'Hoàn tất'.tr,
                            right: SvgPicture.asset(
                                Assets.iconsNext
                            )
                            , onClick: onClickNext))
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).viewPadding.bottom+50.h,)
                  ],
                ),
              );
              }
              else return SizedBox();
            }
          ),
        ))
      ],
    ));
  }

  Widget _title(
      {required String icon, required String title, Color? colorIcon,bool isRequired=false}) {
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
        ),
        isRequired==true? AppText(
          '*',
          style: AppStyle.DEFAULT_18_BOLD.copyWith(color: AppColors.primary),
        ):SizedBox()
      ],
    );
  }

  onClickBack() {
    Get.back();
  }

  onClickNext() {
    if(_imagePicker!=null) {
      _serviceController.uploadImage(don_dich_vu_id: dichVuId.toString(), file: File(_imagePicker!.path));
    } else{

    }
  }

  void onClickPickImage() async{
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        _imagePicker=pickedFile;
      });
    } catch (e) {
      print("lỗi chọn ảnh ${e}");
    }
  }
}

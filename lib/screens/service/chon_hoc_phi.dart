import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:trong_tre/generated/assets.dart';
import 'package:trong_tre/res/app_values.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'package:trong_tre/screens/service/widget/DRadioButton.dart';
import 'package:trong_tre/services/entity/so_buoi_hoc_response.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/DHeader_shadow.dart';
import 'package:trong_tre/widgets/DInput.dart';
import 'package:trong_tre/widgets/DRowText.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/app_text.dart';

class ChonHocPhi extends StatefulWidget {
  const ChonHocPhi({super.key});

  @override
  State<ChonHocPhi> createState() => _ChonHocPhiState();
}

class _ChonHocPhiState extends State<ChonHocPhi> {
  int indexTeacher = 0;
  int indexBuoi=0;
  TextEditingController _noteController=TextEditingController();
  ServiceController _serviceController = Get.find<ServiceController>();
  List arrBuoi=[
    {
      'soBuoi':1,
      'sellPrice':350000,
      'oldPrice':null,
      'discount':null
    },
    {
      'soBuoi':5,
      'sellPrice':1697500,
      'oldPrice':1750000,
      'discount':'-03%'
    },
    {
      'soBuoi':10,
      'sellPrice':3325000,
      'oldPrice':3500000,
      'discount':'-05%'
    },
    {
      'soBuoi':20,
      'sellPrice':6510000,
      'oldPrice':7000000,
      'discount':'-07%'
    },
    {
      'soBuoi':30,
      'sellPrice':9450000,
      'oldPrice':10500000,
      'discount':'-10%'
    },
    {
      'soBuoi':60,
      'sellPrice':17850000,
      'oldPrice':21000000,
      'discount':'-15%'
    },
    {
      'soBuoi':100,
      'sellPrice':29050000,
      'oldPrice':35000000,
      'discount':'-17%'
    },

  ];
  int dichVuId=Get.arguments;

  JustTheController _justTheController=JustTheController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _serviceController.getSoBuoiHoc(dichVuId: dichVuId, page: 1, sort: 0);
      _serviceController.getChonHocPhi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _pickTeacher(),
          SizedBox(
            height: 20.sp,
          ),
          _soLuongBe(),
          SizedBox(
            height: 20.sp,
          ),
          _anTrua(),
          SizedBox(
            height: 20.sp,
          ),
          _themGio(),
          SizedBox(
            height: 20.sp,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15.sp),
              child: _title(
                  icon: Assets.iconsIcCalendar,
                  title: 'Chọn buổi',
                  colorIcon: AppColors.blue)),
          SizedBox(
            height: 15.sp,
          ),
          GetX<ServiceController>(
            builder: (controller) {
              if(controller.listBuoiHoc.value!=null) {
                return ListView.builder(
                itemCount: controller.listBuoiHoc.value!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ItemBuoi(index: index,
                      data: controller.listBuoiHoc.value![index],
                      onClick: (){
                    setState(() {
                      indexBuoi=index;
                    });
                    _serviceController.chooseBuoi(index);
                  }, isSelected: indexBuoi==index);
                },
              );
              }
              else return SizedBox();
            }
          ),
          SizedBox(height: 10.sp,),
          DottedLine(),
          SizedBox(height: 24.sp,),
          GetX<ServiceController>(
            builder: (controller) {
              return Column(
                children: [
                  DRowText(textL: 'Học phí', money: controller.hocPhi.value!*controller.soLuongBe.value,),
                  SizedBox(height: 16.sp,),
                  DRowText(textL: 'Phụ cấp', money:(controller.tienAnTrua.value+controller.tienThemGio.value)*controller.soLuongBe.value*controller.listBuoiHoc.value![controller.indexBuoi].so_buoi!,),
                  SizedBox(height: 16.sp,),
                  DRowText(textL: 'Tổng', money: (controller.hocPhi.value!*controller.soLuongBe.value)+(controller.tienAnTrua.value+controller.tienThemGio.value)*controller.soLuongBe.value*controller.listBuoiHoc.value![controller.indexBuoi].so_buoi!,styleR: AppStyle.DEFAULT_20_BOLD.copyWith(color: AppColors.primary,height: 1.2),),
                ],
              );
            }
          ),
          SizedBox(height: 22.sp,),
          DottedLine(),
          SizedBox(height: 20.sp,),
          _note()
        ],
      ),
    );
  }

  Widget _pickTeacher() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 13.sp),
      child: GetX<ServiceController>(
        builder: (controller) {
          if(controller.listLoaiGiaoVien.value!=null) {
            return Column(
            children: [
              _title(icon: Assets.iconsStudent, title: 'Chọn giáo viên'.tr),
              SizedBox(
                height: 18.sp,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 10.sp,
                children: List.generate(controller.listLoaiGiaoVien.value!.length, (index) => Container(
                  width: (Get.width-20.sp-20.sp-15.sp-15.sp-10.sp)/2,
                    child: DButton(
                        text: controller.listLoaiGiaoVien.value![index].name??'',
                        textStyle: AppStyle.DEFAULT_14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: indexTeacher == index
                                ? AppColors.white
                                : AppColors.textBlack,
                            height: 1.2),
                        background: indexTeacher != index
                            ? AppColors.primary.withOpacity(0.1)
                            : AppColors.primary,
                        borderColor: indexTeacher != index
                            ? AppColors.primary.withOpacity(0.1)
                            : AppColors.primary,
                        onClick: () {
                          onClickDichVu(index);
                        }))),
              )
            ],
          );
          }
          else return SizedBox();
        }
      ),
    );
  }

  List<String> soLuongBe=['1', '2', '3', '4', '5'];

  Widget _soLuongBe() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 13.sp),
      child: Column(
        children: [
          _title(icon: Assets.iconsGroup2, title: 'Số lượng bé'.tr),
          SizedBox(
            height: 20.sp,
          ),
          DRadioButton(data: soLuongBe,onChanged: (int index){
            _serviceController.changeSoLuongBe(int.parse(soLuongBe[index]));
          },)
        ],
      ),
    );
  }

  Widget _anTrua() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 13.sp),
      child: GetX<ServiceController>(
        builder: (controller) {
          if(controller.listAnTrua.value!=null) {
            List<String> arrAnTrua=[];
            for(int i=0;i<controller.listAnTrua.value!.length;i++){
              arrAnTrua.add("${controller.listAnTrua.value![i].tieu_De}${controller.listAnTrua.value![i].ghi_chu!=""?" (${controller.listAnTrua.value![i].ghi_chu})":""}");
            }
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(icon: Assets.iconsApple, title: 'Ăn trưa (với cả ca ngày)'.tr),
              SizedBox(
                height: 20.sp,
              ),
              DRadioButton(
                data: arrAnTrua,
                onChanged: (int index){
                  _serviceController.idAnTrua=controller.listAnTrua.value![index].id!;
                  if(controller.listAnTrua.value![index].tong_tien!="0"){
                    _serviceController.changeTienAnTrua((int.parse(controller.listAnTrua.value![index].tong_tien!)*(_serviceController.listBuoiHoc.value![indexBuoi].so_buoi!)).toDouble());
                  }
                  else{
                    _serviceController.changeTienAnTrua(0);
                  }
                },
                isVertical: true,
              )
            ],
          );
          }
          else return SizedBox();
        }
      ),
    );
  }

  Widget _themGio() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10.sp)),
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 13.sp),
      child: GetX<ServiceController>(
        builder: (controller) {
          if(controller.listThemGio.value!=null) {
            List<String> arrThemGio=[];
            for(int i=0;i<controller.listThemGio.value!.length;i++){
              arrThemGio.add("${controller.listThemGio.value![i].tieu_De}${controller.listThemGio.value![i].ghi_chu}");
            }
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(icon: Assets.iconsIcTime, title: 'Thêm giờ'.tr),
              SizedBox(
                height: 20.sp,
              ),
              DRadioButton(
                data: arrThemGio,
                isVertical: true,
                onChanged: (int index){
                  _serviceController.idThemGio=controller.listThemGio.value![index].id!;
                  if(controller.listThemGio.value![index].tong_tien!="0"){
                    _serviceController.changeTienThemGio(double.parse(controller.listThemGio.value![index].tong_tien!));
                    _serviceController.indexThemGio=index;
                  }
                  else{
                    _serviceController.changeTienThemGio(0);
                    _serviceController.indexThemGio=index;
                  }
                },
              )
            ],
          );
          }
          else return SizedBox();
        }
      ),
    );
  }

  Widget _note(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _title(icon: Assets.iconsNote, title: 'Ghi chú'.tr),
              AppText('*',style: AppStyle.DEFAULT_16_BOLD.copyWith(color: AppColors.primary),)
            ],
          ),
          SizedBox(height: 10.sp,),
          AppText(
            '(Phụ huynh chọn hình thức ghi chú dặn dò: điền vào ô chat hoặc điền form hoặc cả 2)',
            style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 9.sp,),
          DInput(controller: _noteController,
              maxLine: 5,
              onChange: (String text){
                _serviceController.ghiChu=text;
              },
              borderRadius: 10.sp
              , hintText: 'Ghi chú: (Gồm Họ và tên con, Ngày sinh, Giới tính)'),
          SizedBox(height: 12.sp,),
          Container(
            width: Get.width/2,
            child: DButton(
                text: 'Form điền ghi chú'.tr,
                right: SvgPicture.asset(
                  Assets.iconsUpload
                ),
                padH: 8.sp,
                textStyle: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600,color: AppColors.white,height: 1.2),
                onClick: onClickFormGhiChu
            ),
          ),
          SizedBox(height: 60.sp,),
          DButton(
              text: 'Tiếp tục',
              right: SvgPicture.asset(
                Assets.iconsNext
              ),
              onClick: onCLickNext),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom+20.sp,)
        ],
      ),
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

  onClickDichVu(int index) {
    setState(() {
      indexTeacher = index;
    });
    _serviceController.giaoVien=index==0?15:16;
  }

  onClickChon() {}

  onClickFormGhiChu() {
  }

  onCLickNext() {
    _serviceController.nextTab();
  }

  void onClickInfo() {
    _justTheController.showTooltip();
  }
}

class ItemBuoi extends StatefulWidget {
  const ItemBuoi({super.key, required this.index, required this.data, required this.onClick, required this.isSelected});
  final int index;
  final ItemSoBuoiHoc data;
  final Function onClick;
  final bool isSelected;

  @override
  State<ItemBuoi> createState() => _ItemBuoiState();
}

class _ItemBuoiState extends State<ItemBuoi> {
  JustTheController _justTheController=JustTheController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onClick();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.sp),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color:widget.isSelected==true?AppColors.bgRed :AppColors.white,
                  border:Border.all(width: 1,color:widget.isSelected==true? AppColors.borderRed : AppColors.white),
                  boxShadow:widget.isSelected==true? [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 15,
                        spreadRadius: 0,
                        color: AppColors.blue2.withOpacity(0.15)
                    )
                  ]:[],
                  borderRadius: BorderRadius.circular(10.sp)),
              padding: EdgeInsets.symmetric(horizontal: 18.sp),
              height: Get.height*(100/852),

              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(width: 1)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsIcBuoi,
                              ),
                              SizedBox(
                                width: 6.sp,
                              ),
                              AppText(
                                '${widget.data.so_buoi} Buổi',
                                style: AppStyle.DEFAULT_16
                                    .copyWith(fontWeight: FontWeight.w600, height: 1.2),
                              ),
                              SizedBox(width: 6.sp,),
                              InkWell(
                                onTap: onClickInfo,
                                child: JustTheTooltip(
                                  controller: _justTheController,
                                  backgroundColor: AppColors.blue,
                                  tailBaseWidth: 10.sp,
                                  tailLength: 10.sp,
                                  content: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 8.sp),
                                    child: AppText(
                                      '(không bao gồm các ngày nghỉ Lễ, Tết)',
                                      style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,color: AppColors.white),
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.iconsInfo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '${AppValue.format_money(double.parse(widget.data.thanh_tien!))} ',
                                  style: AppStyle.DEFAULT_18.copyWith(
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                      color: AppColors.primary),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'đ',
                                        style:
                                        TextStyle(decoration: TextDecoration.underline)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5.sp,),
                              widget.data.khuyen_mai!=0? Stack(
                                children: [
                                  SvgPicture.asset(
                                    Assets.iconsDiscount,
                                    width: 55.sp,
                                    height: 19.sp,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    left: 8.sp,
                                    top: 0,bottom: 0,right: 5.sp,
                                    child: Center(
                                      child: AppText(
                                        '-${widget.data.khuyen_mai}%',
                                        textAlign: TextAlign.center,
                                        style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w600,color: AppColors.white,height: 1.2),
                                      ),
                                    ),
                                  )
                                ],
                              ):SizedBox(),

                            ],
                          ),
                          widget.data.khuyen_mai!=0? AppText(
                            '${AppValue.format_money(double.parse(widget.data.tong_tien!))} đ',
                            style: AppStyle.DEFAULT_16_BOLD.copyWith(color: AppColors.textBlack.withOpacity(0.5),decoration: TextDecoration.lineThrough,height: 1.5),
                          ):SizedBox()
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      child: Opacity(
                        opacity:widget.isSelected==true?1: 0.5,
                        child: DButton(
                          text: 'Chọn',
                          onClick: onClickChon,
                          textStyle: AppStyle.DEFAULT_14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                              height: 1.2),
                        ),
                      ))
                ],
              ),
            ),
            Positioned(
              top: 19.sp,
              bottom: 19.sp,
              left: 0,
              child: Container(
                width: 5.sp,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(50.sp))
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onClickInfo() {
    _justTheController.showTooltip();
  }

  onClickChon() {
    widget.onClick();
  }
}


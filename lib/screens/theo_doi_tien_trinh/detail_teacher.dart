import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/widgets/DButton.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DHeader.dart';
import '../../widgets/DHeader_shadow.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class DetailTeacher extends StatefulWidget {
  const DetailTeacher({super.key});

  @override
  State<DetailTeacher> createState() => _DetailTeacherState();
}

class _DetailTeacherState extends State<DetailTeacher> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  ScrollController _historyController=ScrollController(keepScrollOffset: true);
  ScrollController _daoTaoController=ScrollController(keepScrollOffset: true);
  PageController _pageController=PageController();
  double offset=0;
  double offsetDaoTao=0;
  int indexTab=0;

  @override
  void initState() {
    _historyController.addListener(() {
      if(_historyController.offset==_historyController.position.minScrollExtent){
        setState(() {
          offset=0;
        });
        _historyController.keepScrollOffset;
        _daoTaoController.animateTo(0, duration: Duration(milliseconds: 100), curve: Curves.ease);
      }
      else if(_historyController.offset>0){
        setState(() {
          offset=_historyController.offset;
        });
        _historyController.keepScrollOffset;
        _daoTaoController.animateTo(_historyController.offset, duration: Duration(milliseconds: 100), curve: Curves.ease);
      }
    });

    _daoTaoController.addListener(() {
      if(_daoTaoController.offset==_daoTaoController.position.minScrollExtent){
        setState(() {
          offset=0;
        });
      }
      else if(_daoTaoController.offset>0){
        setState(() {
          offset=_daoTaoController.offset;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double maxExtent = 214.sp;
    double minExtent = 0;
    final expendPercentage = 1-min(1, offset / (maxExtent - minExtent));
    return AppBasePage(
        keyScaffold: ScaffoldKey,
        backgroundColor: AppColors.grayF5,
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
        Positioned.fill(child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top+20.sp,),
            DHeader(
              title:'Thông tin giáo viên'.tr,
              keyMenu: ScaffoldKey,
              showMenu: true,
              colorTitle: AppColors.white,
            ),
            SizedBox(height: 60.sp,),
            Expanded(child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grayF5,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.sp)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -2),
                        spreadRadius: 0,
                        blurRadius: 20,
                        color: AppColors.blue2.withOpacity(0.15)
                      )
                    ]
                  ),
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 100.sp,),
                      AnimatedContainer(
                          height: minExtent + (maxExtent - minExtent) * expendPercentage,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(),
                          duration: Duration(milliseconds: 300),
                          child: _infoTeacher()),
                      SizedBox(height: 20.sp,),
                      Row(
                        children: [
                          Expanded(child: DButton(text: 'Lịch sử ca dạy'.tr,
                              textStyle: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500,color:indexTab==0? AppColors.white:AppColors.textBlack,height: 1.2),
                              background:indexTab==0? AppColors.primary:AppColors.primary.withOpacity(0.1),
                              borderColor: indexTab==0? AppColors.primary:AppColors.primary.withOpacity(0.1),
                              onClick: onClickLichSu)),
                          SizedBox(width: 4,),
                          Expanded(child: DButton(text: 'Các khóa đào tạo'.tr,
                              textStyle: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500,color: indexTab==1? AppColors.white:AppColors.textBlack,height: 1.2),
                              background: indexTab==1? AppColors.blue2:AppColors.blue2.withOpacity(0.15),
                              borderColor: indexTab==1? AppColors.blue2:AppColors.blue2.withOpacity(0.15),
                              onClick: onClickCacKhoa)),
                          SizedBox(width: 30.sp,),
                        ],
                      ),
                      Expanded(child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          _history(),
                          _daoTao()
                        ],
                      ))
                    ],
                  ),
                ),
                Positioned(
                  top: -32.sp,
                    left: 20.sp,right: 20.sp,
                    child: _teacher()),

              ],
            ))
          ],
        ))
      ],
    ));
  }

  Widget _history(){
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(top: 15.sp),
      controller: _historyController,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: onClickItemHistory,
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
                        color: AppColors.green.withOpacity(0.1),
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
                              color: AppColors.green,
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
                        // SizedBox(
                        //   width: 5.sp,
                        // ),
                        Flexible(
                          flex: 2,
                          child: DButton(
                              text: 'Đã hoàn thành'.tr,
                              padH: 6.sp,
                              padV: 0.sp,
                              background: AppColors.green.withOpacity(0.2),
                              borderColor: AppColors.green.withOpacity(0.2),
                              textStyle: AppStyle.DEFAULT_14.copyWith(
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                  color: AppColors.green),
                              onClick: (){}),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2.sp),
                                  child: SvgPicture.asset(
                                    Assets.iconsIcCalendar,
                                    width: 12.sp,
                                    height: 12.sp,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                                SizedBox(
                                  width: 6.sp,
                                ),
                                Expanded(
                                  child: AppText(
                                    'Nhận xét của PH'.tr,
                                    style: AppStyle.DEFAULT_14.copyWith(height: 1.2),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: AppText(
                                'Cô tận tâm trong công việc và nhiệt huyết chân thành với bé Cún',
                                style: AppStyle.DEFAULT_14.copyWith(
                                    fontWeight: FontWeight.w500, height: 1.2),
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
      },
    );
  }

  Widget _daoTao(){
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(top: 15.sp),
      controller: _daoTaoController,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: onClickItemDaoTao,
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
                        color: AppColors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.sp),
                          topRight: Radius.circular(15.sp),
                          bottomLeft: Radius.circular(30.sp),
                        )),
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsStudent,
                          width: 18.sp,
                          height: 18.sp,
                          color: AppColors.green,
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Expanded(
                          child: AppText(
                            'Đào tạo bảo mẫu cơ bản 0-6 tuổi',
                            style: AppStyle.DEFAULT_16_BOLD,
                          ),
                        ),
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
                                  Assets.iconsIcCalendar,
                                  width: 12.sp,
                                  height: 12.sp,
                                  color: AppColors.textBlack,
                                ),
                                SizedBox(
                                  width: 6.sp,
                                ),
                                AppText(
                                  'Thời gian'.tr,
                                  style: AppStyle.DEFAULT_14,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: AppText(
                                '10/08/2023',
                                style: AppStyle.DEFAULT_14
                                    .copyWith(fontWeight: FontWeight.w500),
                              )),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2.sp),
                                  child: SvgPicture.asset(
                                    Assets.iconsCup,
                                    width: 12.sp,
                                    height: 12.sp,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                                SizedBox(
                                  width: 6.sp,
                                ),
                                Expanded(
                                  child: AppText(
                                    'Kết quả'.tr,
                                    style: AppStyle.DEFAULT_14.copyWith(height: 1.2),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.iconsTicket,
                                        width: 88.sp,
                                        height: 23.sp,
                                      ),
                                      Positioned.fill(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.iconsLike,
                                              width: 20.sp,
                                              height: 20.sp,
                                            ),
                                            SizedBox(width: 3.sp,),
                                            AppText(
                                              'Đạt',
                                              style: AppStyle.DEFAULT_14.copyWith(height: 1.3,fontWeight: FontWeight.w500,color: AppColors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
      },
    );
  }

  Widget _teacher(){
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 10,
                color: AppColors.blue2.withOpacity(0.15)
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
            child: Row(
              children: [
                WidgetNetworkCacheImage(
                  image:
                  'https://allimages.sgp1.digitaloceanspaces.com/tipeduvn/2022/07/1657905893_880_Tuyen-Tap-Bo-Anh-Girl-Xinh-Dep-Nhat-Nam-2020.jpg',
                  width: 97.sp,
                  height: 97.sp,
                  fit: BoxFit.cover,
                  borderRadius: 100,
                ),
                SizedBox(width: 15.sp,),
                Expanded(child: Container(
                  height: 97.sp,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: AppColors.orange),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 2.sp),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star_rate_rounded,size: 15.sp,color: AppColors.orange,),
                            SizedBox(width: 3.sp,),
                            AppText('5/5',style: AppStyle.DEFAULT_12.copyWith(height: 1.3),),
                          ],
                        ),
                      ),
                      AppText(
                        'Nguyễn Hoàng Anh Thư',
                        style: AppStyle.DEFAULT_16_BOLD.copyWith(height: 1.1),
                      ),
                      AppText(
                        'Giáo viên',
                        style: AppStyle.DEFAULT_14.copyWith(height: 1.2,color: AppColors.gray7D),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _infoTeacher(){
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 10,
                color: AppColors.blue2.withOpacity(0.15)
            )
          ]
      ),
      margin: EdgeInsets.all(2.sp),
      padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText('Giới thiệu',style: AppStyle.DEFAULT_18_BOLD,),
          SizedBox(height: 15.sp,),
          _itemGioiThieu('Họ và tên','Nguyễn Hoàng Anh Thư'),
          SizedBox(height: 10.sp,),
          _itemGioiThieu('Ngày sinh','12/05/1990'),
          SizedBox(height: 10.sp,),
          _itemGioiThieu('Bằng cấp','Thạc sỹ • Đại học Sư phạm Hà Nội'),
          SizedBox(height: 10.sp,),
          _itemGioiThieu('Chứng chỉ/\nChứng nhận','Chứng chỉ ngoại ngữ bậc 3'),
        ],
      ),
    );
  }

  Widget _itemGioiThieu(String title,String content){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: AppText(title,style: AppStyle.DEFAULT_14,)),
        Expanded(flex: 2,child: AppText(content,style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),)),
      ],
    );
  }

  onClickLichSu() async{
    setState(() {
      indexTab=0;
    });
    await _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    _historyController.jumpTo(offset);
  }

  onClickCacKhoa() async{
    setState(() {
      indexTab=1;
    });
    await _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    _daoTaoController.jumpTo(offset);
  }

  void onClickItemHistory() {
  }

  void onClickItemDaoTao() {
  }
}

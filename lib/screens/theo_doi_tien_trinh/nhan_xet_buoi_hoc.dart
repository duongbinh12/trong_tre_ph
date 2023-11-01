import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_view/photo_view.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/container_text.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/widgets/item_danh_gia.dart';
import 'package:trong_tre/widgets/DHeader.dart';
import 'package:trong_tre/widgets/DTitleIcon.dart';
import 'package:trong_tre/widgets/app_base_page.dart';
import 'package:trong_tre/widgets/app_text.dart';

import '../../generated/assets.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DInput.dart';
import '../../widgets/widget_handle.dart';
import '../home/menu.dart';

class NhanXetBuoiHoc extends StatefulWidget {
  const NhanXetBuoiHoc({super.key});

  @override
  State<NhanXetBuoiHoc> createState() => _NhanXetBuoiHocState();
}

class _NhanXetBuoiHocState extends State<NhanXetBuoiHoc> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();
  TextEditingController _noteController = TextEditingController();

  List danhGia = [
    {
      'title': 'Đánh giá mức độ phù hợp của hoạt động với trẻ',
      'question': [
        {
          'name': 'Toán học: Bé chơi xếp trồng',
          'require': true,
          'nhanXet': true,
          'answer': ['Khó', 'Phù hợp', 'Hoàn thành dễ']
        },
        {
          'name': 'Vận động: Tưới cây',
          'require': true,
          'nhanXet': true,
          'answer': ['Khó', 'Phù hợp', 'Hoàn thành dễ']
        },
        {
          'name': 'Ngôn ngữ: Vườn cải',
          'require': true,
          'nhanXet': true,
          'answer': ['Khó', 'Phù hợp', 'Hoàn thành dễ']
        }
      ]
    },
    {
      'title': 'Chăm sóc trẻ',
      'question': [
        {
          'name': 'Ăn uống',
          'require': true,
          'nhanXet': true,
          'listAnswer': [
            {
              'name': 'Sáng',
              'list': ['Bỏ bữa', 'Ăn 1/2 suất', 'Ăn hết suất']
            },
            {
              'name': 'Trưa',
              'list': ['Bỏ bữa', 'Ăn 1/2 suất', 'Ăn hết suất']
            },
            {
              'name': 'Chiều',
              'list': ['Bỏ bữa', 'Ăn 1/2 suất', 'Ăn hết suất']
            }
          ]
        },
        {
          'name': 'Vệ sinh',
          'require': true,
          'nhanXet': false,
          'isCheckbox': true,
          'answer': ['Lorem ipsum', 'Lorem ipsum']
        },
        {
          'name': 'Sức khỏe',
          'require': true,
          'nhanXet': true,
          'answer': ['Gặp vấn đề', 'Bình thường']
        },
        {
          'name': 'Ngủ',
          'require': true,
          'nhanXet': false,
          'answer': ['Đủ giấc', 'Thiếu ngủ']
        },
        {'name': 'Thuốc', 'require': true, 'nhanXet': true, 'answer': []},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
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
            Positioned.fill(
                child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top + 20.sp,
                ),
                DHeader(
                  title: 'Nhận xét buổi học'.tr,
                  keyMenu: ScaffoldKey,
                  showMenu: true,
                  colorTitle: AppColors.white,
                ),
                SizedBox(
                  height: 50.sp,
                ),
                Expanded(
                    child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.grayF5,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.sp)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, -2),
                                spreadRadius: 0,
                                blurRadius: 20,
                                color: AppColors.blue2.withOpacity(0.15))
                          ]),
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40.sp,
                            ),
                            _teacher(),
                            SizedBox(
                              height: 30.sp,
                            ),
                            AppText(
                              'Form đánh giá',
                              style: AppStyle.DEFAULT_18_BOLD,
                            ),
                            SizedBox(height: 15.sp,),
                            ...List.generate(
                                danhGia.length,
                                (index) => Column(
                                      children: [
                                        _itemFormRate(
                                            danhGia[index]['title'],danhGia[index]),
                                        SizedBox(
                                          height: 30.sp,
                                        ),
                                        DottedLine(
                                          dashColor: AppColors.textBlack
                                              .withOpacity(0.3),
                                        ),
                                        SizedBox(height: 30.sp,),
                                      ],
                                    )),
                            Column(
                              children: [
                                AppText(
                                  'Phụ huynh nhận xét đánh giá'.tr,
                                  style: AppStyle.DEFAULT_18_BOLD,
                                ),
                                AppText(
                                  '(Cho chúng tôi biết cảm nhận, góp ý của bạn)'
                                      .tr,
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic),
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                RatingBar.builder(
                                  initialRating: 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  itemSize: 32.sp,
                                  tapOnlyMode: true,
                                  itemBuilder: (context, _) => SvgPicture.asset(
                                    Assets.iconsStar,
                                    width: 32.sp,
                                    height: 32.sp,
                                    // color: AppColors.grayE5,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                DInput(
                                  controller: _noteController,
                                  hintText: 'Viết đánh giá',
                                  maxLine: 5,
                                  borderRadius: 10.sp,
                                  bgColor: AppColors.white,
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                DButton(text: 'Gửi', onClick: onClickSend),
                                SizedBox(
                                  height: 20.sp +
                                      MediaQuery.of(context).viewPadding.bottom,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.sp,
                      right: 20.sp,
                      top: -30.sp,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15.sp),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  color: AppColors.blue2.withOpacity(0.15))
                            ]),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.sp, horizontal: 13.sp),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcItemHistory,
                              width: 26.sp,
                              height: 26.sp,
                              color: AppColors.green,
                            ),
                            Expanded(
                                child: RichText(
                              text: TextSpan(
                                text: 'Mã đơn: ',
                                style: AppStyle.DEFAULT_14,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '0123456789',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            )),
                            InkWell(
                              onTap: () {
                                AppNavigator.navigateHoanTatDanhGia();
                              },
                              child: ContainerText(
                                  text: 'Đã hoàn thành',
                                  color: AppColors.green),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ))
          ],
        ));
  }

  Widget _teacher() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0,
                color: AppColors.blue2.withOpacity(0.15))
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(13.sp),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.grayF2))),
            child: Row(
              children: [
                WidgetNetworkCacheImage(
                  image:
                      "https://kynguyenlamdep.com/wp-content/uploads/2022/06/anh-gai-dep-de-thuong.jpg",
                  width: 48.sp,
                  height: 48.sp,
                  fit: BoxFit.cover,
                  borderRadius: 50,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Nguyễn Hoàng Anh Thư',
                      style: AppStyle.DEFAULT_14_BOLD,
                    ),
                    AppText(
                      'Giáo viên',
                      style:
                          AppStyle.DEFAULT_14.copyWith(color: AppColors.gray7D),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 13.sp),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.grayF2))),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsStudent,
                  width: 14.sp,
                  height: 14.sp,
                ),
                SizedBox(
                  width: 7.sp,
                ),
                AppText(
                  'Buổi 1',
                  style: AppStyle.DEFAULT_16_BOLD,
                ),
                SizedBox(
                  width: 20.sp,
                ),
                SvgPicture.asset(
                  Assets.iconsIcCalendar,
                  width: 14.sp,
                  height: 14.sp,
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: 7.sp,
                ),
                AppText(
                  '09/08/2023 • 18:00 - 20:00',
                  style:
                      AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.sp, vertical: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DTitleIcon(
                    icon: Assets.iconsIcNhanXet,
                    title: 'Nhận xét buổi học hôm nay'.tr),
                SizedBox(
                  height: 10.sp,
                ),
                AppText(
                  'Con tiếp thu tốt, chăm ngoan và có tinh thần tự giác. Cần làm 2 bài tập ở giáo trình trang số 12 và 13.',
                  style: AppStyle.DEFAULT_14,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                AppText(
                  'Hình ảnh/ Video',
                  style: AppStyle.DEFAULT_14_BOLD,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                InkWell(
                  onTap: () {
                    onClickView(
                        'https://media.doisongphapluat.com/602/2019/8/5/co-giao-tieu-hoc-gay-sot-mang-xa-hoi-vi-qua-xinh-dep-0.jpg');
                  },
                  child: WidgetNetworkCacheImage(
                    image:
                        'https://media.doisongphapluat.com/602/2019/8/5/co-giao-tieu-hoc-gay-sot-mang-xa-hoi-vi-qua-xinh-dep-0.jpg',
                    width: Get.width,
                    height: 175.sp,
                    fit: BoxFit.contain,
                    borderRadius: 0,
                    boxDecoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.borderGray),
                        borderRadius: BorderRadius.circular(10.sp)),
                  ),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.iconsIcArrow,
                      width: 10.sp,
                      height: 12.sp,
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                        child: AppText(
                      'Đánh giá hoạt động',
                      style: AppStyle.DEFAULT_14
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.sp),
                      itemSize: 20.sp,
                      tapOnlyMode: true,
                      ignoreGestures: true,
                      itemBuilder: (context, _) => SvgPicture.asset(
                        Assets.iconsStar,
                        width: 20.sp,
                        height: 20.sp,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemFormRate(String title,data) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xffFFDAE1),
              borderRadius: BorderRadius.circular(15.sp),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: AppColors.blue2.withOpacity(0.15))
              ]),
          padding: EdgeInsets.all(15.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.iconsCheck2,
              ),
              SizedBox(
                width: 8.sp,
              ),
              Expanded(
                child: AppText(
                  title,
                  style: AppStyle.DEFAULT_16_BOLD.copyWith(height: 1.2),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        ...List.generate(data['question'].length, (index) => ItemDanhGia(data: data['question'][index],index: index,))
      ],
    );
  }

  void onClickView(String url) {
    double paddingTop = MediaQuery.of(context).viewPadding.top;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(minHeight: Get.height, minWidth: Get.width),
      backgroundColor: AppColors.black,
      barrierColor: AppColors.black,
      builder: (BuildContext context) {
        return Stack(
          children: [
            PhotoView(
              imageProvider: NetworkImage(url),
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.contained * 3,
              loadingBuilder: (context, event) =>
                  Center(child: CircularProgressIndicator()),
            ),
            Positioned(
              top: paddingTop + 20.sp,
              left: 20.sp,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 35.sp,
                  height: 35.sp,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp)),
                  padding: EdgeInsets.all(8.sp),
                  child: SvgPicture.asset(
                    Assets.iconsBack,
                    // width: 30.sp,
                    // height: 30.sp,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  onClickSend() {}
}

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';

class DProgress extends StatefulWidget {
  const DProgress(
      {super.key, required this.progress, required this.indexS, this.title});

  final List<String> progress;
  final List<String>? title;
  final int indexS;

  @override
  State<DProgress> createState() => _DProgressState();
}

class _DProgressState extends State<DProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(widget.progress.length,
              (index) => _item(widget.progress[index], index + 1)),
        ),
        widget.title!=null?
        Container(
          margin: EdgeInsets.only(top: 8.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.title!.length, (index) => Container(
              width: index==2?70.sp:index==1?65.sp:54.sp,
              child: AppText(
                  widget.title![index],
                textAlign: TextAlign.center,
                style: AppStyle.DEFAULT_12.copyWith(fontWeight: FontWeight.w600,height: 1.2,color:(index<=widget.indexS-1)? AppColors.primary:AppColors.textBlack),
              ),
            )),
          ),
        )
            :SizedBox()
      ],
    );
  }

  Widget _item(String image, int index) {
    return Container(
      width: (index == widget.progress.length)
          ? 54.sp
          : (Get.width - 20.sp - 20.sp - 54.sp) / (widget.progress.length - 1),
      decoration: BoxDecoration(
          // border: Border.all(width: 1)
          ),
      child: Row(
        children: [
          Container(
            width: 54.sp,
            height: 54.sp,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                    width: 1.5,
                    color: (widget.title != null && index <= widget.indexS)
                        ? AppColors.primary
                        : index == widget.indexS
                            ? AppColors.primary
                            : index > widget.indexS
                                ? AppColors.grayDA
                                : AppColors.primary.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(50)),
            child: Container(
              width: 42.sp,
              height: 42.sp,
              padding: EdgeInsets.all(9.sp),
              decoration: BoxDecoration(
                  color: (widget.title != null && index <= widget.indexS)
                      ? AppColors.primary
                      : index == widget.indexS
                          ? AppColors.primary
                          : index > widget.indexS
                              ? AppColors.grayDA
                              : AppColors.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50)),
              margin: EdgeInsets.all(6.sp),
              child: SvgPicture.asset(
                image,
                width: 24.sp,
                height: 24.sp,
                fit: BoxFit.contain,
                color: AppColors.white,
              ),
            ),
          ),
          if (index != widget.progress.length)
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 4.sp),
                child: DottedLine(
                  dashColor: index == widget.indexS - 1
                      ? AppColors.primary
                      : index > widget.indexS - 1
                          ? AppColors.textBlack.withOpacity(0.6)
                          : AppColors.primary.withOpacity(0.5),
                ),
              ),
            )
          else
            SizedBox()
        ],
      ),
    );
  }
}

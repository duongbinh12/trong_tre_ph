import 'package:flutter/material.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';

class DTitle extends StatelessWidget {
  const DTitle({super.key,required this.title,this.showMore});
  final String title;
  final Function? showMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            title,
            style: AppStyle.DEFAULT_18_BOLD.copyWith(height: 1.3),
          ),
        ),
        showMore!=null? InkWell(
          onTap: (){
            showMore!();
          },
          child: AppText(
            'Xem thêm',
            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500,color: AppColors.primary),
          ),
        ):SizedBox()
      ],
    );
  }
}

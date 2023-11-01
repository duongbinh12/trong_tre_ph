import 'package:flutter/material.dart';
import 'package:trong_tre/res/app_styles.dart';
import 'package:trong_tre/res/app_values.dart';
import 'package:trong_tre/res/colors.dart';
import 'package:trong_tre/widgets/app_text.dart';

class DRowText extends StatelessWidget {
  const DRowText({super.key, required this.textL, this.textR, this.styleL, this.styleR, this.colorL, this.colorR, this.money});
  final String textL;
  final String? textR;
  final TextStyle? styleL;
  final TextStyle? styleR;
  final Color? colorL;
  final Color? colorR;
  final double? money;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          textL,
          style:styleL?? AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500,height: 1.2,color: colorL??AppColors.textBlack),
        ),
        textR!=null? AppText(
          textR??'',
          style:styleR?? AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w700,height: 1.2,color: colorL??AppColors.textBlack),
        ):SizedBox(),
        RichText(
          text: TextSpan(
            text: AppValue.format_money(money??0)+' ',
            style:styleR?? AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w700,height: 1.2,color: colorR??AppColors.textBlack),
            children: <TextSpan>[
              TextSpan(text: 'đ', style: TextStyle(decoration: TextDecoration.underline)),
            ],
          ),
        )
      ],
    );
  }
}

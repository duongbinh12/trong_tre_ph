import 'package:flutter/material.dart';
import '/res/app_styles.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  const AppText(
      this.data, {
        Key? key,
        this.style = AppStyle.TEXT_16,
        this.textAlign,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      textScaleFactor: textScaleFactor??1,
      maxLines: maxLines,
    );
  }
}

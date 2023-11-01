import 'package:flutter/material.dart';

import '../../res/app_styles.dart';
import '../../widgets/app_base_page.dart';
import '../../widgets/app_text.dart';

class Screen extends StatefulWidget {
  Screen({Key? key,required this.stt}) : super(key: key);

  final int stt;

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return AppBasePage(child: Center(
        child: AppText(widget.stt.toString(),style: AppStyle.DEFAULT_18_BOLD,),
    ));
  }
}

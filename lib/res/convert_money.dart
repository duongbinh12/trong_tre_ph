import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'res.dart';

class ConvertMoney {
  static String convertMoney(int money,
      {bool type = true}) {
    if(type==true){
      final currencyFormatter = NumberFormat('#,##0', 'ID');
      return currencyFormatter.format(money)+'đ';
    }
    else{
      final currencyFormatter = NumberFormat('#,##0', 'ID');
      return currencyFormatter.format(money);
    }
  }

  static Widget convertMoney2(int money){
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    return
      RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: currencyFormatter.format(money)+' ',
          style: AppStyle.DEFAULT_18.copyWith(color: AppColors.white,fontWeight: FontWeight.w700),
          children: const <TextSpan>[
            TextSpan(text: 'đ', style: TextStyle(decoration: TextDecoration.underline)),
          ],
        ),
      );

  }
}

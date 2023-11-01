import 'package:get/get.dart';
import '/screens/app_no_internet_page.dart';

import 'IPage.dart';

abstract class CommonPages extends IPages {
  CommonPages();

  List<GetPage> onConfig();

  static const noInternet = '/no_internet';

  @override
  List<GetPage> get routes {
    return [
      ...onConfig(),
      GetPage(
        name: '/no_internet',
        page: () => const AppNoInternetPage(),
        transition: Transition.cupertinoDialog,
      ),
    ];
  }
}

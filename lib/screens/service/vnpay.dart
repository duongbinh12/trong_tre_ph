import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:trong_tre/widgets/app_base_page.dart';

import '../../res/colors.dart';
import '../../widgets/DHeader_shadow.dart';
import '../home/menu.dart';

class VnpayScreen extends StatefulWidget {
  const VnpayScreen({super.key});

  @override
  State<VnpayScreen> createState() => _VnpayScreenState();
}

class _VnpayScreenState extends State<VnpayScreen> {
  int loading=0;
  String url=Get.arguments;

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
        backgroundColor: AppColors.grayF5,
        drawer: Drawer(
          width: Get.width * 0.85,
          child: Menu(),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top,),
            Expanded(child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(url)),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              initialOptions: options,
              onLoadStart: (controller, url) {
                // if (url.toString() != "https://daugia.mocnhienphat.com/") {
                //   // previousUrl.add(url.toString());
                //   setState(() {
                //     showBack = true;
                //   });
                // } else {
                //   setState(() {
                //     showBack = false;
                //   });
                // }
              },
              androidOnPermissionRequest: (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                print("loadurl ${navigationAction.request.url}");
                if (navigationAction.request.url.toString().contains('https://www.youtube.com/')) {

                  return NavigationActionPolicy.CANCEL;
                }
                loading++;
                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (controller, url) async {
                if(loading>0) {
                  Get.back();
                  loading--;
                  loading--;
                }
              },
              onLoadError: (controller, url, code, message) {
                // pullToRefreshController.endRefreshing();
              },
              onProgressChanged: (controller, progress) {
                print("loadingggg ${loading}");
                if(loading==0){
                  Get.dialog(Container(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(child: CircularProgressIndicator(color: AppColors.primary,)),
                    ),
                  ));
                  loading++;
                }
                print("loading");
              },
            ),)
          ],
        ));
  }
}

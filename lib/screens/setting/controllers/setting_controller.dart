import 'dart:io';

import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_pref.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/login_response.dart';
import 'package:trong_tre/services/entity/setting_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';

class SettingController extends BaseController {
  CommonRepository commonRepository = Get.find<CommonRepository>();
  Rx<LienHeData?> lienHe = Rxn(null);
  Rx<GioiThieuData?> gioiThieu = Rxn(null);
  Rx<GioiThieuData?> heSinhThai = Rxn(null);
  Rx<LoginData?> myInfo = Rxn(null);

  getLienHe() async {
    await callApi<LienHeResponse>(
        api: commonRepository.getLienHe(),
        onSuccess: (res) {
          lienHe.value = res.data;
        },
        onError: (e) {
          print("err liên hệ ${e}");
        });
  }

  logOut(Function onSuccess) async {
    await callApi<BaseResponse>(
        api: commonRepository.logOut(),
        onSuccess: (res) async{
          await AppPref().removeString(AppPref.auth_token);
          myInfo.value=null;
          onSuccess();

        },
        onError: (e) {
          print("err liên hệ ${e}");
        });
  }

  getGioiThieu() async {
    await callApi<GioiThieuResponse>(
        api: commonRepository.getGioiThieu(),
        onSuccess: (res) {
          gioiThieu.value = res.data;
        },
        onError: (e) {
          print("err gới thịiệu ${e}");
        });
  }

  getHeSinhThai() async {
    await callApi<HeSinhThaiResponse>(
        api: commonRepository.getHeSinhThai(),
        onSuccess: (res) {
          heSinhThai.value = res.data;
        },
        onError: (e) {
          print("err hệ sinh thái ${e}");
        });
  }

  getMyInfo() async {
    await callApi<LoginResponse>(
        api: commonRepository.getMyInfo(),
        onSuccess: (res) {
          myInfo.value = res.data;
        },
        onError: (e) {
          print("err my info ${e}");
        });
  }

  khieuNai(String noiDung) async {
    await callApi<BaseResponse>(
        api: commonRepository.khieuNai(noiDung),
        onSuccess: (res) {
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: "OK",
              content: "Gửi Khiếu nại/Góp ý thành công!",
              onTap1: (){
                Get.back();
                Get.back();
              },
              numberButton: 1);
        },
        onError: (e) {
          print("err my info ${e}");
        });
  }

  editInfo(String hoTen,String diaChi) async {
    await callApi<BaseResponse>(
        api: commonRepository.editInfo(hoTen,diaChi),
        onSuccess: (res) {
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: "OK",
              content: "Sửa thông tin thành công!",
              onTap1: (){
                getMyInfo();
                Get.back();
                Get.back();
              },
              numberButton: 1);
        },
        onError: (e) {
          print("err my info ${e}");
        });
  }

  editAvatar(File image) async {
    await callApi<BaseResponse>(
        api: commonRepository.editAvatar(image),
        onSuccess: (res) {
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: "OK",
              content: "Sửa ảnh đại diện thành công!",
              onTap1: (){
                getMyInfo();
                Get.back();
                Get.back();
              },
              numberButton: 1);
        },
        onError: (e) {
          print("err my info ${e}");
        });
  }
}

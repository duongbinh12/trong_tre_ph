import '/res/common_strings.dart';

class AppStrings extends CommonStrings {
  AppStrings();

  static const String appName = 'MTOM';
  static const content_type = 'Content-Type';
  static const multipart_form_data = 'multipart/form-data';

  @override
  Map<String, Map<String, String>> onConfig() {
    return {
      'en_US': {},
      'vi_VN': {}
    };
  }
}

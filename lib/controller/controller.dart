import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate a delay for loading
    Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }
}

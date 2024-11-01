import 'package:get/get.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  void login() {
    Get.to(() => HomeView());
    // if (username.value.isNotEmpty && password.value.isNotEmpty) {
    //   Get.to(() => HomeView());
    //   print("Login berhasil dengan username: ${username.value} dan password: ${password.value}");
    // } else {
    //   print("Username atau password tidak boleh kosong");
    // }
  }
}

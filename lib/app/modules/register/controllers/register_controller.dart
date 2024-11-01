import 'package:get/get.dart';
import '../../login/views/login_view.dart'; // Pastikan Anda sudah mengimport LoginView

class RegisterController extends GetxController {
  var nama = ''.obs;
  var alamat = ''.obs;
  var noTelp = ''.obs;
  var username = ''.obs;
  var password = ''.obs;

  void register() {

    Get.off(LoginView());
    // if (nama.value.isNotEmpty &&
    //     alamat.value.isNotEmpty &&
    //     noTelp.value.isNotEmpty &&
    //     username.value.isNotEmpty &&
    //     password.value.isNotEmpty) {
    //   // Logika register
    //   print("Registrasi berhasil dengan data:");
    //   print("Nama: ${nama.value}");
    //   print("Alamat: ${alamat.value}");
    //   print("No. Telp: ${noTelp.value}");
    //   print("Username: ${username.value}");
    //   print("Password: ${password.value}");
      
    //   // Setelah berhasil registrasi, arahkan ke halaman login
    //   Get.off(LoginView()); // Hapus halaman Register dari stack dan arahkan ke halaman Login
    // } else {
    //   print("Semua field harus diisi");
    // }
  }
}
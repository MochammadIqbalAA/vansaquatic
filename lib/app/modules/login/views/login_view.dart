import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:myapp/app/modules/home_admin/views/home_admin_view.dart';

class LoginView extends StatelessWidget {
  // Inisialisasi controller
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  height: 150, // Atur tinggi logo
                  width: 150, // Atur lebar logo
                  child: Image.asset(
                    'assets/logo.jpg', // Path yang benar ke file logo
                    fit: BoxFit.cover, // Mengatur bagaimana gambar harus diisi
                  ),
                ),

                SizedBox(height: 40),
                // Username TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Warna latar belakang
                        borderRadius:
                            BorderRadius.circular(14.0), // Ujung tumpul
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Warna shadow
                            blurRadius: 10.0, // Radius blur shadow
                            offset: Offset(0, 4), // Posisi shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.username.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Username ...',
                          border: InputBorder.none, // Menghilangkan border
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Password TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Warna latar belakang
                        borderRadius:
                            BorderRadius.circular(14.0), // Ujung tumpul
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Warna shadow
                            blurRadius: 10.0, // Radius blur shadow
                            offset: Offset(0, 4), // Posisi shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          controller.password.value = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password ...',
                          border: InputBorder.none, // Menghilangkan border
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  // onPressed: () {
                  //   Get.toNamed(
                  //       '/home'); // Memanggil fungsi login dari LoginController
                  // }
                  onPressed: () {
                          // Navigasi ke halaman InboxView
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeAdminView()),
                          );
                        }
                  ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                // Sign Up Text
                TextButton(
                  onPressed: () {
                    Get.toNamed('/register'); // Navigasi ke halaman register
                  },
                  child: Text("Don't have an account? Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/register/views/register_view.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/login/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/home', page: () => HomeView()),
        GetPage(name: '/register', page: () => RegisterView()),
      ],
    ),
    
  );
  
}

import 'package:get/get.dart';
import 'package:alpha_learnapp/views/splash_screen.dart';
import 'package:alpha_learnapp/views/welcome_screen.dart';
import 'package:alpha_learnapp/views/auth/sign_in.dart';
import 'package:alpha_learnapp/views/auth/sign_up.dart';
import 'package:alpha_learnapp/main_app.dart';
import 'package:alpha_learnapp/binding/auth_binding.dart';
import 'package:alpha_learnapp/binding/main_binding.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String mainApp = '/main';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: welcome, page: () => const WelcomeScreen()),
    GetPage(name: signIn, page: () => SignInScreen(), binding: AuthBinding()),
    GetPage(name: signUp, page: () => SignUpScreen(), binding: AuthBinding()),
    GetPage(name: mainApp, page: () => const MainApp(), binding: MainBinding()),
  ];
}

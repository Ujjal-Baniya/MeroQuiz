import 'package:get/get.dart';
import 'package:meroquiz/screens/splash/splash_Screen.dart';
import '../screens/introduction/introduction.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
          name: "/introduction",
          page: () => const AppIntroductionScreen(),
        )
      ];
}

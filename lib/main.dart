import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meroquiz/bindings/initial_bindings.dart';
import 'package:meroquiz/configs/themes/app_dark_theme.dart';
import 'package:meroquiz/configs/themes/app_light_theme.dart';
import 'package:meroquiz/controllers/question_papers/datauploader_screen.dart';
import 'package:meroquiz/firebase_options.dart';
import 'package:meroquiz/routes/app_routes.dart';
import 'package:meroquiz/screens/introduction/introduction.dart';
import 'package:meroquiz/screens/splash/splash_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: LightTheme().buildLightTheme(),
      // theme: DarkTheme().buildDarkTheme(),
      getPages: AppRoutes.routes(),
    );
  }
}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }

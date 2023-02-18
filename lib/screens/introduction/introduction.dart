import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meroquiz/widgets/app_circle_button.dart';

import '../../configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient(context)),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 65,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "This is the Study app. You can use it as yoy want. If you understand how this works you would be able to scale it",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: onSurfaceTextColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppCircleButton(
              onTap: () => null,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    ));
  }
}

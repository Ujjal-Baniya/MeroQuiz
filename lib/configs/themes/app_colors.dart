import 'package:flutter/material.dart';
import 'package:meroquiz/configs/themes/ui_parameters.dart';
import 'app_light_theme.dart';
import 'app_dark_theme.dart';

const Color onSurfaceTextColor = Colors.white;
const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomLeft,
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomLeft,
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ],
);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;

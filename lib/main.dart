import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:fifa_gshs/screens/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '경곽북',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ThemeColors.primary,
          background: ThemeColors.bgColor,
        ),
        fontFamily: 'Suite',
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return ThemeColors.primary;
            }
            return null;
          }),
          checkColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return ThemeColors.uiColor;
            }
            return null;
          }),
        ),
      ),
      home: const MainPage(),
    );
  }
}

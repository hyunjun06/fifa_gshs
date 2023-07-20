import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:fifa_gshs/screens/main_page.dart';
import 'package:fifa_gshs/states/search_conditions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final searchConditionsStore = Store<SearchConditionsState>(
    searchConditionsReducer,
    initialState: SearchConditionsState.initial(),
  );

  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<SearchConditionsState>(
      store: searchConditionsStore,
      child: FlutterWebFrame(
        maximumSize: const Size(475, 812),
        backgroundColor: ThemeColors.titleBgColor,
        builder: (_) => MaterialApp(
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
        ),
      ),
    );
  }
}

import 'package:fifa_gshs/constants/gaps.dart';
import 'package:fifa_gshs/constants/sizes.dart';
import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:fifa_gshs/screens/screens/search_screen.dart';
import 'package:fifa_gshs/screens/widgets/ui_button_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '경곽북',
          style: TextStyle(
            color: Colors.grey.shade900,
          ),
        ),
        backgroundColor: ThemeColors.titleBgColor,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: ThemeColors.bgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size10),
          child: Column(
            children: [
              UiButtonContainer(
                title: "선수 검색",
                navigateTo: const SearchScreen(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "원하는 선수를 검색합니다.",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              Gaps.v16,
              const UiButtonContainer(
                title: "인기 검색 선수",
                navigateTo: Placeholder(),
                child: Row(
                  children: [
                    Text("(list)"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fifa_gshs/constants/gaps.dart';
import 'package:fifa_gshs/constants/sizes.dart';
import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:fifa_gshs/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '경곽북',
              style: TextStyle(
                color: Colors.grey.shade900,
              ),
            ),
            // TODO: make notifications work
            FaIcon(
              FontAwesomeIcons.solidBell,
              color: Colors.grey.shade900,
            )
          ],
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

class UiButtonContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget navigateTo;

  const UiButtonContainer({
    super.key,
    required this.title,
    required this.child,
    required this.navigateTo,
  });

  void _onPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => navigateTo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPressed(context),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.uiColor,
          borderRadius: BorderRadius.circular(Sizes.size4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: Sizes.size8,
              offset: const Offset(-2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: ThemeColors.primary,
                  fontSize: Sizes.size16 + Sizes.size2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v16,
              child,
            ],
          ),
        ),
      ),
    );
  }
}

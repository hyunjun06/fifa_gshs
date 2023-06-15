import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:fifa_gshs/screens/search_conditions_screen.dart';
import 'package:fifa_gshs/screens/search_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentPage = 0;
  late final PageController _pageController;
  final screens = [
    const SearchConditionsScreen(),
    const SearchResultsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      });
  }

  // TODO: loading, reloading
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '선수 검색',
              style: TextStyle(
                color: Colors.grey.shade900,
                fontSize: Sizes.size16 + Sizes.size2,
              ),
            ),
            FaIcon(
              FontAwesomeIcons.rotate,
              color: Colors.grey.shade900,
              size: Sizes.size16 + Sizes.size2,
            ),
          ],
        ),
        backgroundColor: ThemeColors.titleBgColor,
        elevation: 0,
        foregroundColor: Colors.grey.shade900,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(color: ThemeColors.bgColor),
          child: Column(
            children: [
              Container(
                height: Sizes.size52,
                decoration: const BoxDecoration(
                  color: ThemeColors.titleBgColor,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: Sizes.size1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        ),
                        child: Column(
                          children: [
                            const Expanded(child: Center(child: Text("조회 조건"))),
                            AnimatedOpacity(
                              opacity: _currentPage == 0 ? 1 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                height: Sizes.size4,
                                color: ThemeColors.primary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        ),
                        child: Column(
                          children: [
                            const Expanded(child: Center(child: Text("조회 결과"))),
                            AnimatedOpacity(
                              opacity: _currentPage == 1 ? 1 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                height: Sizes.size4,
                                color: ThemeColors.primary,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return screens[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

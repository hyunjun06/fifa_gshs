import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../constants/theme_colors.dart';
import '../widgets/player_list_item.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final dynamic playerData;
  final displayStats = ["속력", "슛 파워", "짧은 패스", "드리블", "대인 수비", "몸싸움"];

  PlayerDetailsScreen({super.key, required this.playerData});

  // Function to check if a string is a valid number using regex
  bool isNumeric(String str) {
    final numericRegex = RegExp(r'^-?\d+$');
    return numericRegex.hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          playerData["name"],
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: Sizes.size16 + Sizes.size2,
          ),
        ),
        backgroundColor: ThemeColors.titleBgColor,
        elevation: 0,
        foregroundColor: Colors.grey.shade900,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playerData["name"],
                        style: const TextStyle(
                          fontSize: Sizes.size24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(children: [
                        Text(
                          playerData["포지션"],
                          style: TextStyle(
                            color: PlayerListItem.getPositionColor(
                                playerData["포지션"]),
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Gaps.h6,
                        Text(
                          playerData["오버롤"],
                          style: const TextStyle(
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          const Text(
                            "왼발",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gaps.h4,
                          Text(
                            playerData["왼발 오른발"].split(',')[0],
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Gaps.h4,
                          const Text(
                            "오른발",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gaps.h4,
                          Text(
                            playerData["왼발 오른발"] == ""
                                ? ""
                                : playerData["왼발 오른발"].split(',')[1],
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Sizes.size80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  displayStats.length,
                  (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        displayStats[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.size16 - Sizes.size2,
                        ),
                      ),
                      Gaps.v4,
                      Text(
                        playerData[displayStats[index]],
                        style: TextStyle(
                          color: PlayerListItem.getNumericColor(
                            int.parse(
                              isNumeric(playerData[displayStats[index]])
                                  ? playerData[displayStats[index]]
                                  : "0",
                            ),
                          ),
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: ThemeColors.bgColor),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(Sizes.size20),
                      child: Text(
                        "세부 스탯",
                        style: TextStyle(
                          fontSize: Sizes.size24,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            (playerData.keys.length / 2).round(),
                            (index) => Padding(
                              padding: const EdgeInsets.all(Sizes.size2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    playerData.keys.elementAt(index),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                  Gaps.h12,
                                  Text(
                                    playerData.values.elementAt(index),
                                    style: TextStyle(
                                      color: index == 0 ||
                                              playerData.values
                                                  .elementAt(index)
                                                  .contains(",")
                                          ? Colors.white
                                          : PlayerListItem.getNumericColor(
                                              int.parse(
                                                isNumeric(playerData.values
                                                        .elementAt(index))
                                                    ? playerData.values
                                                        .elementAt(index)
                                                    : "0",
                                              ),
                                            ),
                                      fontSize: Sizes.size16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            playerData.keys.length -
                                (playerData.keys.length / 2).round() -
                                1,
                            (index) => Padding(
                              padding: const EdgeInsets.all(Sizes.size2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    playerData.keys.elementAt(
                                        (playerData.keys.length / 2).round() +
                                            index),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                  Gaps.h12,
                                  Text(
                                    playerData.values.elementAt(
                                        (playerData.keys.length / 2).round() +
                                            index),
                                    style: TextStyle(
                                      color: PlayerListItem.getNumericColor(
                                        int.parse(
                                          isNumeric(playerData.values.elementAt(
                                                  (playerData.keys.length / 2)
                                                          .round() +
                                                      index))
                                              ? playerData.values.elementAt(
                                                  (playerData.keys.length / 2)
                                                          .round() +
                                                      index)
                                              : "0",
                                        ),
                                      ),
                                      fontSize: Sizes.size16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

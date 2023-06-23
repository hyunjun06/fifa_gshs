import 'package:fifa_gshs/constants/gaps.dart';
import 'package:fifa_gshs/constants/sizes.dart';
import 'package:flutter/material.dart';

class PlayerListItem extends StatelessWidget {
  final String name, speed, position, overall, foot;

  const PlayerListItem({
    super.key,
    required this.speed,
    required this.position,
    required this.overall,
    required this.name,
    required this.foot,
  });

  static Color getPositionColor(String position) {
    switch (position) {
      case "LW":
      case "ST":
      case "RW":
      case "CF":
        return Colors.red;
      case "CAM":
      case "LM":
      case "CM":
      case "RM":
      case "CDM":
        return Colors.green;
      case "LWB":
      case "LB":
      case "CB":
      case "RB":
      case "RWB":
      case "SW":
        return Colors.blue;
      default:
        return Colors.yellow;
    }
  }

  static Color getNumericColor(int number) {
    if (number < 60) return const Color.fromARGB(255, 145, 149, 160);
    if (number < 70) return const Color.fromARGB(255, 97, 104, 114);
    if (number < 80) return const Color.fromARGB(255, 35, 45, 54);
    if (number < 90) return const Color.fromARGB(255, 72, 146, 207);
    if (number < 100) return const Color.fromARGB(255, 46, 92, 214);
    if (number < 110) return const Color.fromARGB(255, 105, 61, 245);
    if (number < 120) return const Color.fromARGB(255, 165, 68, 246);
    if (number < 130) return const Color.fromARGB(255, 191, 46, 187);
    if (number < 140) return const Color.fromARGB(255, 202, 43, 29);
    return const Color.fromARGB(255, 194, 157, 51);
  }

  //TODO: images
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.size80,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: Sizes.size48,
                  height: Sizes.size48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size24,
                    ),
                    color: Colors.white,
                  ),
                ),
                Gaps.h12,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          position,
                          style: TextStyle(
                            color: getPositionColor(position),
                          ),
                        ),
                        Gaps.h4,
                        Text(
                          overall,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "왼발",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Gaps.h4,
                        Text(
                          foot.split(',')[0],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Gaps.h4,
                        const Text(
                          "오른발",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Gaps.h4,
                        Text(
                          foot.split(',')[1],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 135,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Sizes.size32,
                    child: Center(
                      child: Text(
                        speed,
                        style: TextStyle(
                          color: getNumericColor(int.parse(speed)),
                          fontWeight: FontWeight.w900,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h24,
                  Row(children: [
                    Text(
                      position,
                      style: TextStyle(
                        color: getPositionColor(position),
                        fontWeight: FontWeight.w700,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.h4,
                    Text(
                      overall,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

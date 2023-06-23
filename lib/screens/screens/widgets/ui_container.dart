import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../constants/theme_colors.dart';

class UiContainer extends StatelessWidget {
  final String? title;
  final Widget child;

  const UiContainer({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.uiColor,
          borderRadius: BorderRadius.circular(Sizes.size4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size10),
          child: title == null
              ? child
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                        color: ThemeColors.primary,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v10,
                    child,
                  ],
                ),
        ),
      ),
    );
  }
}

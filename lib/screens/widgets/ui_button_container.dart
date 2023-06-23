import 'package:flutter/material.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../constants/theme_colors.dart';

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

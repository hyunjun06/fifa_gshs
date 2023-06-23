import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final double itemWidth;
  final List<Widget> children;

  const CustomGrid({
    required this.itemWidth,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final crossAxisCount = (constraints.maxWidth / itemWidth).floor();
        final availableWidth =
            constraints.maxWidth - (crossAxisCount * itemWidth);
        final padding = availableWidth / (crossAxisCount - 1);

        return Wrap(
          alignment: WrapAlignment.start,
          spacing: padding,
          runSpacing: padding,
          children: children.map((child) {
            return SizedBox(
              width: itemWidth,
              child: child,
            );
          }).toList(),
        );
      },
    );
  }
}

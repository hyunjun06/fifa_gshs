import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../states/search_conditions_state.dart';

class PlayerClass extends StatefulWidget {
  final String className;
  final bool isSelected;
  final void Function(SearchStateAction) dispatch;
  final int index;

  const PlayerClass({
    super.key,
    required this.className,
    required this.isSelected,
    required this.index,
    required this.dispatch,
  });

  @override
  State<PlayerClass> createState() => PlayerClassState();
}

class PlayerClassState extends State<PlayerClass> {
  bool _isSelected = true;

  @override
  void didUpdateWidget(covariant PlayerClass oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isSelected = widget.isSelected;
  }

  void toggleSelected() {
    widget.dispatch(SearchStateAction(
      type: SearchStateActions.toggleClass,
      payload: widget.index,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isSelected ? 1 : 0.5,
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: toggleSelected,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size4),
          child: Column(
            children: [
              Image.asset("assets/classes/${widget.className}.png",
                  width: Sizes.size36),
              Gaps.v8,
              Text(
                widget.className,
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: Sizes.size12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:fifa_gshs/states/search_conditions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';

class SearchConditionsScreen extends StatefulWidget {
  const SearchConditionsScreen({super.key});

  @override
  State<SearchConditionsScreen> createState() => _SearchConditionsScreenState();
}

class _SearchConditionsScreenState extends State<SearchConditionsScreen> {
  final _sortTypes1 = ["오버롤"], _sortTypes2 = ["높은순", "낮은순"];
  bool _isClassAllSelect = true;

  @override
  void initState() {
    super.initState();
  }

  void _onToggleClassAllSelect(bool? newValue) {
    setState(() {
      _isClassAllSelect = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (_, Store<SearchConditionsState> store) => Padding(
        padding: const EdgeInsets.all(Sizes.size10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UiContainer(
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(
                        left: Sizes.size12,
                        right: Sizes.size8,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: Sizes.size16,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: Sizes.size16 + Sizes.size2,
                    ),
                    hintText: "선수명을 입력하세요. (\",\"로 다중검색)",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                  ),
                ),
              ),
              Gaps.v16,
              UiContainer(
                title: "클래스",
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Sizes.size24,
                          height: Sizes.size24,
                          child: Checkbox(
                            value: _isClassAllSelect,
                            onChanged: _onToggleClassAllSelect,
                          ),
                        ),
                        const Text(
                          "전체",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v12,
                    CustomGrid(
                      itemWidth: Sizes.size48,
                      children: List.generate(
                        (store.state).classNames.length,
                        (index) => PlayerClass(
                          className: (store.state).classNames[index],
                          isSelected: (store.state).classValues[index],
                          store: store,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v16,
              UiContainer(
                title: "포지션",
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: Sizes.size24,
                          height: Sizes.size24,
                          child: Checkbox(
                            value: (store.state).positions["FW"],
                            onChanged: (bool? newValue) {
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "FW",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "LW",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "ST",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "RW",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "CF",
                                ),
                              );
                            },
                          ),
                        ),
                        Gaps.h8,
                        const Text(
                          "FW",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ]),
                      Gaps.v12,
                      Row(
                        children: [
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["LW"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "LW",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "LW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["ST"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "ST",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "ST",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["RW"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "RW",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "RW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["CF"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "CF",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "CF",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v12,
                      Row(children: [
                        SizedBox(
                          width: Sizes.size24,
                          height: Sizes.size24,
                          child: Checkbox(
                            value: (store.state).positions["MF"],
                            onChanged: (bool? newValue) {
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "MF",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "CAM",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "LM",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "CM",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "RM",
                                ),
                              );
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "CDM",
                                ),
                              );
                            },
                          ),
                        ),
                        Gaps.h8,
                        const Text(
                          "MF",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ]),
                      Gaps.v12,
                      Row(
                        children: [
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["CAM"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "CAM",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "CAM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["LM"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "LM",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "LM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["CM"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "CM",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "CM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["RM"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "RM",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "RM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["CDM"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "CDM",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "CDM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v12,
                      Row(
                        children: [
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["DF"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "DF",
                                  ),
                                );
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "LWB",
                                  ),
                                );
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "LB",
                                  ),
                                );
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "CB",
                                  ),
                                );
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "RB",
                                  ),
                                );
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "RWB",
                                  ),
                                );
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "SW",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "DF",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v12,
                      Row(
                        children: [
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["LWB"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "LWB",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "LWB",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["LB"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "LB",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "LB",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["CB"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "CB",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "CB",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["RB"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "RB",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "RB",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["RWB"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "RWB",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "RWB",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h8,
                          SizedBox(
                            width: Sizes.size24,
                            height: Sizes.size24,
                            child: Checkbox(
                              value: (store.state).positions["SW"],
                              onChanged: (bool? newValue) {
                                store.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.togglePosition,
                                    payload: "SW",
                                  ),
                                );
                              },
                            ),
                          ),
                          Gaps.h8,
                          const Text(
                            "SW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size16,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v12,
                      Row(children: [
                        SizedBox(
                          width: Sizes.size24,
                          height: Sizes.size24,
                          child: Checkbox(
                            value: (store.state).positions["GK"],
                            onChanged: (bool? newValue) {
                              store.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.togglePosition,
                                  payload: "GK",
                                ),
                              );
                            },
                          ),
                        ),
                        Gaps.h8,
                        const Text(
                          "GK",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ]),
                      Gaps.v4,
                    ],
                  ),
                ),
              ),
              Gaps.v12,
              UiContainer(
                title: "정렬",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: Sizes.size96,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _sortTypes1[(store.state).sortType1],
                          onChanged: (String? newValue) {
                            setState(() {
                              store.dispatch(SearchStateAction(
                                type: SearchStateActions.setSortType1,
                                payload: _sortTypes1.indexOf(newValue!),
                              ));
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: ThemeColors.primary,
                          ),
                          dropdownColor: ThemeColors.uiColor,
                          items: _sortTypes1
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Sizes.size96,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _sortTypes2[(store.state).sortType2],
                          onChanged: (String? newValue) {
                            store.dispatch(SearchStateAction(
                              type: SearchStateActions.setSortType2,
                              payload: _sortTypes2.indexOf(newValue!),
                            ));
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: ThemeColors.primary,
                          ),
                          dropdownColor: ThemeColors.uiColor,
                          items: _sortTypes2
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v24,
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerClass extends StatefulWidget {
  final String className;
  final bool isSelected;
  final Store<SearchConditionsState> store;

  const PlayerClass({
    super.key,
    required this.className,
    required this.isSelected,
    required this.store,
  });

  @override
  State<PlayerClass> createState() => PlayerClassState();
}

class PlayerClassState extends State<PlayerClass> {
  bool _isSelected = true;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void toggleSelected() {
    widget.store.dispatch(SearchStateAction(
      type: SearchStateActions.toggleClass,
      payload: widget.className,
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

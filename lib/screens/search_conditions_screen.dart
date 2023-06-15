import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';

class SearchConditionsScreen extends StatefulWidget {
  const SearchConditionsScreen({super.key});

  @override
  State<SearchConditionsScreen> createState() => _SearchConditionsScreenState();
}

class _SearchConditionsScreenState extends State<SearchConditionsScreen> {
  late final List<PlayerClass> _classes;
  final _classNames = [
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
    "GS40",
  ];
  final _classKeys = [
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
    GlobalKey<PlayerClassState>(),
  ];
  final _sortTypes = [
    "오버롤",
  ];
  final _sortTypes2 = [
    "높은순",
    "낮은순",
  ];

  String _sortType = "오버롤", _sortType2 = "높은순";
  bool _isClassAllSelect = true;
  bool _FW = false,
      _LW = false,
      _ST = false,
      _RW = false,
      _CF = false,
      _MF = false,
      _CAM = false,
      _LM = false,
      _CM = false,
      _RM = false,
      _CDM = false,
      _DF = false,
      _LB = false,
      _CB = false,
      _RB = false,
      _LWB = false,
      _RWB = false,
      _SW = false,
      _GK = false;

  @override
  void initState() {
    super.initState();
    _classes = List.generate(
      _classNames.length,
      (index) => PlayerClass(
        key: _classKeys[index],
        className: _classNames[index],
      ),
    );
  }

  void _onToggleClassAllSelect(bool? newValue) {
    setState(() {
      _isClassAllSelect = newValue!;

      for (GlobalKey<PlayerClassState> playerClassKey in _classKeys) {
        playerClassKey.currentState!.setSelected(_isClassAllSelect);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    children: _classes,
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
                          value: _FW,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _FW = newValue!;
                              _LW = newValue;
                              _ST = newValue;
                              _RW = newValue;
                              _CF = newValue;
                            });
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
                            value: _LW,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _LW = newValue!;
                              });
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
                            value: _ST,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _ST = newValue!;
                              });
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
                            value: _RW,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _RW = newValue!;
                              });
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
                            value: _CF,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _CF = newValue!;
                              });
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
                          value: _MF,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _MF = newValue!;
                              _CAM = newValue;
                              _LM = newValue;
                              _CM = newValue;
                              _RM = newValue;
                              _CDM = newValue;
                            });
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
                            value: _CAM,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _CAM = newValue!;
                              });
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
                            value: _LM,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _LM = newValue!;
                              });
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
                            value: _CM,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _CM = newValue!;
                              });
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
                            value: _RM,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _RM = newValue!;
                              });
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
                            value: _CDM,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _CDM = newValue!;
                              });
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
                            value: _DF,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _DF = newValue!;
                                _LWB = newValue;
                                _LB = newValue;
                                _CB = newValue;
                                _RB = newValue;
                                _RWB = newValue;
                                _SW = newValue;
                              });
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
                            value: _LWB,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _LWB = newValue!;
                              });
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
                            value: _LB,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _LB = newValue!;
                              });
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
                            value: _CB,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _CB = newValue!;
                              });
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
                            value: _RB,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _RB = newValue!;
                              });
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
                            value: _RWB,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _RWB = newValue!;
                              });
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
                            value: _SW,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _SW = newValue!;
                              });
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
                          value: _GK,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _GK = newValue!;
                            });
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
                        value: _sortType,
                        onChanged: (String? newValue) {
                          setState(() {
                            _sortType = newValue!;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: ThemeColors.primary,
                        ),
                        dropdownColor: ThemeColors.uiColor,
                        items: _sortTypes
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
                        value: _sortType2,
                        onChanged: (String? newValue) {
                          setState(() {
                            _sortType2 = newValue!;
                          });
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
            )
          ],
        ),
      ),
    );
  }
}

class PlayerClass extends StatefulWidget {
  final String className;

  const PlayerClass({
    super.key,
    required this.className,
  });

  @override
  State<PlayerClass> createState() => PlayerClassState();
}

class PlayerClassState extends State<PlayerClass> {
  bool _isSelected = true;

  void toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void setSelected(bool newValue) {
    setState(() {
      _isSelected = newValue;
    });
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

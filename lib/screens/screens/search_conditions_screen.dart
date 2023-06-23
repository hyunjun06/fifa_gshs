import 'package:fifa_gshs/constants/theme_colors.dart';
import 'package:fifa_gshs/screens/screens/widgets/custom_grid.dart';
import 'package:fifa_gshs/screens/screens/widgets/player_class.dart';
import 'package:fifa_gshs/screens/screens/widgets/ui_container.dart';
import 'package:fifa_gshs/states/view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../states/search_conditions_state.dart';

class SearchConditionsScreen extends StatefulWidget {
  const SearchConditionsScreen({super.key});

  @override
  State<SearchConditionsScreen> createState() => _SearchConditionsScreenState();
}

class _SearchConditionsScreenState extends State<SearchConditionsScreen> {
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
    return Padding(
      padding: const EdgeInsets.all(Sizes.size10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            StoreConnector<SearchConditionsState,
                void Function(SearchStateAction)>(
              rebuildOnChange: false,
              converter: (store) => store.dispatch,
              builder: (_, dispatch) => UiContainer(
                child: TextField(
                  onChanged: (value) {
                    dispatch(
                      SearchStateAction(
                        type: SearchStateActions.setNameFilters,
                        payload: value.split(",").map((e) => e.trim()).toList(),
                      ),
                    );
                  },
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
            ),
            Gaps.v16,
            StoreConnector<SearchConditionsState, ClassViewModel>(
              distinct: true,
              rebuildOnChange: true,
              converter: (store) => ClassViewModel(
                classNames: store.state.classNames,
                classValues: store.state.classValues,
                dispatch: store.dispatch,
              ),
              builder: (_, viewModel) => UiContainer(
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
                        viewModel.classNames.length,
                        (index) {
                          return PlayerClass(
                            className: viewModel.classNames[index],
                            isSelected: viewModel.classValues[index],
                            dispatch: viewModel.dispatch,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v16,
            StoreConnector<SearchConditionsState, PositionViewModel>(
              distinct: true,
              converter: (store) => PositionViewModel(
                positions: store.state.positions,
                dispatch: store.dispatch,
              ),
              builder: (_, viewModel) => UiContainer(
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
                            value: viewModel.positions["FW"],
                            onChanged: (bool? newValue) {
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "FW",
                                    value: newValue!,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "LW",
                                    value: newValue,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "ST",
                                    value: newValue,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "RW",
                                    value: newValue,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "CF",
                                    value: newValue,
                                  ),
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
                              value: viewModel.positions["LW"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "LW",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["ST"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "ST",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["RW"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "RW",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["CF"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "CF",
                                      value: newValue!,
                                    ),
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
                            value: viewModel.positions["MF"],
                            onChanged: (bool? newValue) {
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "MF",
                                    value: newValue!,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "CAM",
                                    value: newValue,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "LM",
                                    value: newValue,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "CM",
                                    value: newValue,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "RM",
                                    value: newValue,
                                  ),
                                ),
                              );
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "CDM",
                                    value: newValue,
                                  ),
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
                              value: viewModel.positions["CAM"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "CAM",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["LM"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "LM",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["CM"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "CM",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["RM"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "RM",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["CDM"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "CDM",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["DF"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "DF",
                                      value: newValue!,
                                    ),
                                  ),
                                );
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "LWB",
                                      value: newValue,
                                    ),
                                  ),
                                );
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "LB",
                                      value: newValue,
                                    ),
                                  ),
                                );
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "CB",
                                      value: newValue,
                                    ),
                                  ),
                                );
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "RB",
                                      value: newValue,
                                    ),
                                  ),
                                );
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "RWB",
                                      value: newValue,
                                    ),
                                  ),
                                );
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "SW",
                                      value: newValue,
                                    ),
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
                              value: viewModel.positions["LWB"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "LWB",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["LB"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "LB",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["CB"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "CB",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["RB"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "RB",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["RWB"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "RWB",
                                      value: newValue!,
                                    ),
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
                              value: viewModel.positions["SW"],
                              onChanged: (bool? newValue) {
                                viewModel.dispatch(
                                  SearchStateAction(
                                    type: SearchStateActions.setPositionValue,
                                    payload: PositionPayload(
                                      position: "SW",
                                      value: newValue!,
                                    ),
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
                            value: viewModel.positions["GK"],
                            onChanged: (bool? newValue) {
                              viewModel.dispatch(
                                SearchStateAction(
                                  type: SearchStateActions.setPositionValue,
                                  payload: PositionPayload(
                                    position: "GK",
                                    value: newValue!,
                                  ),
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
            ),
            Gaps.v12,
            StoreConnector<SearchConditionsState, SortTypeViewModel>(
              distinct: true,
              converter: (store) => SortTypeViewModel(
                sortType1: store.state.sortType1,
                sortType2: store.state.sortType2,
                dispatch: store.dispatch,
              ),
              builder: (_, viewModel) => UiContainer(
                title: "정렬",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: Sizes.size96,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: SearchConditionsState
                              .sortTypes1[viewModel.sortType1],
                          onChanged: (String? newValue) {
                            setState(() {
                              viewModel.dispatch(SearchStateAction(
                                type: SearchStateActions.setSortType1,
                                payload: SearchConditionsState.sortTypes1
                                    .indexOf(newValue!),
                              ));
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: ThemeColors.primary,
                          ),
                          dropdownColor: ThemeColors.uiColor,
                          items: SearchConditionsState.sortTypes1
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
                          value: SearchConditionsState
                              .sortTypes2[viewModel.sortType2],
                          onChanged: (String? newValue) {
                            viewModel.dispatch(SearchStateAction(
                              type: SearchStateActions.setSortType2,
                              payload: SearchConditionsState.sortTypes2
                                  .indexOf(newValue!),
                            ));
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: ThemeColors.primary,
                          ),
                          dropdownColor: ThemeColors.uiColor,
                          items: SearchConditionsState.sortTypes2
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
            ),
            Gaps.v24,
          ],
        ),
      ),
    );
  }
}

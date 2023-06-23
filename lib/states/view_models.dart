import 'package:fifa_gshs/states/search_conditions_state.dart';
import 'package:flutter/foundation.dart';

class ClassViewModel {
  final List<String> classNames;
  final List<bool> classValues;
  final void Function(SearchStateAction) dispatch;

  ClassViewModel({
    required this.classNames,
    required this.classValues,
    required this.dispatch,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassViewModel &&
        listEquals(other.classNames, classNames) &&
        listEquals(other.classValues, classValues);
  }

  @override
  int get hashCode => classNames.hashCode ^ classValues.hashCode;
}

class PositionViewModel {
  final Map<String, bool> positions;
  final void Function(SearchStateAction) dispatch;

  PositionViewModel({
    required this.positions,
    required this.dispatch,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PositionViewModel && mapEquals(other.positions, positions);
  }

  @override
  int get hashCode => positions.hashCode;
}

class SortTypeViewModel {
  final int sortType1;
  final int sortType2;
  final void Function(SearchStateAction) dispatch;

  SortTypeViewModel({
    required this.sortType1,
    required this.sortType2,
    required this.dispatch,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SortTypeViewModel &&
        other.sortType1 == sortType1 &&
        other.sortType2 == sortType2;
  }

  @override
  int get hashCode => sortType1.hashCode ^ sortType2.hashCode;
}

class PositionPayload {
  String position;
  bool value;

  PositionPayload({
    required this.position,
    required this.value,
  });
}

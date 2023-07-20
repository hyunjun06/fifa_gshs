class SearchConditionsState {
  static final sortTypes1 = ["오버롤"], sortTypes2 = ["높은순", "낮은순"];
  final Map<String, bool> positions;
  final List<String> classNames = [
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

  late final List<bool> classValues;
  final int sortType1, sortType2;

  final List<String> nameFilters;

  SearchConditionsState.withInitialClassValues({
    required this.positions,
    required this.sortType1,
    required this.sortType2,
    required this.nameFilters,
  }) {
    List<bool> initialClassValues = [];
    for (int i = 0; i < classNames.length; i++) {
      initialClassValues.add(true);
    }

    classValues = initialClassValues;
  }

  SearchConditionsState({
    required this.positions,
    required this.sortType1,
    required this.sortType2,
    required this.classValues,
    required this.nameFilters,
  });

  factory SearchConditionsState.initial() =>
      SearchConditionsState.withInitialClassValues(
          positions: {
            "FW": true,
            "LW": true,
            "ST": true,
            "RW": true,
            "CF": true,
            "MF": true,
            "CAM": true,
            "LM": true,
            "CM": true,
            "RM": true,
            "CDM": true,
            "DF": true,
            "LB": true,
            "CB": true,
            "RB": true,
            "LWB": true,
            "RWB": true,
            "SW": true,
            "GK": true,
          },
          sortType1: 0,
          sortType2: 0,
          nameFilters: []);
}

enum SearchStateActions {
  setPositionValue,
  setClassValue,
  setSortType1,
  setSortType2,
  setNameFilters,
}

class SearchStateAction {
  final SearchStateActions type;
  final dynamic payload;

  SearchStateAction({required this.type, this.payload});
}

SearchConditionsState searchConditionsReducer(
    SearchConditionsState previousState, action) {
  switch (action.type) {
    case SearchStateActions.setPositionValue:
      return SearchConditionsState(
        positions: {
          ...previousState.positions,
          action.payload.position: action.payload.value,
        },
        sortType1: previousState.sortType1,
        sortType2: previousState.sortType2,
        classValues: previousState.classValues,
        nameFilters: previousState.nameFilters,
      );
    case SearchStateActions.setClassValue:
      List<bool> newClassValues = List.from(previousState.classValues);
      newClassValues[action.payload["index"]] = action.payload["value"];
      return SearchConditionsState(
        positions: previousState.positions,
        sortType1: previousState.sortType1,
        sortType2: previousState.sortType2,
        classValues: newClassValues,
        nameFilters: previousState.nameFilters,
      );
    case SearchStateActions.setSortType1:
      return SearchConditionsState(
        positions: previousState.positions,
        sortType1: action.payload,
        sortType2: previousState.sortType2,
        classValues: previousState.classValues,
        nameFilters: previousState.nameFilters,
      );
    case SearchStateActions.setSortType2:
      return SearchConditionsState(
        positions: previousState.positions,
        sortType1: previousState.sortType1,
        sortType2: action.payload,
        classValues: previousState.classValues,
        nameFilters: previousState.nameFilters,
      );
    case SearchStateActions.setNameFilters:
      return SearchConditionsState(
        positions: previousState.positions,
        sortType1: previousState.sortType1,
        sortType2: previousState.sortType2,
        classValues: previousState.classValues,
        nameFilters: action.payload,
      );
    default:
      throw Exception("Invalid action type for SearchConditionsState");
  }
}

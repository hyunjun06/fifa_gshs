class SearchConditionsState {
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

  SearchConditionsState.withInitialClassValues({
    required this.positions,
    required this.sortType1,
    required this.sortType2,
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
  });

  factory SearchConditionsState.initial() =>
      SearchConditionsState.withInitialClassValues(positions: {
        "FW": false,
        "LW": false,
        "ST": false,
        "RW": false,
        "CF": false,
        "MF": false,
        "CAM": false,
        "LM": false,
        "CM": false,
        "RM": false,
        "CDM": false,
        "DF": false,
        "LB": false,
        "CB": false,
        "RB": false,
        "LWB": false,
        "RWB": false,
        "SW": false,
        "GK": false,
      }, sortType1: 0, sortType2: 0);
}

enum SearchStateActions {
  togglePosition,
  toggleClass,
  setSortType1,
  setSortType2,
}

class SearchStateAction {
  final SearchStateActions type;
  final dynamic payload;

  SearchStateAction({required this.type, this.payload});
}

SearchConditionsState searchConditionsReducer(
    SearchConditionsState previousState, action) {
  switch (action.type) {
    case SearchStateActions.togglePosition:
      return SearchConditionsState(
        positions: {
          ...previousState.positions,
          action.payload: !previousState.positions[action.payload]!,
        },
        sortType1: previousState.sortType1,
        sortType2: previousState.sortType2,
        classValues: previousState.classValues,
      );
    case SearchStateActions.toggleClass:
      List<bool> newClassValues = previousState.classValues;
      newClassValues[action.payload] = !newClassValues[action.payload];
      return SearchConditionsState(
        positions: previousState.positions,
        sortType1: previousState.sortType1,
        sortType2: previousState.sortType2,
        classValues: newClassValues,
      );
    case SearchStateActions.setSortType1:
      return SearchConditionsState(
        positions: previousState.positions,
        sortType1: action.payload,
        sortType2: previousState.sortType2,
        classValues: previousState.classValues,
      );
    case SearchStateActions.setSortType2:
      return SearchConditionsState(
        positions: previousState.positions,
        sortType1: previousState.sortType1,
        sortType2: action.payload,
        classValues: previousState.classValues,
      );
    default:
      throw Exception("Invalid action type for SearchConditionsState");
  }
}

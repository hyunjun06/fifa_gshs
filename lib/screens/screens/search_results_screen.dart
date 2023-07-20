import 'dart:convert';

import 'package:fifa_gshs/screens/screens/screens/player_details_screen.dart';
import 'package:fifa_gshs/screens/screens/widgets/player_list_item.dart';
import 'package:fifa_gshs/states/search_conditions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  Map<String, dynamic>? playerData;

  //TODO: server
  Future<void> readJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/player_data.json");
    final data = await json.decode(response);
    setState(() {
      playerData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  void didUpdateWidget(covariant SearchResultsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<SearchConditionsState>(
      builder: (_, store) => Column(
        children: [
          playerData == null
              ? const Text("loading")
              : PlayerList(
                  playerData: playerData!,
                  positionFilter: store.state.positions,
                  sortType1:
                      SearchConditionsState.sortTypes1[store.state.sortType1],
                  sortType2: store.state.sortType2,
                  nameFilters: store.state.nameFilters,
                ),
        ],
      ),
    );
  }
}

class PlayerList extends StatefulWidget {
  final Map<String, dynamic> playerData;
  final Map<String, bool> positionFilter;
  final String sortType1;
  final int sortType2;
  final List<String> nameFilters;

  const PlayerList({
    super.key,
    required this.playerData,
    required this.positionFilter,
    required this.sortType1,
    required this.sortType2,
    required this.nameFilters,
  });

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List<dynamic> _playerData = [];

  @override
  void initState() {
    super.initState();
    _playerData = [];
    widget.playerData.forEach((key, value) {
      if (value["오버롤"].contains("Unnamed")) return;
      if (widget.positionFilter[value["포지션"]] == false) return;
      if (widget.nameFilters.isNotEmpty) {
        bool isFiltered = true;
        for (String filter in widget.nameFilters) {
          if (key.contains(filter)) isFiltered = false;
        }
        if (isFiltered) return;
      }

      value["name"] = key;
      _playerData.add(value);
    });

    _playerData.sort((a, b) {
      dynamic aValue = a[widget.sortType1];
      aValue = double.tryParse(aValue) == null ? aValue : double.parse(aValue);
      dynamic bValue = b[widget.sortType1];
      bValue = double.tryParse(bValue) == null ? bValue : double.parse(bValue);

      if (widget.sortType2 == 0) {
        return bValue.compareTo(aValue);
      } else {
        return aValue.compareTo(bValue);
      }
    });
  }

  @override
  void didUpdateWidget(covariant PlayerList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _playerData = [];
    widget.playerData.forEach((key, value) {
      if (value["오버롤"].contains("Unnamed")) return;
      if (widget.positionFilter[value["포지션"]] == false) return;
      if (widget.nameFilters.isNotEmpty) {
        bool isFiltered = true;
        for (String filter in widget.nameFilters) {
          if (key.contains(filter)) isFiltered = false;
        }
        if (isFiltered) return;
      }

      value["name"] = key;
      _playerData.add(value);
    });
    _playerData.sort((a, b) {
      dynamic aValue = a[widget.sortType1];
      aValue = double.tryParse(aValue) == null ? aValue : double.parse(aValue);
      dynamic bValue = b[widget.sortType1];
      bValue = double.tryParse(bValue) == null ? bValue : double.parse(bValue);

      if (widget.sortType2 == 0) {
        return bValue.compareTo(aValue);
      } else {
        return aValue.compareTo(bValue);
      }
    });
  }

  //TODO: loading
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _playerData.isEmpty
          ? const Center(
              child: Text(
                "검색 결과 없음",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _playerData.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerDetailsScreen(
                      playerData: _playerData[index],
                    ),
                  ),
                ),
                child: PlayerListItem(
                  name: _playerData[index]["name"],
                  speed: _playerData[index]["속력"],
                  position: _playerData[index]["포지션"],
                  overall: _playerData[index]["오버롤"],
                  foot: _playerData[index]["왼발 오른발"],
                ),
              ),
            ),
    );
  }
}

import 'package:fifa_gshs/states/search_conditions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (store) => store.state,
      builder: (_, state) => Column(
        children: [
          Text("${(state as SearchConditionsState).sortType1}"),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                "title $index",
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "subtitle $index",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

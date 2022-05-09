import 'package:flutter/material.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/model/list_item.dart';

class ListItemsSearchDelegate extends SearchDelegate {
  final List<ListItem> flatList;

  ListItemsSearchDelegate(this.flatList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Constants.clearIcon,
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Constants.backIcon,
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    final List<ListItem> searchResults = flatList
        .where((listItem) =>
            listItem.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      padding: Constants.columnPadding,
      shrinkWrap: true,
      children: searchResults.map((element) {
        return element.returnChildType(false);
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}

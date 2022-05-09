import 'package:flutter/material.dart';
import 'package:fluttertest/components/tree_child.dart';
import 'package:fluttertest/model/list_item.dart';

class Tree extends StatelessWidget {
  const Tree({
    Key? key,
    required this.listItems,
  }) : super(key: key);

  final List<ListItem> listItems;

  @override
  Widget build(BuildContext context) {
    final childList = listItems.map((element) {
      return TreeChild(listItem: element);
    }).toList();

    return ListView.builder(
      itemCount: childList.length,
      itemBuilder: (context, index) {
        return childList.elementAt(index);
      },
    );
  }
}

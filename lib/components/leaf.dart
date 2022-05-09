import 'package:flutter/material.dart';
import 'package:fluttertest/model/list_item.dart';

class Leaf extends StatelessWidget {
  final ListItem element;
  final bool isExpanded;

  const Leaf({
    required this.element,
    required this.isExpanded,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: element.padding(),
      child: ListTile(
        title: Text(element.name!),
        enableFeedback: true,
        tileColor: element.color(),
        trailing: element.icon(isExpanded),
      ),
    );
  }
}

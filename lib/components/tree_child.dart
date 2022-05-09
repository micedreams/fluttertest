import 'package:flutter/material.dart';
import 'package:fluttertest/components/leaf.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/model/list_item.dart';

class TreeChild extends StatefulWidget {
  final ListItem listItem;

  const TreeChild({
    required this.listItem,
    Key? key,
  }) : super(key: key);

  @override
  TreeChildState createState() => TreeChildState();
}

class TreeChildState extends State<TreeChild> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Leaf(
            element: widget.listItem,
            isExpanded: isExpanded,
          ),
        ),
        isExpanded
            ? ListView(
                padding: Constants.columnPadding,
                shrinkWrap: true,
                children: widget.listItem.children!.map((element) {
                  return element.returnChildType(isExpanded);
                }).toList(),
              )
            : const Offstage(),
      ],
    );
  }
}

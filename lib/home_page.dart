import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/model/list_item.dart';
import 'package:tree_view/tree_view.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListItem> listItems = [];

  Future<void> fetchData() async {
    final response =
        await DefaultAssetBundle.of(context).loadString("assets/home.json");
    var data = json.decode(response);

    List<ListItem> allListItems =
        data.map((x) => ListItem.fromJson(x)).toList().cast<ListItem>();
    setState(() {
      listItems = allListItems;
    });
  }

  List<Widget> _getChildList(List<ListItem> childListItems) {
    return childListItems.map((element) {
      if (element.children!.isNotEmpty) {
        return Container(
          margin: const EdgeInsets.only(left: 8),
          child: TreeViewChild(
            parent: _getListItemWidget(listItem: element),
            children: _getChildList(element.children!),
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(left: 4.0),
        child: _getListItemWidget(listItem: element),
      );
    }).toList();
  }

  Widget _getListItemWidget({required ListItem listItem}) {
    return Text(
      listItem.name!,
      style: TextStyle(
        fontWeight: listItem.children!.isEmpty ? null : FontWeight.bold,
        color: listItem.hasAccess! ? Colors.red : Colors.black,
      ),
    );
  }

  @override
  initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var treeView = TreeView(
      children: _getChildList(listItems),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: treeView,
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/end_point.dart';
import 'package:fluttertest/components/loading_wheel.dart';
import 'package:fluttertest/model/list_item.dart';
import 'package:fluttertest/components/tree.dart';
import 'package:fluttertest/screens/list_items_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListItem> listItems = [];
  List<ListItem> flatList = [];

  Future<void> fetchData() async {
    List<ListItem> allListItems = await EndPoint.getAllListItems(context);
    List<ListItem> flatItems = flatenedList(allListItems);

    setState(() {
      flatList = flatItems;
      listItems = allListItems;
    });
  }

  @override
  initState() {
    super.initState();
    fetchData();
  }

  List<ListItem> flatenedList(List<ListItem> list) {
    final List<ListItem> flat = [];
    if (list.isNotEmpty) {
      flat.addAll(list);
      for (int i = 0; i < list.length; i++) {
        if (list[i].children!.isNotEmpty) {
          flat.addAll(flatenedList(list[i].children!));
        }
      }
    }
    return flat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: ListItemsSearchDelegate(flatList),
              );
            },
            icon: Constants.searchIcon,
          ),
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: Constants.logoutIcon,
          ),
        ],
      ),
      body:
          listItems.isEmpty ? const LoadingWheel() : Tree(listItems: listItems),
    );
  }
}

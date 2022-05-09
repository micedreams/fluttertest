import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/end_point.dart';
import 'package:fluttertest/components/loading_wheel.dart';
import 'package:fluttertest/model/list_item.dart';
import 'package:fluttertest/components/tree.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListItem> listItems = [];

  Future<void> fetchData() async {
    List<ListItem> allListItems = await EndPoint.getAllListItems(context);
    setState(() {
      listItems = allListItems;
    });
  }

  @override
  initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              
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


import 'package:flutter/material.dart';
import 'package:fluttertest/model/list_item.dart';
import 'dart:convert';

class EndPoint {
  static dynamic getAllListItems(context) async {
    final response =
        await DefaultAssetBundle.of(context).loadString("assets/home.json");
    var data = json.decode(response);

    List<ListItem> allListItems =
        data.map((x) => ListItem.fromJson(x)).toList().cast<ListItem>();

    return allListItems;
  }
}

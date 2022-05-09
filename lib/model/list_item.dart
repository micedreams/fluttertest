import 'package:flutter/material.dart';
import 'package:fluttertest/components/leaf.dart';
import 'package:fluttertest/components/tree_child.dart';
import 'package:fluttertest/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'list_item.freezed.dart';
part 'list_item.g.dart';

@freezed
class ListItem with _$ListItem {
  const ListItem._();
  const factory ListItem({
    String? id,
    String? parentId,
    List<ListItem>? children,
    String? name,
    num? level,
    bool? hasAccess,
  }) = _ListItem;

  factory ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);

  Color? color() {
    return ListItemColor.new(this).color();
  }

  EdgeInsets padding() {
    return ListItemPadding.new(this).padding();
  }

  Icon? icon(bool isExpanded) {
    return ListItemIcon.new(this).icon(isExpanded);
  }

  Widget returnChildType(bool isExpanded) {
    return ListItemChildType.new(this).returnChildType(isExpanded);
  }
}

class ListItemChildType {
  final ListItem listItem;
  ListItemChildType(this.listItem);

  Widget returnChildType(bool isExpanded) {
    if (listItem.children!.isNotEmpty) {
      return TreeChild(listItem: listItem);
    }
    return Leaf(
      element: listItem,
      isExpanded: isExpanded,
    );
  }
}

class ListItemIcon {
  final ListItem listItem;
  ListItemIcon(this.listItem);

  Icon? icon(bool isExpanded) {
    if (listItem.children!.isEmpty) {
      return null;
    }
    return isExpanded ? Constants.downArrowIcon : Constants.sideArrowIcon;
  }
}

class ListItemColor {
  final ListItem listItem;
  ListItemColor(this.listItem);

  Color? color() {
    return listItem.hasAccess!
        ? Constants.primaryColor
        : listItem.children!.isEmpty
            ? Constants.thirdColour
            : Constants.seconderyColor;
  }
}

class ListItemPadding {
  final ListItem listItem;
  ListItemPadding(this.listItem);

  EdgeInsets padding() {
    return 0 < listItem.level!
        ? Constants.firstElementPadding
        : Constants.otherElementsPadding;
  }
}

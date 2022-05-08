// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListItem _$$_ListItemFromJson(Map<String, dynamic> json) => _$_ListItem(
      id: json['id'] as String?,
      parentId: json['parentId'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => ListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      level: json['level'] as int?,
      hasAccess: json['hasAccess'] as bool?,
    );

Map<String, dynamic> _$$_ListItemToJson(_$_ListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'children': instance.children,
      'name': instance.name,
      'level': instance.level,
      'hasAccess': instance.hasAccess,
    };

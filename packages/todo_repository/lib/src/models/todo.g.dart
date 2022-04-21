// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoCheckItem _$TodoCheckItemFromJson(Map<String, dynamic> json) =>
    TodoCheckItem(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$TodoCheckItemToJson(TodoCheckItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
    };

Todo _$TodoFromJson(json) => Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
      checkList: (json['checkList'] as List<dynamic>)
          .map((e) => TodoCheckItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'checkList': instance.checkList
          .map((checkListItem) => _$TodoCheckItemToJson(checkListItem))
          .toList(),
    };

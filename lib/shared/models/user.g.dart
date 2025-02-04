// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      room: json['room'] as String?,
      role: json['role'] as String?,
      team: json['team'] as String?,
      isCreator: json['isCreator'] as bool?,
      isGameFinished: json['isGameFinished'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'room': instance.room,
      'role': instance.role,
      'team': instance.team,
      'isCreator': instance.isCreator,
      'isGameFinished': instance.isGameFinished,
    };

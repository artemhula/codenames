// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      cardset: (json['cardset'] as List<dynamic>?)
          ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String,
      creator: json['creator'] as String,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      usersInRoom: (json['usersInRoom'] as num).toInt(),
      isGameStarted: json['isGameStarted'] as bool,
      language: json['language'] as String,
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'cardset': instance.cardset,
      'id': instance.id,
      'name': instance.name,
      'creator': instance.creator,
      'users': instance.users,
      'usersInRoom': instance.usersInRoom,
      'isGameStarted': instance.isGameStarted,
      'language': instance.language,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      word: json['word'] as String,
      teamName: json['teamName'] as String,
      isClicked: json['isClicked'] as bool,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'word': instance.word,
      'teamName': instance.teamName,
      'isClicked': instance.isClicked,
    };

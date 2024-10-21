import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class CardModel extends Equatable {
  const CardModel(
      {required this.word, required this.teamName, required this.isClicked});

  final String word;
  final String teamName;
  final bool isClicked;

  Color getColor() {
    switch (teamName) {
      case 'black':
        return Colors.black;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);

  @override
  List<Object?> get props => [word, teamName, isClicked];
}
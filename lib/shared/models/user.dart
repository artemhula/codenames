import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.room,
    required this.role,
    required this.team,
    required this.isCreator,
    required this.isGameFinished,
  });

  final String id;
  final String name;
  final String? room;
  final String? role;
  final String? team;
  final bool? isCreator;
  final bool? isGameFinished;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, name, room, role, team, isCreator, isGameFinished];
}

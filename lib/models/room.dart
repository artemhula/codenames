import 'package:codenames/models/card.dart';
import 'package:codenames/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class RoomModel extends Equatable {
  const RoomModel({
    required this.cardset,
    required this.id,
    required this.name,
    // required this.isGameStarted,
    required this.users,
    required this.usersInRoom,
  });

  final List<CardModel>? cardset;
  final String id;
  final String name;
  // final bool isGameStarted;
  final List<UserModel>? users;
  final int usersInRoom;

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);

  List<UserModel> getUsersByTeam(String? team) =>
      users!.where((user) => user.team == team).toList();

  UserModel getTeamCapitan(String team, List<UserModel> users) =>
      users.where((user) => user.team == team && user.role == 'captain').first;

  @override
  List<Object?> get props => [cardset, id, name, users, usersInRoom];
}

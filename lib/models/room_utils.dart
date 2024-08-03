import 'package:codenames/models/user.dart';

class RoomUtils {
  List<UserModel> getUsersFromTeam(String? team, List<UserModel> users) =>
      users.where((user) => user.team == team).toList();

  UserModel getTeamCapitan(String team, List<UserModel> users) =>
      users.where((user) => user.team == team && user.role == 'captain').first;
}

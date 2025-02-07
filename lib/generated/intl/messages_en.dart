// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(usersInRoom) => "Players: ${usersInRoom}";

  static String m1(dict) => "Dictionary: ${dict}";

  static String m2(roomName) => "Name: ${roomName}";

  static String m3(password) => "Password: ${password}";

  static String m4(playersCount, language, isStarted) =>
      "Players: ${playersCount} | Language: ${language}${isStarted}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "PlayersDDN": m0,
        "appLanguage": MessageLookupByLibrary.simpleMessage("App language"),
        "backToMainScreen":
            MessageLookupByLibrary.simpleMessage("Back to the main screen"),
        "becomeACaptain":
            MessageLookupByLibrary.simpleMessage("Become a captain"),
        "becomeAPlayer":
            MessageLookupByLibrary.simpleMessage("Become a player"),
        "blue": MessageLookupByLibrary.simpleMessage("Blue"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "change": MessageLookupByLibrary.simpleMessage("Change"),
        "checkTheDataDD":
            MessageLookupByLibrary.simpleMessage("Check the data:"),
        "chooseGameLanguageDD":
            MessageLookupByLibrary.simpleMessage("Select the game language:"),
        "createARoom": MessageLookupByLibrary.simpleMessage("Create a room"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "dictionaryN": m1,
        "enter": MessageLookupByLibrary.simpleMessage("Enter"),
        "enterNickname":
            MessageLookupByLibrary.simpleMessage("Enter your nickname"),
        "enterRoomNameDD":
            MessageLookupByLibrary.simpleMessage("Enter the name of the room:"),
        "enterRoomPassword": MessageLookupByLibrary.simpleMessage(
            "Enter the password for the room:"),
        "gameOver": MessageLookupByLibrary.simpleMessage("Game over!"),
        "gameStarted":
            MessageLookupByLibrary.simpleMessage(" | Game is started"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello!👋"),
        "join": MessageLookupByLibrary.simpleMessage("Join"),
        "leave": MessageLookupByLibrary.simpleMessage("Leave"),
        "leaveRoomQuestion": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to leave the room?"),
        "nameN": m2,
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "nicknameDD": MessageLookupByLibrary.simpleMessage("Nickname"),
        "noRooms":
            MessageLookupByLibrary.simpleMessage("No rooms. Create one!"),
        "noTeam": MessageLookupByLibrary.simpleMessage("No team"),
        "passwordIsIncorrect":
            MessageLookupByLibrary.simpleMessage("Password is incorrect"),
        "passwordNNN": m3,
        "playersDD": MessageLookupByLibrary.simpleMessage("Players:"),
        "pleaseEnterHallName": MessageLookupByLibrary.simpleMessage(
            "Please enter the name of the hall"),
        "red": MessageLookupByLibrary.simpleMessage("Red"),
        "roomInfo": m4,
        "score": MessageLookupByLibrary.simpleMessage("Score"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "sound": MessageLookupByLibrary.simpleMessage("Sound"),
        "startTheGame": MessageLookupByLibrary.simpleMessage("Start game"),
        "teamWon": MessageLookupByLibrary.simpleMessage(" team won"),
        "teams": MessageLookupByLibrary.simpleMessage("Teams"),
        "theGameIsAlreadyStarted":
            MessageLookupByLibrary.simpleMessage("The game is already started"),
        "vibration": MessageLookupByLibrary.simpleMessage("Vibration"),
        "youAreInTheBlueTeam":
            MessageLookupByLibrary.simpleMessage("You are in the blue team"),
        "youAreInTheRedTeam":
            MessageLookupByLibrary.simpleMessage("You are in the red team")
      };
}

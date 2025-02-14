// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
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
  String get localeName => 'uk';

  static String m0(usersInRoom) => "Гравців: ${usersInRoom}";

  static String m1(dict) => "Словник: ${dict}";

  static String m2(roomName) => "Назва: ${roomName}";

  static String m3(password) => "Пароль: ${password}";

  static String m4(playersCount, language, isStarted) =>
      "Гравців: ${playersCount} | Мова: ${language}${isStarted}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "PlayersDDN": m0,
        "appLanguage": MessageLookupByLibrary.simpleMessage("Мова застосунку"),
        "backToMainScreen":
            MessageLookupByLibrary.simpleMessage("До головного екрану"),
        "becomeACaptain":
            MessageLookupByLibrary.simpleMessage("Стати капітаном"),
        "becomeAPlayer": MessageLookupByLibrary.simpleMessage("Стати гравцем"),
        "blue": MessageLookupByLibrary.simpleMessage("Синя"),
        "cancel": MessageLookupByLibrary.simpleMessage("Ні"),
        "change": MessageLookupByLibrary.simpleMessage("Змінити"),
        "checkTheDataDD":
            MessageLookupByLibrary.simpleMessage("Перевірте дані:"),
        "chooseGameLanguageDD":
            MessageLookupByLibrary.simpleMessage("Оберіть мову гри:"),
        "createARoom": MessageLookupByLibrary.simpleMessage("Створити кімнату"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Темна тема"),
        "dictionaryN": m1,
        "enter": MessageLookupByLibrary.simpleMessage("Увійти"),
        "enterNickname":
            MessageLookupByLibrary.simpleMessage("Введіть нікнейм"),
        "enterRoomNameDD":
            MessageLookupByLibrary.simpleMessage("Введіть назву зали:"),
        "enterRoomPassword":
            MessageLookupByLibrary.simpleMessage("Введіть пароль для зали:"),
        "gameOver": MessageLookupByLibrary.simpleMessage("Гра закінчилась!"),
        "gameStarted":
            MessageLookupByLibrary.simpleMessage(" | Гра вже почалась"),
        "hello": MessageLookupByLibrary.simpleMessage("Привіт!👋"),
        "join": MessageLookupByLibrary.simpleMessage("Приєднатися"),
        "leave": MessageLookupByLibrary.simpleMessage("Покинути"),
        "leaveRoomQuestion": MessageLookupByLibrary.simpleMessage(
            "Ви впевнені, що хочете покинути кімнату?"),
        "nameN": m2,
        "next": MessageLookupByLibrary.simpleMessage("Далі"),
        "nicknameDD": MessageLookupByLibrary.simpleMessage("Нікнейм"),
        "noRooms": MessageLookupByLibrary.simpleMessage(
            "Немає кімнат. Створіть першу!"),
        "noTeam": MessageLookupByLibrary.simpleMessage("Без команди"),
        "passwordIsIncorrect":
            MessageLookupByLibrary.simpleMessage("Пароль невірний"),
        "passwordNNN": m3,
        "playersDD": MessageLookupByLibrary.simpleMessage("Гравці:"),
        "pleaseEnterHallName": MessageLookupByLibrary.simpleMessage(
            "Будь ласка, введіть назву зали"),
        "red": MessageLookupByLibrary.simpleMessage("Червона"),
        "roomInfo": m4,
        "score": MessageLookupByLibrary.simpleMessage("Рахунок"),
        "settings": MessageLookupByLibrary.simpleMessage("Налаштування"),
        "sound": MessageLookupByLibrary.simpleMessage("Звук"),
        "startTheGame": MessageLookupByLibrary.simpleMessage("Почати гру"),
        "teamWon": MessageLookupByLibrary.simpleMessage(" команда перемогла"),
        "teams": MessageLookupByLibrary.simpleMessage("Команди"),
        "theGameIsAlreadyStarted":
            MessageLookupByLibrary.simpleMessage("Гра вже почалась"),
        "vibration": MessageLookupByLibrary.simpleMessage("Вібрація"),
        "youAreInTheBlueTeam":
            MessageLookupByLibrary.simpleMessage("Ви в синій команді"),
        "youAreInTheRedTeam":
            MessageLookupByLibrary.simpleMessage("Ви в червоній команді")
      };
}

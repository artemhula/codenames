// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(usersInRoom) => "Игроков: ${usersInRoom}";

  static String m1(dict) => "Словарь: ${dict}";

  static String m2(roomName) => "Название: ${roomName}";

  static String m3(password) => "Пароль: ${password}";

  static String m4(playersCount, language, isStarted) =>
      "Игроков: ${playersCount} | Язык: ${language}${isStarted}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "PlayersDDN": m0,
        "appLanguage": MessageLookupByLibrary.simpleMessage("Язык приложения"),
        "backToMainScreen":
            MessageLookupByLibrary.simpleMessage("К главному экрану"),
        "becomeACaptain":
            MessageLookupByLibrary.simpleMessage("Стать капитаном"),
        "becomeAPlayer": MessageLookupByLibrary.simpleMessage("Стать игроком"),
        "blue": MessageLookupByLibrary.simpleMessage("Синяя"),
        "change": MessageLookupByLibrary.simpleMessage("Изменить"),
        "checkTheDataDD":
            MessageLookupByLibrary.simpleMessage("Проверьте данные:"),
        "chooseGameLanguageDD":
            MessageLookupByLibrary.simpleMessage("Выберите язык игры:"),
        "createARoom": MessageLookupByLibrary.simpleMessage("Создать комнату"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Темная тема"),
        "dictionaryN": m1,
        "enter": MessageLookupByLibrary.simpleMessage("Войти"),
        "enterNickname":
            MessageLookupByLibrary.simpleMessage("Введите никнейм"),
        "enterRoomNameDD":
            MessageLookupByLibrary.simpleMessage("Введите название зала:"),
        "enterRoomPassword":
            MessageLookupByLibrary.simpleMessage("Введите пароль для зала:"),
        "gameOver": MessageLookupByLibrary.simpleMessage("Игра закончилась!"),
        "gameStarted":
            MessageLookupByLibrary.simpleMessage(" | Игра уже началась"),
        "hello": MessageLookupByLibrary.simpleMessage("Привет!👋"),
        "join": MessageLookupByLibrary.simpleMessage("Присоединиться"),
        "nameN": m2,
        "next": MessageLookupByLibrary.simpleMessage("Далее"),
        "nicknameDD": MessageLookupByLibrary.simpleMessage("Никнейм"),
        "noRooms": MessageLookupByLibrary.simpleMessage(
            "Нет комнат. Создайте первую!"),
        "noTeam": MessageLookupByLibrary.simpleMessage("Без команды"),
        "passwordIsIncorrect":
            MessageLookupByLibrary.simpleMessage("Пароль неверный"),
        "passwordNNN": m3,
        "playersDD": MessageLookupByLibrary.simpleMessage("Игроки:"),
        "pleaseEnterHallName": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, введите название зала"),
        "red": MessageLookupByLibrary.simpleMessage("Красная"),
        "roomInfo": m4,
        "score": MessageLookupByLibrary.simpleMessage("Счет"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "startTheGame": MessageLookupByLibrary.simpleMessage("Запустить игру"),
        "teamWon": MessageLookupByLibrary.simpleMessage(" команда победила"),
        "teams": MessageLookupByLibrary.simpleMessage("Команды")
      };
}

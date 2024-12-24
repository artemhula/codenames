// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello!👋`
  String get hello {
    return Intl.message(
      'Hello!👋',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Enter your nickname`
  String get enterNickname {
    return Intl.message(
      'Enter your nickname',
      name: 'enterNickname',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `No rooms. Create one!`
  String get noRooms {
    return Intl.message(
      'No rooms. Create one!',
      name: 'noRooms',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Create a room`
  String get createARoom {
    return Intl.message(
      'Create a room',
      name: 'createARoom',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get nicknameDD {
    return Intl.message(
      'Nickname',
      name: 'nicknameDD',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Password is incorrect`
  String get passwordIsIncorrect {
    return Intl.message(
      'Password is incorrect',
      name: 'passwordIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Players: {usersInRoom}`
  String PlayersDDN(Object usersInRoom) {
    return Intl.message(
      'Players: $usersInRoom',
      name: 'PlayersDDN',
      desc: '',
      args: [usersInRoom],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Teams`
  String get teams {
    return Intl.message(
      'Teams',
      name: 'teams',
      desc: '',
      args: [],
    );
  }

  /// `Red`
  String get red {
    return Intl.message(
      'Red',
      name: 'red',
      desc: '',
      args: [],
    );
  }

  /// `Blue`
  String get blue {
    return Intl.message(
      'Blue',
      name: 'blue',
      desc: '',
      args: [],
    );
  }

  /// `No team`
  String get noTeam {
    return Intl.message(
      'No team',
      name: 'noTeam',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Become a captain`
  String get becomeACaptain {
    return Intl.message(
      'Become a captain',
      name: 'becomeACaptain',
      desc: '',
      args: [],
    );
  }

  /// `Become a player`
  String get becomeAPlayer {
    return Intl.message(
      'Become a player',
      name: 'becomeAPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Start the game`
  String get startTheGame {
    return Intl.message(
      'Start the game',
      name: 'startTheGame',
      desc: '',
      args: [],
    );
  }

  /// `Game over!`
  String get gameOver {
    return Intl.message(
      'Game over!',
      name: 'gameOver',
      desc: '',
      args: [],
    );
  }

  /// ` team won`
  String get teamWon {
    return Intl.message(
      ' team won',
      name: 'teamWon',
      desc: '',
      args: [],
    );
  }

  /// `Back to the main screen`
  String get backToMainScreen {
    return Intl.message(
      'Back to the main screen',
      name: 'backToMainScreen',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get score {
    return Intl.message(
      'Score',
      name: 'score',
      desc: '',
      args: [],
    );
  }

  /// `Players:`
  String get playersDD {
    return Intl.message(
      'Players:',
      name: 'playersDD',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the name of the hall`
  String get pleaseEnterHallName {
    return Intl.message(
      'Please enter the name of the hall',
      name: 'pleaseEnterHallName',
      desc: '',
      args: [],
    );
  }

  /// `Select the game language:`
  String get chooseGameLanguageDD {
    return Intl.message(
      'Select the game language:',
      name: 'chooseGameLanguageDD',
      desc: '',
      args: [],
    );
  }

  /// `Enter the password for the room:`
  String get enterRoomPassword {
    return Intl.message(
      'Enter the password for the room:',
      name: 'enterRoomPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name of the room:`
  String get enterRoomNameDD {
    return Intl.message(
      'Enter the name of the room:',
      name: 'enterRoomNameDD',
      desc: '',
      args: [],
    );
  }

  /// `Check the data:`
  String get checkTheDataDD {
    return Intl.message(
      'Check the data:',
      name: 'checkTheDataDD',
      desc: '',
      args: [],
    );
  }

  /// `Name: {roomName}`
  String nameN(Object roomName) {
    return Intl.message(
      'Name: $roomName',
      name: 'nameN',
      desc: '',
      args: [roomName],
    );
  }

  /// `Password: {password}`
  String passwordNNN(Object password) {
    return Intl.message(
      'Password: $password',
      name: 'passwordNNN',
      desc: '',
      args: [password],
    );
  }

  /// `Dictionary: {dict}`
  String dictionaryN(Object dict) {
    return Intl.message(
      'Dictionary: $dict',
      name: 'dictionaryN',
      desc: '',
      args: [dict],
    );
  }

  /// `App language`
  String get appLanguage {
    return Intl.message(
      'App language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Players: {playersCount} | Language: {language}{isStarted}`
  String roomInfo(Object playersCount, Object language, Object isStarted) {
    return Intl.message(
      'Players: $playersCount | Language: $language$isStarted',
      name: 'roomInfo',
      desc: '',
      args: [playersCount, language, isStarted],
    );
  }

  /// ` | Game is started`
  String get gameStarted {
    return Intl.message(
      ' | Game is started',
      name: 'gameStarted',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Vibration`
  String get vibration {
    return Intl.message(
      'Vibration',
      name: 'vibration',
      desc: '',
      args: [],
    );
  }

  /// `The game is already started`
  String get theGameIsAlreadyStarted {
    return Intl.message(
      'The game is already started',
      name: 'theGameIsAlreadyStarted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

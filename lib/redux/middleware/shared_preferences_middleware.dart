import 'dart:developer';

import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferences sp = sl();

void sharedPreferencesMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  if (action is InitSettingsAction) {
    var isDark = sp.getBool('isDark');
    if (isDark == null) {
      if (ThemeMode.system == ThemeMode.dark) {
        sp.setBool('isDark', true);
        isDark = true;
      } else {
        sp.setBool('isDark', false);
        isDark = false;
      }
    }
    final language = sp.getString('language');
    if (language != null) {
      store.dispatch(
        UpdateSettingsState(
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          locale: Locale(language),
        ),
      );
    } else {
      store.dispatch(
        UpdateSettingsState(
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light),
      );
    }
  }
  if (action is InitNicknameAction) {
    store.dispatch(const UpdateUserState(status: Status.loading));
    final nickname = sp.getString('nickname');
    if (nickname != null) {
      store.dispatch(ConnectToSocketAction(name: nickname));
    } else {
      store.dispatch(const UpdateUserState(status: Status.initial));
    }
  }
  if (action is ChangeThemeAction) {
    sp.setBool('isDark', action.isDark);
    store.dispatch(UpdateSettingsState(
      themeMode: action.isDark ? ThemeMode.dark : ThemeMode.light,
      locale: store.state.settingsState.locale,
    ));
  } else if (action is SaveNicknameAction) {
    sp.setString('nickname', action.nickname);
  }
  if (action is ChangeLanguageAction) {
    sp.setString('language', action.language);
    log('try to change language, new language: ${action.language}');
    store.dispatch(
      UpdateSettingsState(
        themeMode: store.state.settingsState.themeMode,
        locale: Locale(action.language),
      ),
    );
  }
  next(action);
}

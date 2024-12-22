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
    var soundOn = sp.getBool('sound');
    if (soundOn == null) {
      sp.setBool('sound', true);
      soundOn = true;
    }
    var vibrationOn = sp.getBool('vibration');
    if (vibrationOn == null) {
      sp.setBool('vibration', true);
      vibrationOn = true;
    }
    final language = sp.getString('language');
    if (language != null) {
      store.dispatch(
        UpdateSettingsState(
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          soundOn: soundOn,
          vibrationOn: vibrationOn,
          locale: Locale(language),
        ),
      );
    } else {
      store.dispatch(UpdateSettingsState(
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        soundOn: soundOn,
        vibrationOn: vibrationOn,
      ));
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
      soundOn: store.state.settingsState.soundOn,
      vibrationOn: store.state.settingsState.vibrationOn,
      locale: store.state.settingsState.locale,
    ));
  } else if (action is SaveNicknameAction) {
    sp.setString('nickname', action.nickname);
  } else if (action is ChangeLanguageAction) {
    sp.setString('language', action.language);
    store.dispatch(UpdateSettingsState(
      themeMode: store.state.settingsState.themeMode,
      soundOn: store.state.settingsState.soundOn,
      vibrationOn: store.state.settingsState.vibrationOn,
      locale: Locale(action.language),
    ));
  } else if (action is ChangeSoundAction) {
    sp.setBool('sound', action.soundOn);
    store.dispatch(UpdateSettingsState(
      themeMode: store.state.settingsState.themeMode,
      soundOn: action.soundOn,
      vibrationOn: store.state.settingsState.vibrationOn,
      locale: store.state.settingsState.locale,
    ));
  } else if (action is ChangeVibrationAction) {
    sp.setBool('vibration', action.vibrationOn);
    store.dispatch(UpdateSettingsState(
      themeMode: store.state.settingsState.themeMode,
      soundOn: store.state.settingsState.soundOn,
      vibrationOn: action.vibrationOn,
      locale: store.state.settingsState.locale,
    ));
  }
  next(action);
}

import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferences sp = sl();
void themeMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is InitThemeAction) {
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
    store.dispatch(
        UpdateThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }
  if (action is ChangeThemeAction) {
    sp.setBool('isDark', action.isDark);
    store.dispatch(UpdateThemeState(
        themeMode: action.isDark ? ThemeMode.dark : ThemeMode.light));
  }
  next(action);
}

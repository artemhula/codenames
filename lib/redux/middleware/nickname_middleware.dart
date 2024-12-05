import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferences sp = sl();

void nicknameMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is InitNicknameAction) {
    store.dispatch(const UpdateUserState(status: Status.loading));
    final nickname = sp.getString('nickname');
    if (nickname != null) {
      store.dispatch(ConnectToSocketAction(name: nickname));
    } else {
      store.dispatch(const UpdateUserState(status: Status.initial));
    }
  } else if (action is SaveNicknameAction) {
    sp.setString('nickname', action.nickname);
  }
  next(action);
}

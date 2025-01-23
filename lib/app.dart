import 'package:codenames/features/menu/screens/first_screen.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:redux/redux.dart';

class CodenamesGame extends StatelessWidget {
  const CodenamesGame({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: sl<Store<AppState>>(),
      child: StoreConnector<AppState, SettingsState>(
        converter: (Store<AppState> store) => store.state.settingsState,
        builder: (context, SettingsState state) {
          return FlutterWebFrame(
            clipBehavior: Clip.hardEdge,
            maximumSize: Size(800, MediaQuery.of(context).size.height),
            backgroundColor: state.themeMode == ThemeMode.dark
                ? darkTheme.scaffoldBackgroundColor
                : lightTheme.scaffoldBackgroundColor,
            enabled: kIsWeb,
            builder: (context) => MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: state.locale,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: HelloScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}

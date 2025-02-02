import 'package:codenames/features/settings/widgets/language_picker.dart';
import 'package:codenames/features/settings/widgets/nickname_changer.dart';
import 'package:codenames/features/settings/widgets/changer.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:just_audio/just_audio.dart';
import 'package:redux/redux.dart';
import 'package:vibration/vibration.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
      ),
      body: Stack(
        children: [
          const Background(),
          Padding(
            padding: const EdgeInsets.all(Constants.padding),
            child: StoreConnector(
                converter: (Store<AppState> store) => store.state.settingsState,
                builder: (context, state) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // nickname changer
                        const NicknameChanger(),
                        const SizedBox(height: 20),

                        // theme changer
                        Changer(
                          text: S.of(context).darkTheme,
                          value: state.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            sl<Store<AppState>>().dispatch(ChangeThemeAction(isDark: value));
                          },
                        ),
                        const SizedBox(height: 20),

                        // sound changer
                        Changer(
                          text: S.of(context).sound,
                          value: state.soundOn,
                          onChanged: (value) {
                            if (value) {
                              final player = AudioPlayer()..setAsset('assets/audio/card.mp3');
                              player.play();
                            }
                            sl<Store<AppState>>().dispatch(ChangeSoundAction(soundOn: value));
                          },
                        ),
                        const SizedBox(height: 20),

                        // vibration changer
                        if (!kIsWeb)
                          Changer(
                            text: S.of(context).vibration,
                            value: state.vibrationOn,
                            onChanged: (value) {
                              if (value) {
                                Vibration.vibrate(duration: 100);
                              }
                              sl<Store<AppState>>().dispatch(ChangeVibrationAction(vibrationOn: value));
                            },
                          ),
                        if (!kIsWeb) const SizedBox(height: 20),

                        // language changer
                        LanguagePicker(),
                      ],
                    )),
          ),
        ],
      ),
    );
  }
}

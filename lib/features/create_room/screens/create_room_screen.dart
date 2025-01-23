import 'package:codenames/features/game/screens/choose_role_screen.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:codenames/features/create_room/widgets/language_selector.dart';
import 'package:codenames/features/create_room/widgets/password_input.dart';
import 'package:codenames/features/create_room/widgets/room_name_input.dart';
import 'package:codenames/features/create_room/widgets/room_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final PageController _controller = PageController();
  String roomName = '';
  List<int> password = [5, 5, 5];
  String language = 'uk';

  void nextPage() {
    if (_controller.page == 0) {
      if (roomName.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              S.of(context).pleaseEnterHallName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );

        return;
      }
    }
    if (_controller.page == 3) {
      sl<Store<AppState>>().dispatch(CreateRoomAction(
        roomName: roomName,
        password: password[0] * 100 + password[1] * 10 + password[2],
        language: language,
      ));
    }
    _controller.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void previousPage() {
    _controller.previousPage(
      duration: Duration(milliseconds: _controller.page == 0 ? 100 : 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => store.state.roomState.status,
        builder: (BuildContext context, Status status) {
          if (status == Status.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const ChooseRoleScreen()),
              );
            });
          }
          return Scaffold(
            appBar: AppBar(forceMaterialTransparency: true),
            body: Stack(
              children: [
                const Background(),
                PageView(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  children: [
                    RoomNameInput(
                      onChanged: (value) {
                        setState(() {
                          roomName = value;
                        });
                      },
                    ),
                    PasswordInput(
                      password: password,
                      onChanged: (index, value) {
                        setState(() {
                          password[index] = value;
                        });
                      },
                    ),
                    LanguageSelector(
                      language: language,
                      onChanged: (value) {
                        setState(() {
                          language = value;
                        });
                      },
                    ),
                    RoomSummary(
                      roomName: roomName,
                      password: password,
                      language: language,
                    ),
                    const Center(
                      child: CupertinoActivityIndicator(
                        radius: Constants.progressIndicatorRadius,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Column(children: [
                    IconButton(
                      onPressed: previousPage,
                      icon: const Icon(Icons.arrow_upward),
                    ),
                    const SizedBox(height: 10),
                    IconButton(
                      onPressed: nextPage,
                      icon: const Icon(Icons.arrow_downward),
                    ),
                  ]),
                ),
              ],
            ),
          );
        });
  }
}

import 'package:codenames/features/menu/screens/main_screen.dart';
import 'package:codenames/features/menu/widgets/logo.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  late TextEditingController _controller;

  @override
  initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: StoreConnector<AppState, Status>(
                converter: (Store<AppState> store) => store.state.userState.status,
                onDidChange: (previousStatus, currentStatus) {
                  if (currentStatus == Status.success && previousStatus != Status.success) {
                    sl<Store<AppState>>().dispatch(GetRoomsAction());
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (route) => false,
                      );
                    });
                  }
                },
                builder: (BuildContext context, Status status) {
                  if (status == Status.initial) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Hero(
                            tag: 'logo',
                            child: Logo(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          S.of(context).hello,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: Constants.textMaxWidth,
                            minHeight: Constants.textMaxHeight,
                            maxHeight: Constants.textMaxHeight,
                          ),
                          child: TextFormField(
                            controller: _controller,
                            readOnly: status == Status.loading,
                            enabled: status != Status.loading,
                            maxLength: 20,
                            decoration: InputDecoration(
                              label: Text(
                                S.of(context).enterNickname,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              counterText: '',
                              filled: true,
                              fillColor: Theme.of(context).brightness == Brightness.light
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.black.withOpacity(0.3),
                              focusColor: Theme.of(context).colorScheme.primary,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              sl<Store<AppState>>().dispatch(
                                ConnectToSocketAction(name: _controller.text),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              foregroundColor: Theme.of(context).colorScheme.brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Constants.borderRadius),
                              ),
                              fixedSize: const Size(90, Constants.textMaxHeight),
                              padding: const EdgeInsets.all(Constants.borderRadius)),
                          child: Text(
                            S.of(context).next,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.brightness == Brightness.light
                                      ? Colors.white
                                      : Colors.black,
                                ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Hero(
                          tag: 'logo',
                          child: Logo(),
                        ),
                      ),
                      SizedBox(height: 30),
                      CupertinoActivityIndicator(radius: Constants.progressIndicatorRadius)
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}

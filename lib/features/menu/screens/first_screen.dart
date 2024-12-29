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

class HelloScreen extends StatelessWidget {
  HelloScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: StoreConnector<AppState, Status>(
                converter: (Store<AppState> store) =>
                    store.state.userState.status,
                onDidChange: (previousStatus, currentStatus) {
                  if (currentStatus == Status.success &&
                      previousStatus != Status.success) {
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
                        const SizedBox(height: 12),
                        Text(
                          S.of(context).hello,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _controller,
                          enabled: status != Status.loading,
                          maxLength: 20,
                          decoration: InputDecoration(
                            label: Text(
                              S.of(context).enterNickname,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white.withOpacity(0.3)
                                    : Colors.black.withOpacity(0.3),
                            focusColor: Theme.of(context).colorScheme.primary,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              sl<Store<AppState>>().dispatch(
                                ConnectToSocketAction(name: _controller.text),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: status == Status.loading
                                ? CupertinoActivityIndicator(
                                    radius: Constants.progressIndicatorRadius,
                                    color: Theme.of(context)
                                                .colorScheme
                                                .brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                  )
                                : Text(
                                    S.of(context).next,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                                  .colorScheme
                                                  .brightness ==
                                              Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                    ),
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

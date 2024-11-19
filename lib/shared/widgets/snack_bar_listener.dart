import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SnackBarListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String?>(
      converter: (store) => store.state.warningState.message,
      builder: (context, message) {
        if (message != null && message.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Theme.of(context).colorScheme.primary,
                duration: const Duration(seconds: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 100,
                  left: 30,
                  right: 30,
                ),
                dismissDirection: DismissDirection.up,
              ),
            );
            sl<Store<AppState>>().dispatch(const UpdateWarningState(message: ''));
          });
        }
        return Container();
      },
    );
  }
}

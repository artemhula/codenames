import 'package:codenames/locator.dart';
import 'package:codenames/redux/actions.dart';
import 'package:codenames/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:codenames/redux/state.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:redux/redux.dart';

class SnackBarListener extends StatelessWidget {
  const SnackBarListener({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WarningState>(
      converter: (store) => store.state.warningState,
      onWillChange: (previousState, currentState) {
        if (currentState.message != null && previousState!.message == null) {
          showToast(
            currentState.message,
            context: context,
            animation: StyledToastAnimation.slideFromTopFade,
            reverseAnimation: StyledToastAnimation.slideToTopFade,
            position: StyledToastPosition.top,
            animDuration: const Duration(milliseconds: 200),
            duration: const Duration(seconds: 4),
            backgroundColor: Theme.of(context).colorScheme.primary,
            curve: Curves.linear,
            borderRadius: BorderRadius.circular(Constants.borderRadius),
            reverseCurve: Curves.linear,
          );
          sl<Store<AppState>>().dispatch(ClearWarningAction());
        }
      },
      builder: (context, state) => const SizedBox(),
    );
  }
}

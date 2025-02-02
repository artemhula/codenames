import 'package:codenames/features/game/screens/choose_role_screen.dart';
import 'package:codenames/features/menu/widgets/popups/error_popup.dart';
import 'package:codenames/features/menu/widgets/popups/loading_popup.dart';
import 'package:codenames/features/menu/widgets/popups/password_popup.dart';
import 'package:codenames/generated/l10n.dart';
import 'package:codenames/redux/state.dart';
import 'package:codenames/shared/constants.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:codenames/features/menu/widgets/buttons_bar.dart';
import 'package:codenames/features/menu/widgets/create_room_button.dart';
import 'package:codenames/features/menu/widgets/logo.dart';
import 'package:codenames/features/menu/widgets/room_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SafeArea(
            child: StoreConnector(
              converter: (Store<AppState> store) => store.state,
              builder: (BuildContext context, state) {
                if (state.roomsListState.status == Status.success) {
                  return Padding(
                    padding: const EdgeInsets.all(Constants.padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // buttons
                        const ButtonsBar(),
                        const SizedBox(height: 20),

                        // logo
                        const Hero(tag: 'logo', child: Logo()),
                        const SizedBox(height: 10),

                        // create room button
                        const CreateRoomButton(),
                        const SizedBox(height: 20),

                        // no rooms text
                        if (state.roomsListState.rooms!.isEmpty)
                          Expanded(
                            child: Center(
                              child: Text(
                                S.of(context).noRooms,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),

                        //rooms
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.roomsListState.rooms!.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemBuilder: (context, index) => RoomListTile(
                              room: state.roomsListState.rooms![index],
                              onTap: () {
                                final room = state.roomsListState.rooms![index];
                                showDialog(
                                  context: context,
                                  builder: (context) => StoreConnector(
                                    builder: (BuildContext context, roomState) {
                                      if (room.isGameStarted) {
                                        return ErrorPopUp(
                                          message: S.of(context).theGameIsAlreadyStarted,
                                        );
                                      } else if (roomState.status == Status.loading) {
                                        return const LoadingPopUp();
                                      } else if (roomState.status == Status.success) {
                                        WidgetsBinding.instance.addPostFrameCallback((_) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => const ChooseRoleScreen(),
                                            ),
                                          );
                                        });
                                      }
                                      return PasswordPopUp(roomId: room.id);
                                    },
                                    converter: (Store<AppState> store) => store.state.roomState,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: Text(state.roomsListState.status.toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

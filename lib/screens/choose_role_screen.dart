import 'package:codenames/redux/state.dart';
import 'package:codenames/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Команди',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    StoreConnector(
                      builder: (BuildContext context, RoomState roomState) {
                          if (roomState.status == Status.success){
                            return Text(roomState.room.toString());
                          }
                          return Container();
                        },
                       converter: (Store<AppState> store) =>
                            store.state.roomState),
                        
                       
                    Row(
                      children: [Divider()],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

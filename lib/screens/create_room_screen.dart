import 'package:codenames/widgets/background.dart';
import 'package:codenames/widgets/language_selector.dart';
import 'package:codenames/widgets/password_input.dart';
import 'package:codenames/widgets/room_name_input.dart';
import 'package:codenames/widgets/room_summary.dart';
import 'package:flutter/material.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});
  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final PageController _controller = PageController();
  String roomName = '';
  List<int> password = [0, 0, 0];
  String language = 'ua';

  void nextPage() {
    if (_controller.page == 0) {
      if (roomName.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Будь ласка введіть назву зали',
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
      // sl<Store<AppState>>().dispatch(CreateRoom(
      //   roomName: roomName,
      //   password: password[0] * 100 + password[1] * 10 + password[2],
      //   language: language,
      // ));
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
    return Scaffold(
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
              const Center(child: CircularProgressIndicator()),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Column(children: [
              IconButton(
                onPressed: previousPage,
                icon: Icon(Icons.arrow_upward),
              ),
              SizedBox(height: 10),
              IconButton(
                onPressed: nextPage,
                icon: Icon(Icons.arrow_downward),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

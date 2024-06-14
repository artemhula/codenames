import 'package:flutter/material.dart';

class CreateRoomScreen extends StatefulWidget {
  CreateRoomScreen({Key? key}) : super(key: key);

  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final PageController _controller = PageController();

  void nextPage() {
    _controller.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Text('Page 1'),
          ),
          Center(
            child: Text('Page 2'),
          ),
          Center(
            child: Text('Page 3'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: nextPage,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

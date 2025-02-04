import 'package:codenames/shared/constants.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class TeamConfetti extends StatefulWidget {
  const TeamConfetti({super.key, required this.winnerTeam});
  final String winnerTeam;

  @override
  State<TeamConfetti> createState() => _TeamConfettiState();
}

class _TeamConfettiState extends State<TeamConfetti> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    super.initState();
    _controllerCenterRight = ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft = ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight.play();
    _controllerCenterLeft.play();
  }

  @override
  void dispose() {
    _controllerCenterLeft.dispose();
    _controllerCenterRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            emissionFrequency: 0.3,
            minimumSize: const Size(10, 10),
            maximumSize: const Size(30, 30),
            colors: widget.winnerTeam == 'blue'
                ? [Constants.blueColor, Colors.cyan, Colors.lightBlue]
                : [Constants.redColor, Colors.pink, Colors.deepOrange],
            numberOfParticles: 1,
            gravity: 0.2,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            blastDirection: 0,
            emissionFrequency: 0.3,
            minimumSize: const Size(10, 10),
            colors: widget.winnerTeam == 'blue'
                ? [Constants.blueColor, Colors.cyan, Colors.lightBlue]
                : [Constants.redColor, Colors.pink, Colors.deepOrange],
            maximumSize: const Size(30, 30),
            numberOfParticles: 1,
            gravity: 0.2,
          ),
        ),
      ],
    );
  }
}

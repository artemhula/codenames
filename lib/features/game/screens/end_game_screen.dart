import 'package:codenames/features/menu/screens/main_screen.dart';
import 'package:codenames/shared/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EndGameScreen extends StatelessWidget {
  const EndGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Гра закінчилась!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Перемогла ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'команда червоних',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.red, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Рахунок: ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '7',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.w900),
                      ),
                      Text(
                        ' : ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '3',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.red, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      //get rooms
                      Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (route) => false);
                    },
                    child: Text(
                      'До головного екрану',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

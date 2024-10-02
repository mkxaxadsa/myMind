import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/texts/text_r.dart';

void initPush() {
  OneSignal.shared.setAppId("44ccf254-7413-4618-9a9e-c84bd24d8dc1");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
}

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff471280),
                  Color(0xff43BCF0),
                ],
              ),
            ),
          ),
          const Column(
            children: [
              CustomAppbar(game: false),
              SizedBox(height: 40),
              TextM('RULES', fontSize: 22),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextR(
                  'The objective of the memory matching game is to find and match all pairs of cards by selecting two cards at a time, remembering their positions, and continuing until all pairs are matched, with the option to restart the game at any point.',
                  fontSize: 18,
                  maxLines: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

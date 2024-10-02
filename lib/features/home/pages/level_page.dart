import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../widgets/level_card.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/cards/c1.png'), context);
    precacheImage(const AssetImage('assets/cards/c2.png'), context);
    precacheImage(const AssetImage('assets/cards/c3.png'), context);
    precacheImage(const AssetImage('assets/cards/c4.png'), context);
    precacheImage(const AssetImage('assets/cards/c5.png'), context);
    precacheImage(const AssetImage('assets/cards/c6.png'), context);
    precacheImage(const AssetImage('assets/cards/c7.png'), context);
    precacheImage(const AssetImage('assets/cards/c8.png'), context);
    precacheImage(const AssetImage('assets/cards/c9.png'), context);
    precacheImage(const AssetImage('assets/cards/c10.png'), context);
    precacheImage(const AssetImage('assets/cards/c11.png'), context);
    precacheImage(const AssetImage('assets/cards/c12.png'), context);
    precacheImage(const AssetImage('assets/cards/c13.png'), context);
    precacheImage(const AssetImage('assets/cards/c14.png'), context);
    precacheImage(const AssetImage('assets/cards/c15.png'), context);
    precacheImage(const AssetImage('assets/cards/c16.png'), context);
    precacheImage(const AssetImage('assets/cards/c17.png'), context);
    precacheImage(const AssetImage('assets/cards/c18.png'), context);
    precacheImage(const AssetImage('assets/cards/c19.png'), context);
    precacheImage(const AssetImage('assets/cards/c20.png'), context);
    precacheImage(const AssetImage('assets/cards/c21.png'), context);
    precacheImage(const AssetImage('assets/cards/c22.png'), context);
    precacheImage(const AssetImage('assets/cards/c23.png'), context);
    precacheImage(const AssetImage('assets/cards/c24.png'), context);
    precacheImage(const AssetImage('assets/cards/c25.png'), context);
    precacheImage(const AssetImage('assets/cards/c26.png'), context);
    precacheImage(const AssetImage('assets/cards/c27.png'), context);
    precacheImage(const AssetImage('assets/cards/c28.png'), context);
    precacheImage(const AssetImage('assets/cards/c29.png'), context);
    precacheImage(const AssetImage('assets/cards/c30.png'), context);
    precacheImage(const AssetImage('assets/cards/c31.png'), context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg/bg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              const CustomAppbar(
                game: false,
                back: false,
                rules: true,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(
                    level: 1,
                    onPressed: () {
                      context.push('/game', extra: 1);
                    },
                  ),
                  const SizedBox(width: 20),
                  LevelCard(
                    level: 2,
                    onPressed: () {
                      context.push('/game', extra: 2);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(
                    level: 3,
                    onPressed: () {
                      context.push('/game', extra: 3);
                    },
                  ),
                  const SizedBox(width: 20),
                  LevelCard(
                    level: 4,
                    onPressed: () {
                      context.push('/game', extra: 4);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(
                    level: 5,
                    onPressed: () {
                      context.push('/game', extra: 5);
                    },
                  ),
                  const SizedBox(width: 20),
                  LevelCard(
                    level: 6,
                    onPressed: () {
                      context.push('/game', extra: 6);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LevelCard(
                    level: 7,
                    onPressed: () {
                      context.push('/game', extra: 7);
                    },
                  ),
                  const SizedBox(width: 20),
                  LevelCard(
                    level: 8,
                    onPressed: () {
                      context.push('/game', extra: 8);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

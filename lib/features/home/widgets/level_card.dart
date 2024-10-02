import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/rotated_widget.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.level,
    required this.onPressed,
  });

  final int level;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xff6EBCF7),
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Transform.scale(
                scaleX: -1,
                child: Image.asset(
                  getGameBg(level),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            if (level == 1) ...[
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/level/l1.png',
                  height: 105,
                ),
              ),
            ],
            if (level == 6) ...[
              Positioned(
                bottom: -5,
                left: -20,
                child: Image.asset(
                  'assets/level/l2.png',
                  height: 88,
                ),
              ),
            ],
            if (level == 5) ...[
              Positioned(
                bottom: -10,
                child: Image.asset(
                  'assets/level/l3.png',
                  height: 116,
                ),
              ),
            ],
            if (level == 8) ...[
              Positioned(
                bottom: 0,
                left: -30,
                child: Image.asset(
                  'assets/level/l4.png',
                  height: 240,
                ),
              ),
            ],
            if (level == 2) ...[
              Positioned(
                bottom: 20,
                left: 0,
                child: RotatedWidget(
                  degree: 8,
                  child: Image.asset(
                    'assets/level/l5.png',
                    height: 92,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: RotatedWidget(
                  degree: 30,
                  child: Image.asset(
                    'assets/level/l6.png',
                    height: 50,
                  ),
                ),
              ),
            ],
            if (level == 3) ...[
              Positioned(
                top: 10,
                right: 5,
                child: RotatedWidget(
                  degree: 7,
                  child: Image.asset(
                    'assets/level/l8.png',
                    height: 83,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 7,
                child: RotatedWidget(
                  degree: -30,
                  child: Image.asset(
                    'assets/level/l7.png',
                    height: 73,
                  ),
                ),
              ),
            ],
            if (level == 4) ...[
              Positioned(
                left: 0,
                bottom: 5,
                child: RotatedWidget(
                  degree: -22,
                  child: Image.asset(
                    'assets/level/l11.png',
                    height: 80,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 17,
                child: RotatedWidget(
                  degree: 20,
                  child: Image.asset(
                    'assets/level/l10.png',
                    height: 73,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 37,
                child: RotatedWidget(
                  degree: 9,
                  child: Image.asset(
                    'assets/level/l9.png',
                    height: 73,
                  ),
                ),
              ),
            ],
            if (level == 7) ...[
              Positioned(
                right: 0,
                left: 0,
                top: 10,
                child: RotatedWidget(
                  degree: 0,
                  child: Image.asset(
                    'assets/level/l14.png',
                    height: 100,
                  ),
                ),
              ),
              Positioned(
                bottom: 14,
                right: 14,
                child: RotatedWidget(
                  degree: 0,
                  child: Image.asset(
                    'assets/level/l13.png',
                    height: 73,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 12,
                child: RotatedWidget(
                  degree: 0,
                  child: Image.asset(
                    'assets/level/l12.png',
                    height: 73,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

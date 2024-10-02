import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'buttons/cuper_button.dart';
import 'texts/text_r.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.game = true,
    this.back = true,
    this.rules = false,
    this.level = 0,
  });

  final bool game;
  final bool back;
  final bool rules;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff43BCF0),
            Color(0xff571280),
          ],
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 25),
              back
                  ? CuperButton(
                      onPressed: () {
                        context.pop();
                      },
                      minSize: 30,
                      child: SvgPicture.asset('assets/back.svg'),
                    )
                  : const SizedBox(width: 30),
              if (level != 0) const SizedBox(width: 18),
              const Spacer(),
              game
                  ? Image.asset(
                      'assets/heart.png',
                      height: 30,
                    )
                  : SvgPicture.asset('assets/logo.svg'),
              const Spacer(),
              rules
                  ? CuperButton(
                      onPressed: () {
                        context.push('/rules');
                      },
                      minSize: 30,
                      child: SvgPicture.asset('assets/info.svg'),
                    )
                  : level != 0
                      ? Container(
                          height: 30,
                          width: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xff00FFB2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: TextR(
                              '$level/8',
                              fontSize: 18,
                            ),
                          ),
                        )
                      : const SizedBox(width: 30),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

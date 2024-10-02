import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/cuper_button.dart';

class WinDialog extends StatelessWidget {
  const WinDialog({
    super.key,
    required this.onRestart,
  });

  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 182,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                width: 3,
                color: Colors.white,
              ),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff2BD5E8),
                  Color(0xff8864E8),
                ],
              ),
            ),
            child: Center(
              child: SvgPicture.asset('assets/win.svg'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CuperButton(
                onPressed: () {
                  context.pop();
                  context.pop();
                },
                child: SvgPicture.asset('assets/home.svg'),
              ),
              const SizedBox(width: 80),
              CuperButton(
                onPressed: () {
                  context.pop();
                  onRestart();
                },
                child: SvgPicture.asset('assets/next.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

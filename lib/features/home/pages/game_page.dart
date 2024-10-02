import 'package:flutter/material.dart';

import '../../../core/models/card_model.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../widgets/game_card.dart';
import '../widgets/win_dialog.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    required this.level,
  });

  final int level;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<CardModel> cards = [];

  bool first = true;
  bool isChecking = false;
  late CardModel firstCard;

  bool checkWin() {
    return cards.every((card) => card.done);
  }

  void onCard(CardModel value) {
    if (mounted) {
      if (value.visible || value.done || isChecking) return;
      setState(() {
        value.visible = true;
      });
      if (first) {
        firstCard = value;
        first = false;
      } else {
        if (firstCard.id == value.id) {
          logger('CORRECT');
          setState(() {
            value.done = true;
            firstCard.done = true;
          });
        } else {
          logger('WRONG');
          isChecking = true;
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              setState(() {
                value.visible = false;
                firstCard.visible = false;
                isChecking = false;
              });
            }
          });
        }
        first = true;
      }
      if (checkWin()) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WinDialog(onRestart: onRestartGame);
          },
        );
      }
    }
  }

  void onRestartGame() {
    if (mounted) {
      cards.shuffle();
      cards.shuffle();
      first = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 2), () {
        for (var card in cards) {
          card.visible = false;
          card.done = false;
        }
        if (mounted) setState(() {});
      });
    }
  }

  void onStart() {
    cards = getGameCards(widget.level);
    cards.shuffle();
    cards.shuffle();
    Future.delayed(const Duration(seconds: 2), () {
      for (var card in cards) {
        card.visible = false;
      }
      if (mounted) setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    onStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            getGameBg(widget.level),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              CustomAppbar(
                rules: false,
                level: widget.level,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GameCard(
                          card: cards[0],
                          size: getCardSize(widget.level),
                          onPressed: onCard,
                        ),
                        const SizedBox(width: 15),
                        GameCard(
                          card: cards[1],
                          size: getCardSize(widget.level),
                          onPressed: onCard,
                        ),
                        if (widget.level >= 7) ...[
                          const SizedBox(width: 15),
                          GameCard(
                            card: cards[8],
                            size: getCardSize(widget.level),
                            onPressed: onCard,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GameCard(
                          card: cards[2],
                          size: getCardSize(widget.level),
                          onPressed: onCard,
                        ),
                        const SizedBox(width: 15),
                        GameCard(
                          card: cards[3],
                          size: getCardSize(widget.level),
                          onPressed: onCard,
                        ),
                        if (widget.level >= 7) ...[
                          const SizedBox(width: 15),
                          GameCard(
                            card: cards[9],
                            size: getCardSize(widget.level),
                            onPressed: onCard,
                          ),
                        ],
                      ],
                    ),
                    if (widget.level >= 2) ...[
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GameCard(
                            card: cards[4],
                            size: getCardSize(widget.level),
                            onPressed: onCard,
                          ),
                          const SizedBox(width: 15),
                          GameCard(
                            card: cards[5],
                            size: getCardSize(widget.level),
                            onPressed: onCard,
                          ),
                          if (widget.level >= 7) ...[
                            const SizedBox(width: 15),
                            GameCard(
                              card: cards[10],
                              size: getCardSize(widget.level),
                              onPressed: onCard,
                            ),
                          ],
                        ],
                      ),
                    ],
                    if (widget.level >= 5) ...[
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GameCard(
                            card: cards[6],
                            size: getCardSize(widget.level),
                            onPressed: onCard,
                          ),
                          const SizedBox(width: 15),
                          GameCard(
                            card: cards[7],
                            size: getCardSize(widget.level),
                            onPressed: onCard,
                          ),
                          if (widget.level >= 7) ...[
                            const SizedBox(width: 15),
                            GameCard(
                              card: cards[11],
                              size: getCardSize(widget.level),
                              onPressed: onCard,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:go_router/go_router.dart';

import '../../features/home/pages/game_page.dart';
import '../../features/home/pages/level_page.dart';
import '../../features/home/pages/rules_page.dart';
import '../../features/home/pages/start_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartPage(),
    ),
    GoRoute(
      path: '/level',
      builder: (context, state) => const LevelPage(),
    ),
    GoRoute(
      path: '/rules',
      builder: (context, state) => const RulesPage(),
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) => GamePage(
        level: state.extra as int,
      ),
    ),
  ],
);

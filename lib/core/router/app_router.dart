import 'package:go_router/go_router.dart';
import 'package:guess_it_frontend/features/game/presentation/pages/game_page.dart';

import '../../features/home/presentation/home_page.dart';

class AppRouter {
  static var router = GoRouter(
    initialLocation: HomePage.route,
    routes: [
      GoRoute(path: HomePage.route, builder: (context, state) => HomePage()),
      GoRoute(
        path: '/game',
        builder: (context, state) => GamePage(
          attemptsCount: int.parse(
            state.uri.queryParameters['attemptsCount'] ?? '',
          ),
          wordLength: int.parse(state.uri.queryParameters['wordLength'] ?? ''),
        ),
      ),
    ],
  );
}

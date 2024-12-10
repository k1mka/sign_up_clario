import 'package:clario/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routerKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  navigatorKey: routerKey,
  initialLocation: SignUpScreen.routeName,
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeName,
      builder: (__, _) => const SignUpScreen(),
      routes: [
        /*   GoRoute(
          name: FilmInfoScreen.routeName,
          path: '${FilmInfoScreen.routeName}/:${FilmInfoScreen.param}',
          builder: (__, state) {
            final filmJson = state.pathParameters[FilmInfoScreen.param]!;
            final filmModel = FilmModel.fromJson(jsonDecode(filmJson));
            return FilmInfoScreen(filmModel: filmModel);
          },
        ),*/
      ],
    ),
  ],
);

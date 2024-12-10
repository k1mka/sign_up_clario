import 'package:clario/core/logger/composite_logger_holder.dart';
import 'package:clario/core/router/app_router_holder.dart';
import 'package:clario/core/router/router.dart';
import 'package:clario/core/theme/palette.dart';
import 'package:clario/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Film Zone',
      routerConfig: goRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(scaffoldBackgroundColor: Palette.black),
      builder: (context, router) => AppRouterHolder(
        router: getRouter,
        child: CompositeLoggerHolder(
          compositeLogger: getLogger,
          child: router!,
        ),
      ),
    );
  }
}

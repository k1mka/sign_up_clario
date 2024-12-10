import 'package:clario/core/logger/composite_logger.dart';
import 'package:clario/core/logger/composite_logger_holder.dart';
import 'package:clario/core/router/app_router.dart';
import 'package:clario/core/router/app_router_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get s => AppLocalizations.of(this)!;

  CompositeLogger get l => CompositeLoggerHolder.of(this);

  ColorScheme get c => Theme.of(this).colorScheme;

  AppRouter get r => AppRouterHolder.of(this).router;

  MediaQueryData get q => MediaQuery.of(this);

  double get h => q.size.height;

  double get w => q.size.width;
}

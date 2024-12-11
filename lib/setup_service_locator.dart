import 'package:clario/core/logger/composite_logger.dart';
import 'package:clario/core/logger/composite_logger_impl.dart';
import 'package:clario/core/router/app_router.dart';
import 'package:clario/core/router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final _getIt = GetIt.instance;

final getLogger = _getIt<CompositeLogger>();
final getRouter = _getIt<AppRouter>();

Future<void> serviceLocator() async => setupSync();

void setupSync() {
  _getIt.registerLazySingleton<AppRouter>(GoAppRouter.new);
  _getIt.registerSingleton<CompositeLogger>(CompositeLoggerImpl(logger: Logger()));
}

import 'package:clario/data/datasources/remote/network_service/network_service.dart';
import 'package:clario/domain/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this.networkService);

  final NetworkService networkService;
}

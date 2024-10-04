import 'package:common_dependency/common_dependency.dart';
import 'package:master_data/src/domain/repositories/master_data_repositories.dart';
import 'src/data/datasources/master_data_remote_ds.dart';
import 'src/data/repositories/master_data_repository_impl.dart';

class MasterDataModule {
  Future<void> call() async {
    // repository

    di.registerLazySingleton<MasterDataRepository>(
        () => MasterDataRepositoryImpl());
    di.registerLazySingleton<MasterDataRemoteDs>(
        () => MasterDataRemoteDsImpl());
  }
}

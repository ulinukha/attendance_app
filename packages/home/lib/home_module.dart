
import 'package:common_dependency/common_dependency.dart';
import 'package:home/home.dart';
import 'package:home/src/data/repositories/home_repository_impl.dart';

import 'src/data/datasources/home_remote_ds.dart';

class HomeModule {
  Future<void> call() async {
    //Repository
    di.registerLazySingleton<HomeRepository>(
      () => HomeRepositoriesImpl(),
    );

    //DataSource
    di.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    );
    di.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(),
    );

    di.registerFactory(() => LoginCubit());
    di.registerFactory(() => BerandaCubit());
    di.registerFactory(() => SetupPointCubit());
  }
}


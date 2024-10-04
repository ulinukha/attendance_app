import 'package:home/home.dart';
import 'package:get_it/get_it.dart';
import 'injection.dart' as injection;
import 'src/repositories/home_navigation_repository_impl.dart';

class NavigationModule {
  Future<void> call(GetIt di) async {
    injection.di = di;
    di.registerLazySingleton<HomeNavigationRepository>(
        () => HomeNavigationRepositoryImpl());
  }
}

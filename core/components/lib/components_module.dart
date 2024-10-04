import 'package:components/src/const/di.dart';
import 'package:components/src/utils/extension/event_bus.dart';
import 'package:get_it/get_it.dart';

class ComponentsModule {
  call(GetIt inputDi) {
    di = inputDi;
    di.registerLazySingleton(() => EventBus());
  }
}

import 'package:common_dependency/common_dependency.dart';
import 'package:components/components.dart';

class EventBus extends Cubit<dynamic> with SyncEmit {
  EventBus() : super(null);

  act(dynamic state) {
    emit(state);
    emit(null);
  }
}
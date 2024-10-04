import 'package:common_dependency/common_dependency.dart';

mixin BasePageListener<STATE extends BasePageState> on BlocBase<STATE> {
  clearErrorState();
}

// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message = '']);

  @override
  String toString() => message;
}

class ErrMsgFailure extends Failure {
  final String errMsg;

  const ErrMsgFailure(this.errMsg);
  @override
  String get message => errMsg;
  @override
  List<Object?> get props => [message];
}


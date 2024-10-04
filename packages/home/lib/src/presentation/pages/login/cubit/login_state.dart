part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState 
implements BasePageState {
    const LoginState._();
    const factory LoginState ({
        required FormzStatus status,
        required TextEditingController userId,
        required TextEditingController password,
        required String errMsg,
        Failure? failure
      }) = _LoginState;

     factory LoginState.initial() => LoginState(
      status : FormzStatus.pure,
      userId: TextEditingController(),
      password: TextEditingController(),
      errMsg: ''
    );

  @override
  FormzStatus get statusState => status;
  
  @override
  Failure? get errorState => failure;
  
  bool get isLoading => status == FormzStatus.submissionInProgress;
}

part of 'setup_point_cubit.dart';

@freezed
class SetupPointState with _$SetupPointState 
implements BasePageState {
    const SetupPointState._();
    const factory SetupPointState ({
        required FormzStatus status,
        Failure? failure
      }) = _SetupPointState;

     factory SetupPointState.initial() => SetupPointState(
      status : FormzStatus.pure,
    );

  @override
  FormzStatus get statusState => status;
  
  @override
  Failure? get errorState => failure;
  
  bool get isLoading => status == FormzStatus.submissionInProgress;
}

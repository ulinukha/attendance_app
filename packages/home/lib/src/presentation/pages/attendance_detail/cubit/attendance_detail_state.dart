part of 'attendance_detail_cubit.dart';

@freezed
class AttendanceDetailState with _$AttendanceDetailState 
implements BasePageState {
    const AttendanceDetailState._();
    const factory AttendanceDetailState ({
        required FormzStatus status,
        Failure? failure
      }) = _AttendanceDetailState;

     factory AttendanceDetailState.initial() => AttendanceDetailState(
      status : FormzStatus.pure,
    );

  @override
  FormzStatus get statusState => status;
  
  @override
  Failure? get errorState => failure;
  
  bool get isLoading => status == FormzStatus.submissionInProgress;
}

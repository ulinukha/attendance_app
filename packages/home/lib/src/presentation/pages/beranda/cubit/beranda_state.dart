part of 'beranda_cubit.dart';

@freezed
class BerandaState with _$BerandaState 
implements BasePageState {
    const BerandaState._();
    const factory BerandaState ({
        required FormzStatus status,
        Failure? failure,
        required bool isAdmin,
        required Company company,
        required List<Attendance> attendances,
        required Completer<GoogleMapController> mapsController,
      }) = _BerandaState;

     factory BerandaState.initial() => BerandaState(
      status : FormzStatus.pure,
      mapsController: Completer(),
      isAdmin: true,
      company: Company(),
      attendances: [],
    );

  @override
  FormzStatus get statusState => status;
  
  @override
  Failure? get errorState => failure;
  
  bool get isLoading => status == FormzStatus.submissionInProgress;
}

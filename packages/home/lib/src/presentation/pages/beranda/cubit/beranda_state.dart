part of 'beranda_cubit.dart';

@freezed
class BerandaState with _$BerandaState 
implements BasePageState {
    const BerandaState._();
    const factory BerandaState ({
        required FormzStatus status,
        Failure? failure,
        required CameraPosition cameraPosition,
      }) = _BerandaState;

     factory BerandaState.initial() => BerandaState(
      status : FormzStatus.pure,
      cameraPosition: CameraPosition(
        target: LatLng(-6.175819, 106.827142), 
        zoom: 15
      )
    );

  @override
  FormzStatus get statusState => status;
  
  @override
  Failure? get errorState => failure;
  
  bool get isLoading => status == FormzStatus.submissionInProgress;
}

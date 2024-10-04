part of 'setup_point_cubit.dart';

@freezed
class SetupPointState with _$SetupPointState 
implements BasePageState {
    const SetupPointState._();
    const factory SetupPointState ({
        required FormzStatus status,
        Failure? failure,
        required Completer<GoogleMapController> mapsController,
        required LatLng longLat,
        required Company company,
      }) = _SetupPointState;

     factory SetupPointState.initial() => SetupPointState(
      status : FormzStatus.pure,
      mapsController: Completer(),
      longLat: const LatLng(0,0),
      company: Company()
    );

  @override
  FormzStatus get statusState => status;
  
  @override
  Failure? get errorState => failure;
  
  bool get isLoading => status == FormzStatus.submissionInProgress;
}

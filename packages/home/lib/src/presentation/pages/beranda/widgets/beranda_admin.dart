part of '../beranda_page.dart';

class BerandaAdmin extends StatelessWidget {
  const BerandaAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Company : PT. Sejah Tera Abadi",
          style: DsBoldText.header5,
        ).marginOnly(bottom: 4),
        Text("Long : 1.312312",
          style: DsRegularText.body1,
        ).marginOnly(bottom: 4),
        Text("Lat : 1.312312",
          style: DsRegularText.body1,
        ).marginOnly(bottom: 4),
        SizedBox(
          width: context.screenWidth,
          height: context.screenHeight * 0.4,
          child: BlocSelector<BerandaCubit, BerandaState, CameraPosition>(
            selector: (state) => state.cameraPosition, 
            builder: (context, state) => GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: state,
          ))
        )
      ],
    );
  }
}
part of '../beranda_page.dart';

class BerandaAdmin extends StatelessWidget {
  const BerandaAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final company =
        context.select((BerandaCubit cubit) => cubit.state.company);
    return ListView(
      children: [
        Text("Company : ${company.title ?? ''}",
          style: DsBoldText.header5,
        ).marginOnly(bottom: 4),
        Text("Long : ${company.longitude ?? 0}",
          style: DsRegularText.body1,
        ).marginOnly(bottom: 4),
        Text("Lat : ${company.latitude ?? 0}",
          style: DsRegularText.body1,
        ).marginOnly(bottom: 24),
        SizedBox(
          height: context.screenHeight * 0.4,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.4,
                  child: BlocSelector<BerandaCubit, BerandaState, Completer<GoogleMapController>>(
                    selector: (state) => state.mapsController, 
                    builder: (context, state) => GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(-6.175819, 106.827142), 
                      zoom: 15
                    ),
                    onMapCreated: (GoogleMapController googleController) {
                      state.complete(googleController);
                    },
                    scrollGesturesEnabled: false,
                  ))
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.location_pin,
                  color: DsColors.dsDanger,
                  size: 42,
                ).marginOnly(bottom: 20),
              ),
            ],
          ).marginOnly(bottom: 42),
        ),
        DsButtons.build(
          context,
          data: DsButtonsData(
            text: "Setup Clock In Point",
            onTap: () => di<HomeNavigationRepository>().pushToSetupPoint(context)
          ),
        )
      ],
    );
  }
}
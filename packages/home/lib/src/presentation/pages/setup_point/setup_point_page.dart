import 'dart:async';

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

export 'cubit/setup_point_cubit.dart';

class SetupPointPage extends StatelessWidget {
  const SetupPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SetupPointCubit>()..init(),
      child: const SetupPointUI(),
    );
  }
}

class SetupPointUI extends StatelessWidget {
  const SetupPointUI({super.key});

  @override
  Widget build(BuildContext context) {
    final string = context.intl;
    return BasePage<SetupPointCubit,SetupPointState>(
      child: BlocListener<SetupPointCubit, SetupPointState>(
        listenWhen: (pre, cur) => pre.status != cur.status,
        listener: (context, state) {
          if (state.status == FormzStatus.submissionSuccess) {
            context.pop();
            showBaseDialog(
              context,
              title: string.success,
              desc: "Success change clock in poin",
              isSuccess: true
            );
          }
          if (state.status == FormzStatus.submissionFailure) {
            showBaseDialog(
              context,
              title: string.failed,
              desc: "Failed to setup new clock in point",
              isFailed: true
            );
          }
        },
        child: DesignScaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Setup Clock In Point",
              style: DsMediumText.header5,
            ),
          ),
          body: Stack(
            children: [
              BlocSelector<SetupPointCubit, SetupPointState, Completer<GoogleMapController>>(
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
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                onCameraMove: (position) => context.read<SetupPointCubit>().onUpdateLatLong(
                  LatLng(position.target.latitude, position.target.longitude)
                ),
              )),
              Align(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.location_pin,
                  color: DsColors.dsDanger,
                  size: 42,
                ).marginOnly(bottom: 20),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DsButtons.build(
                    context,
                    data: DsButtonsData(
                      text: "Setup Clock In Point",
                      onTap: () => context.read<SetupPointCubit>().updateCompanyLongLat()
                    ),
                  ).marginOnly(bottom: 24),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}

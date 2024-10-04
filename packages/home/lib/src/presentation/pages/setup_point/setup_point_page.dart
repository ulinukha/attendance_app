import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

export 'cubit/setup_point_cubit.dart';

class SetupPointPage extends StatelessWidget {
  const SetupPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SetupPointCubit>(),
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
      child: DesignScaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            ],
          ),
        )
      )
    );
  }
}

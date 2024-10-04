import 'dart:async';

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

export 'cubit/beranda_cubit.dart';

part 'widgets/beranda_user.dart';
part 'widgets/beranda_admin.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({
    required this.isAdmin,
    super.key});
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<BerandaCubit>()..init(isAdmin),
      child: const BerandaUI(),
    );
  }
}

class BerandaUI extends StatelessWidget {
  const BerandaUI({super.key});

  @override
  Widget build(BuildContext context) {
    final string = context.intl;
    return BasePage<BerandaCubit,BerandaState>(
      child: DesignScaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocSelector<BerandaCubit, BerandaState, bool>(
                    selector: (state) => state.isAdmin, 
                    builder: (context, state) => Text(
                      string.home_hello_user(state ? 'Admin' : 'User'),
                      style: DsBoldText.header3,
                    ),
                  ),
                  BaseInkWell(
                    onTap: () => di<HomeNavigationRepository>().pushToLogin(context), 
                    child: const Icon(
                      Icons.exit_to_app_rounded,
                      color: DsColors.dsDanger,
                      weight: 46,
                    ))
                ],
              ).marginOnly(bottom: 12),
              Expanded(
                child: BlocSelector<BerandaCubit, BerandaState, bool>(
                  selector: (state) => state.isAdmin, 
                  builder: (context, state) => state ?
                  const BerandaAdmin() : const BerandaUser(),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

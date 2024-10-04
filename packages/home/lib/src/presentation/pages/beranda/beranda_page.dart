import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

export 'cubit/beranda_cubit.dart';

part 'widgets/beranda_user.dart';
part 'widgets/beranda_admin.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<BerandaCubit>(),
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
              const SizedBox(height: 12,),
              Text(string.home_hello_user('Admin'),
                style: DsBoldText.header3,
              ).marginOnly(bottom: 12),
              Expanded(
                child: BerandaAdmin(),
              )
            ],
          ),
        )
      )
    );
  }
}

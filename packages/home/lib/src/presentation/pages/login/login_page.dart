import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

export 'cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<LoginCubit>(),
      child: const LoginUI(),
    );
  }
}

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    final string = context.intl;
    return BasePage<LoginCubit,LoginState>(
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (pre, cur) => pre.status != cur.status,
        listener: (context, state) {
          if (state.status == FormzStatus.submissionSuccess) {
            di<HomeNavigationRepository>().pushToBeranda(context);
          }
          if (state.status == FormzStatus.submissionFailure) {
            showBaseDialog(
              context,
              title: string.failed,
              desc: state.errMsg,
              isFailed: true
            );
          }
        },
        child: DesignScaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24,),
                Center(
                  child: Text(string.auth_login,
                    style: DsBoldText.header3,
                  ).marginOnly(bottom: 7),
                ),
                Center(
                  child: Text(string.auth_welcome_attendance_app,
                    style: DsMediumText.header5.copyWith(color: DsColors.neutral.shade600),
                  ).marginOnly(bottom: 24),
                ),
                BlocSelector<LoginCubit, LoginState, TextEditingController>(
                  selector: (state) => state.userId,
                  builder: (context, state) => DsTextField(
                    controller: state,
                    text: string.auth_id_user,
                    required: true,
                    hintText: string.auth_input_id,
                  ),
                ).marginOnly(bottom: 24),
                BlocSelector<LoginCubit, LoginState, TextEditingController>(
                  selector: (state) => state.password,
                  builder: (context, state) => DsTextField(
                    controller: state,
                    text: string.auth_password,
                    required: true,
                    hintText: string.auth_input_password,
                    isPassword: true,
                  ),
                ).marginOnly(bottom: 42),
                DsButtons.build(
                  context,
                  data: DsButtonsData(
                    text: string.auth_login,
                    onTap: () => context.read<LoginCubit>().onLogin()
                  ),
                )
              ],
            ),
          )
        ),
      )
    );
  }
}

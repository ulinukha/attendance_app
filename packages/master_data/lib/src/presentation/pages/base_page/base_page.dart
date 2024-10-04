import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

import 'base_loading_animation.dart';
import 'base_page_loading.dart';

export 'base_page_state.dart';
export 'base_page_listener.dart';

enum ErrorType {
  errorGeneral,
  errorMaintenance,
  errorConnection,
  errorLimitOtp
}

class BasePage<BLOC extends BlocBase<STATE>, STATE extends BasePageState>
    extends StatelessWidget {
  final Widget child;
  final Widget? loading;
  final ({String title, Function() onTap})? Function(Failure?)?
      onErrorPositiveButton;
  final ({String title, Function() onTap})? Function(Failure?)?
      onErrorNegativeButton;
  final Function(STATE)? onSucces;
  final List<String>? exceptionErrors;
  final bool isAutoClearErrorState;
  final bool hardReset;
  final String? Function(Failure?)? title;
  final bool hideLoadbar;

  const BasePage({
    super.key,
    required this.child,
    this.loading,
    this.onSucces,
    this.exceptionErrors,
    this.isAutoClearErrorState = true,
    this.hardReset = false,
    this.title,
    this.onErrorPositiveButton,
    this.onErrorNegativeButton,
    this.hideLoadbar = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<BLOC, STATE>(
      listenWhen: (previous, current) =>
          previous.statusState != FormzStatus.submissionSuccess &&
          current.statusState == FormzStatus.submissionSuccess,
      listener: (_, state) {
        if (state.statusState == FormzStatus.submissionSuccess) {
          if (onSucces != null) onSucces!(state);
        }
      },
      child: BlocListener<BLOC, STATE>(
        listener: (_, state) {
          final failure = state.errorState;
          if (state.errorState != null) {
            
          }
        },
        child: BlocBuilder<BLOC, STATE>(
          buildWhen: (previous, current) {
            return previous.statusState != current.statusState;
          },
          builder: (ctx, state) {
            return BasePageLoading(
              dismissible: false,
              isLoading:
                  state.statusState == FormzStatus.submissionInProgress &&
                      !hideLoadbar,
              progressIndicator: const BaseLoadingAnimation(),
              child: child,
            );
          },
        ),
      ),
    );
  }

  bool notShowErrorSame(STATE previous, STATE current) {
    return (current.errorState != null
        ? previous.errorState != current.errorState
        : current.errorState == null);
  }
}

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

export 'cubit/attendance_detail_cubit.dart';

class AttendanceDetailPage extends StatelessWidget {
  const AttendanceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AttendanceDetailCubit>(),
      child: const AttendanceDetailUI(),
    );
  }
}

class AttendanceDetailUI extends StatelessWidget {
  const AttendanceDetailUI({super.key});

  @override
  Widget build(BuildContext context) {
    final string = context.intl;
    return BasePage<AttendanceDetailCubit,AttendanceDetailState>(
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

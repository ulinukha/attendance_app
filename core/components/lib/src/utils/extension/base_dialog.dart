import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog(
    {required this.title,
    required this.desc,
    this.isFailed = false,
    this.isSuccess = false,
    super.key});
  final String title;
  final String desc;
  final bool isFailed;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: context.screenWidth * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    title,
                    style: DsBoldText.header5.copyWith(
                      color: isFailed ? DsColors.dsDanger 
                      : isSuccess ? DsColors.greenChart : null),
                  ).marginOnly(bottom: 24),
                  Text(
                    desc,
                    style: DsMediumText.body1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(
                color: DsColors.dsGrey50,
              ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: DsButtons.build(
                  context,
                  data: DsButtonsData(
                    text: "Close",
                    buttonColor: isFailed ? 
                      DsColors.dsDanger : 
                      isSuccess ? DsColors.greenChart : null,
                    onTap: () => context.pop()
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

void showBaseDialog(BuildContext context, 
  {required String title, required String desc, bool? isFailed, bool? isSuccess}
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BaseDialog(
        title: title,
        desc: desc,
        isFailed: isFailed ?? false,
        isSuccess: isSuccess ?? false,
      );
    },
  );
}
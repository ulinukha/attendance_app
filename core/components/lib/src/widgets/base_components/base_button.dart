import 'package:components/components.dart';
import 'package:flutter/material.dart';

class DsButtonsData {
  /// you could use prefix and not passing the string if you want a button that consist of only widgets
  final String text;

  /// when isLoading is true, isEnabled will automatically be false
  final bool isEnabled;
  final bool isLoading;
  final Color? buttonColor;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? overrideTextStyle;
  final double? heigth;
  final double? width;
  final Function()? onTap;
  final Color? borderColor;
  final double borderRadius;

  DsButtonsData({
    this.text = '',
    this.overrideTextStyle,
    this.buttonColor,
    this.isEnabled = true,
    this.isLoading = false,
    this.heigth,
    this.width,
    this.prefix,
    this.suffix,
    this.onTap,
    this.borderColor,
    this.borderRadius = 12
  });
}

class DsButtons extends StatelessWidget {
  final DsButtonsData data;

  const DsButtons({super.key, required this.data});

  factory DsButtons.build(
    BuildContext context, {
    required DsButtonsData data,
  }) =>
      DsButtons(
        data: DsButtonsData(
          buttonColor: data.buttonColor ?? DsColors.dsPrimary,
          isEnabled: data.isEnabled,
          prefix: data.prefix,
          suffix: data.suffix,
          text: data.text,
          onTap: data.onTap ?? () {},
          overrideTextStyle: data.overrideTextStyle,
          isLoading: data.isLoading,
          heigth: data.heigth,
          width: data.width,
          borderColor: data.borderColor,
          borderRadius: data.borderRadius
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: data.width ?? double.infinity,
      height: data.heigth ?? 48,
      child: InkWell(
        onTap: () {
          if (data.isEnabled && !data.isLoading && data.onTap != null) data.onTap!.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: data.isEnabled ? data.buttonColor : DsColors.dsGrey50,
            borderRadius: BorderRadius.circular(data.borderRadius),
            border: Border.all(color: data.borderColor ?? Colors.transparent)
          ),
          child: data.isLoading ?
          const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: DsColors.dsWhite,
              ),
            ),
          ) :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data.prefix != null) data.prefix!,
              Text(data.text,
                style: data.overrideTextStyle ?? DsMediumText.header4.copyWith(color: DsColors.dsWhite),
              ),
              if (data.suffix != null) data.suffix!,
            ],
          ),
        ),
      ),
    );
  }
}

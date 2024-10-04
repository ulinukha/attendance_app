import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DsTextField extends StatefulWidget {
  const DsTextField({
    required this.controller,
    this.hintText,
    this.onChanged,
    this.label,
    this.autofocus = false,
    this.height = 52,
    this.inputFormatters,
    this.textColor,
    this.textStyle,
    this.hintStyle,
    this.keyboardType,
    this.border,
    this.prefix,
    this.isPassword = false,
    this.required = false,
    this.text = '',
    super.key});
  final TextEditingController controller;
  final String? hintText;
  final Function(String)? onChanged;
  final String? label;
  final bool autofocus;
  final double height;
  final List<TextInputFormatter>? inputFormatters;
  final Color? textColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final bool isPassword;
  final String text;
  final bool required;

  @override
  State<DsTextField> createState() => _DsTextFieldState();
}

class _DsTextFieldState extends State<DsTextField> {
  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.text.isNotEmpty)
        Row(
          children: [
            Text(widget.text,
              style: DsMediumText.body1,
            ).marginOnly(right: 4),
            Text(
              '*',
              style: DsMediumText.body1.copyWith(color: DsColors.dsDanger),
            ),
          ],
        ).marginOnly(bottom: 4),
        SizedBox(
          height: widget.height,
          child: TextField(
            controller: widget.controller,
            cursorColor: DsColors.dsPrimaryDark,
            onChanged: widget.onChanged,
            autofocus: widget.autofocus,
            inputFormatters: widget.inputFormatters,
            style: widget.textStyle ?? DsRegularText.body1.copyWith(
              color: widget.textColor ?? DsColors.dsBlack
            ),
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? _obscureText : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ?? DsRegularText.body1.neutral50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), 
                borderSide: const BorderSide(color: DsColors.dsPrimary),
              ), 
              label: widget.label != null ? Text(widget.label ?? '',
                style:  DsRegularText.body1.neutral50
              ) : null,
              prefix: widget.prefix,
              suffixIcon: widget.isPassword ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ) : null,
            ),
          ),
        ),
      ],
    );
  }
}
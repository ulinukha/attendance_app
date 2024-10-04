import 'package:components/src/theme/ds_colors.dart';
import 'package:flutter/material.dart';

import 'index.dart';

const FontStyle italicStyle = FontStyle.italic;
const TextDecoration underlineStyle = TextDecoration.underline;

class DsRegularText {
  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 20 / 16,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14,
    height: 16 / 14,
  );

  static const TextStyle caption1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    height: 12 / 12,
  );

  static const TextStyle caption2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 10,
    height: 12 / 10,
  );

  static const TextStyle header1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 50,
    height: 60 / 50,
  );

  static const TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 36,
    height: 44 / 36,
  );

  static const TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 28,
    height: 36 / 28,
  );

  static const TextStyle header4 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 20,
    height: 28 / 20,
  );
  static const TextStyle header5 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 24 / 18,
  );
}

class DsMediumText {
  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 20 / 16,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 16 / 14,
  );

  static const TextStyle caption1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 12 / 12,
  );

  static const TextStyle caption2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    height: 10 / 10,
  );

  static const TextStyle header1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 50,
    height: 60 / 50,
  );

  static const TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 36,
    height: 44 / 36,
  );

  static const TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 28,
    height: 36 / 28,
  );

  static const TextStyle header4 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 28 / 20,
  );
  static const TextStyle header5 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 24 / 18,
  );
}

class DsBoldText {
  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 16,
    height: 20 / 16,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 14,
    height: 16 / 14,
  );

  static const TextStyle caption1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 12,
    height: 12 / 12,
  );

  static const TextStyle caption2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 10,
    height: 14 / 10,
  );

  static const TextStyle header1 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 50,
    height: 60 / 50,
  );

  static const TextStyle header2 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 36,
    height: 44 / 36,
  );

  static const TextStyle header3 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 28,
    height: 36 / 28,
  );

  static const TextStyle header4 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 20,
    height: 28 / 20,
  );
  static const TextStyle header5 = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18,
    height: 24 / 18,
  );
}

extension TextStyling on TextStyle {
  TextStyle get black => copyWith(
        color: Colors.black,
      );
  TextStyle get white => copyWith(
        color: Colors.white,
      );
  TextStyle get dsPrimary => copyWith(
        color: DsColors.dsPrimary,
      );
  TextStyle get dsPrimaryDark => copyWith(
        color: DsColors.dsPrimaryDark,
      );
  TextStyle get neutral80 => copyWith(
        color: DsColors.neutral.shade800,
      );
  TextStyle get neutral70 => copyWith(
        color: DsColors.neutral.shade700,
      );
  TextStyle get neutral60 => copyWith(
        color: DsColors.neutral.shade600,
      );
  TextStyle get neutral50 => copyWith(
        color: DsColors.neutral.shade500,
      );
  TextStyle get neutral40 => copyWith(
        color: DsColors.neutral.shade400,
      );
  TextStyle get neutral20 => copyWith(
        color: DsColors.neutral.shade200,
      );
  TextStyle get red50 => copyWith(
        color: DsColors.negative.shade500,
      );
  TextStyle get red70 => copyWith(
        color: DsColors.negative.shade700,
      );
  TextStyle get red90 => copyWith(
        color: DsColors.negative.shade900,
      );
  TextStyle get red90HalfOpacity =>
      copyWith(color: DsColors.negative.shade900.withOpacity(0.5));
  TextStyle get positive90 => copyWith(
        color: DsColors.positive.shade900,
      );
  TextStyle get positive90HalfOpacity => copyWith(
        color: DsColors.positive.shade900.withOpacity(0.5),
      );
  TextStyle get positive70 => copyWith(
        color: DsColors.positive.shade700,
      );
  TextStyle get warning90 => copyWith(
        color: DsColors.warning.shade900,
      );
  TextStyle get warning70 => copyWith(
        color: DsColors.warning.shade700,
      );
  TextStyle get purple50 => copyWith(
        color: DsColors.primary.shade500,
      );
  TextStyle get purple60 => copyWith(
        color: DsColors.primary.shade600,
      );
  TextStyle get purple70 => copyWith(
        color: DsColors.primary.shade700,
      );
  TextStyle get grey => copyWith(
        color: DsColors.textGrey,
      );
  TextStyle get primary => copyWith(
        color: DsColors.primary,
      );
  TextStyle get secondary => copyWith(
        color: DsColors.secondary,
      );
  TextStyle get orange80 => copyWith(
        color: DsColors.orange.shade800,
      );
  TextStyle get green => copyWith(
        color: DsColors.green,
      );
  TextStyle get light => copyWith(
        color: DsColors.light,
      );
  TextStyle get dark => copyWith(
        color: DsColors.dark,
      );
  TextStyle toggleColor(
    bool? condition, {
    Color? active,
    Color? inactive,
  }) =>
      copyWith(
        color: condition! ? active : inactive,
      );
  TextStyle get strikeThrough => copyWith(
        decoration: TextDecoration.lineThrough,
      );

  TextStyle get italic {
    return merge(
      const TextStyle(
        fontStyle: italicStyle,
      ),
    );
  }

  TextStyle get underline {
    return merge(
      const TextStyle(
        decoration: underlineStyle,
        decorationColor: DsColors.dsBlack
      ),
    );
  }
}

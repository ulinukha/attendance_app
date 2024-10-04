import 'package:intl/intl.dart';

class DateFormatString {
  const DateFormatString._();

  static const String responseFormat = "dd-MM-yyyy HH:mm:ss";
  static const String dateTimeNowForTest = "dd-MM-yyyy HH:mm";
  static const String dateOneMonthYearStrips = 'dd-M-yyyy';

  /// output : 2024-12-20
  static const String stripsYearDateMonth = 'yyyy-MM-dd';

  static const String backSlashDateMonthYear = 'dd/MM/yyyy';

  /// output : 28 Agustus 2022 - 12:24
  static const String dateAndHourWithMMMM = "dd MMMM yyyy - HH:mm";

  ///output : 1 November 2022
  static const String singleDateMonthAndYear = 'd MMMM yyyy';

  ///output : 01 November 2022
  static const String dateMonthAndYear = 'dd MMMM yyyy';

  ///output : 01 Nov 2022
  static const String dateMonthYearAbrr = 'dd MMM yyyy';

  ///output : November 2022
  static const String monthAndYear = 'MMMM yyyy';

  ///output : 01 November
  static const String dateMonth = 'dd MMMM';

  ///output : 01 Nov
  static const String dateMonthArr = 'dd MMM';

  ///output : Nov 2022
  static const String monthYearAbr = 'MMM yyyy';

  ///output : 01-07-2022
  static const String dateMonthAndYearWithStrips = 'dd-MM-yyyy';

  ///output : 01/07/2022
  static const String dateMonthAndYearWithSlash = 'dd/MM/yyyy';

  ///output : 01-07-2022
  static const String monthAndYearWithStrips = 'MM-yyyy';

  ///output : Thu, 01 Nov 2022
  static const String dateMonthYearDayAbrr = 'EEE, dd MMM yyyy';

  ///output : Thu, 01 Nov
  static const String dateMonthDayAbrr = 'EEE dd MMM';

  ///output : 26/10/1996
  static const String dateDayMonthYear = 'dd/MM/yyyy';
}

extension NullableStringDateFormatter on String? {
  DateTime asDateTime(String format) {
    String currentDate = DateFormat(format).format(DateTime.now());
    return DateFormat(format).parse(this ?? currentDate);
  }

  DateTime? tryCatchAsDateTime(String format) {
    try {
      String currentDate = DateFormat(format).format(DateTime.now());
      return DateFormat(format).parse(this ?? currentDate);
    } catch (e) {
      return null;
    }
  }

  DateTime get utc7IsoStringtoDate {
    String modifiedDateString =
        this!.substring(0, 19); // Remove the timezone part

    DateFormat format = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateTime parsedDate = format.parse(modifiedDateString);

    return parsedDate;
  }
}

extension PakuwonDateFormatter on DateTime? {
  String asString(String format) {
    return DateFormat(format).format(this ?? DateTime.now());
  }

  String asStringWithDefault(String format, {String defaultValue = ''}) {
    try {
      return DateFormat(format).format(this!);
    } catch (e) {
      return defaultValue;
    }
  }

  DateTime get removeMicroSeconds {
    return DateFormat(DateFormatString.dateTimeNowForTest).parse(
      DateFormat(DateFormatString.dateTimeNowForTest)
          .format(this ?? DateTime.now()),
    );
  }
}

@Deprecated('use nullable string extension instead')
extension StringExtention on String {
  String dateFormat(String oldFormat, String newFormat) {
    try {
      var current = DateFormat(oldFormat);
      var excepted = DateFormat(newFormat);
      return excepted.format(current.parse(this));
    } catch (e) {
      return this;
    }
  }
}

class DateFormatter {
  static const String responseFormat = "yyyy-MM-dd HH:mm:ss.SSS";
  static const String ddMMMMyyyFormat = "dd MMMM yyyy";
  static const String ddMMMMFormat = "dd MMMM";
}

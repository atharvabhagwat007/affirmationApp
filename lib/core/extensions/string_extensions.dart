part of 'extensions.dart';

extension StringNullExt on String? {
  String orEmpty() => this ?? StringConstants.emptyString;

  bool isNullOrEmpty() => this == null || this!.isEmpty;

  String comma() => this?.let((val) => '$val,') ?? StringConstants.emptyString;

  String and() => this?.let((val) => '$val &') ?? StringConstants.emptyString;

  String space() => this?.let((val) => '$val ') ?? StringConstants.emptyString;

  String period() => this?.let((val) => '$val.') ?? StringConstants.emptyString;

  String append(String newValue) =>
      this?.let((val) => '$val$newValue') ?? StringConstants.emptyString;
}

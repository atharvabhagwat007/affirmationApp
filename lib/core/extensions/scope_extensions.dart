part of 'extensions.dart';

extension ScopeExt<T> on T {
  R let<R>(R Function(T it) op) => op(this);

  T also(void Function(T it) op) {
    op(this);
    return this;
  }
}

extension DefaultExt<T> on T? {
  T orDefault(T defaultValue) => this ?? defaultValue;

  bool isNotNull() => this != null;

  bool isNull() => this == null;
}

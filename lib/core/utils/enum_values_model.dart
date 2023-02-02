class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String>? _reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (_reverseMap != null) {
      _reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return _reverseMap!;
  }
}

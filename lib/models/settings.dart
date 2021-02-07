class Settings {
  final bool isLightMode;
  final bool isBigSize;

  Settings({this.isLightMode = false, this.isBigSize = false});

  int _convertBoolsToSql(bool boolData) {
    return boolData == false ? 0 : 1;
  }

  Map<String, Object> toMap() {
    int _isLight = _convertBoolsToSql(isLightMode);
    int _isBigText = _convertBoolsToSql(isBigSize);

      return {
        "id": "settingsId",
        "isLight": _isLight,
        "isBigText": _isBigText,
      };
  }
}

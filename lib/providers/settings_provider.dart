// import 'package:flutter/material.dart';
// import '../models/book_mark.dart';
// import '../models/settings.dart';
// import '../models/menu_model.dart';
// import '../helpers/db_helper.dart';
// import '../managers/book_index.dart';
// import './book_provider.dart';

// class SettingsProvider extends ChangeNotifier {
//   Map<String, Object> _data;
//   bool _isLightMode;
//   bool _isBigSize;

//   Settings get currentSettings =>
//       Settings(isLightMode: _isLightMode, isBigSize: _isBigSize);

//   bool _convertBools(double sqlData) {
//     return sqlData == 0 ? false : true;
//   }

//   Future<void> fetchSettings() async {
//     _data = await DbHelper.getSettings();
//     _isLightMode = _convertBools(_data["isLight"]);
//     _isBigSize = _convertBools(_data["isBigText"]);
//   }

//   void saveSettings(Settings settings) {
//     DbHelper.updateSettings(settings.toMap());
//   }
// }

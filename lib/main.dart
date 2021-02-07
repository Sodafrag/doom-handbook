import 'package:doom/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './helpers/db_helper.dart';
import './screens/read_screen.dart';
import './screens/library_screen.dart';
import './themes/themes.dart';
import './providers/library_provider.dart';
import './providers/book_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  ThemeMode _themeMode = ThemeMode.dark;
  bool _isLightMode = false;
  bool _isBigSize = false;
  double _textModifier = 0.0;
  Settings get currentSettings =>
      Settings(isLightMode: _isLightMode, isBigSize: _isBigSize);

//   Settings get currentSettings {

// setState(() {
//   Settings(isLightMode: _isLightMode, isBigSize: _isBigSize);
// });
//   }

  var snackBar = SnackBar(content: Text("snack bar here"));

  @override
  void initState() {
    fetchSettings();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      DbHelper.updateSettings(currentSettings.toMap());
    }
    super.didChangeAppLifecycleState(state);
  }

  void _toggleTheme() {
    _isLightMode = !_isLightMode;
    _isLightMode ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
    loadSettings();
  }

  void _toggleTextSize() {
    setState(() {
      _isBigSize = !_isBigSize;
      _isBigSize ? _textModifier = 4.0 : _textModifier = 0.0;
    });
  }

  void loadSettings() {
    setState(() {
      _isLightMode ? _themeMode = ThemeMode.light : _themeMode = ThemeMode.dark;
      _isBigSize ? _textModifier = 6.0 : _textModifier = 0.0;
    });
  }

  bool _convertBools(int sqlData) {
    return sqlData == 0 ? false : true;
  }

  Future<void> fetchSettings() async {
    List<Map<String, Object>> _data;
    _data = await DbHelper.getSettings();
    if (_data.isNotEmpty) {
      _isLightMode = _convertBools(_data.first["isLight"]);
      _isBigSize = _convertBools(_data.first["isBigText"]);
      // loadSettings();
    }
    loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BooKProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LibraryProvider(),
        )
      ],
      child: MaterialApp(
        title: 'DOOM',
        theme: getThemes()[0],
        darkTheme: getThemes()[1],
        themeMode: _themeMode,
        home: ReadScreen(
          _toggleTheme,
          _toggleTextSize,
          textModifier: _textModifier,
          settings: currentSettings,
        ),
        routes: {
          LibraryScreen.routeName: (context) => LibraryScreen(
                textModifier: _textModifier,
              ),
        },
      ),
    );
  }
}

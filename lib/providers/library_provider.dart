import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LibraryProvider with ChangeNotifier {
  String overview;

  Future<String> fetchEntry(String filePath) async {
    const format = ".txt";
    return await rootBundle.loadString(filePath + format);
  }

  Future<void> fetchOverview(String filePath) async {
    const format = ".txt";
    overview = await rootBundle.loadString(filePath + format);
    notifyListeners();
  }
}

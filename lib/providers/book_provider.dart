import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/menu_model.dart';
import '../managers/book_index.dart';
import '../models/settings.dart';
import '../helpers/db_helper.dart';
import '../models/book_mark.dart';

class BooKProvider with ChangeNotifier {
  static Chapter initialChpter = bookIndex.first.chapters.first;
  bool isLoading = false;
  String chapterData = "";
  Chapter previousChapter;
  Chapter nextChapter;
  Chapter currentChapter;
  String currentChptTitle;
  int currentSectionNumber;
  BookMark localBookMark =
      BookMark(scrollIndex: 0.0, bookMark: bookIndex.first.chapters.first);

  // void changeSettings(Settings setConfig) {
  //   localSetting = setConfig;

  //   int isLight = setConfig.isLightMode ? 1 : 0;
  //   int isBigSize = setConfig.isBigSize ? 1 : 0;

  //   var settings = {
  //     "id": "loacalSettings",
  //     "isLight": isLight,
  //     "isBigText": isBigSize,
  //   };

  //   DbHelper.updateSettings(settings);
  // }

  // Future<void> loadSettings(Settings settings) {
  //     getChapter(data);
  // }

  Future<void> getChapter(Chapter data) async {
    final section = data.section;
    final chapter = data.chapter;
    currentChapter = data;
    final String _path = "assets/text/section_$section/chpt_$chapter.txt";
    isLoading = true;
    notifyListeners();
    getPreviousChapter(data);
    getNextChapter(data);
    currentSectionNumber = section;
    currentChptTitle = data.chapterTitle;
    chapterData = await rootBundle.loadString(_path);
    isLoading = false;
    notifyListeners();
  }

  getPreviousChapter(Chapter currentChpt) {
    int sectionIndex = currentChpt.section;
    int chapterIndex = currentChpt.chapter - 1;
    bool _isFirstChapter =
        (currentChpt.section == 0 && currentChpt.chapter == 1);
    if (_isFirstChapter) {
      previousChapter = null;
    } else if (chapterIndex == 0) {
      // check if need to go previous section
      int previousSectionIndex = sectionIndex - 1;
      Section previousSection = bookIndex[previousSectionIndex];
      int lastChapterIndexInPreviousSection =
          previousSection.chapters.length - 1;

      previousChapter = bookIndex[sectionIndex - 1]
          .chapters[lastChapterIndexInPreviousSection];
    } else {
      previousChapter = bookIndex[sectionIndex].chapters[chapterIndex - 1];
    }
  }

  getNextChapter(Chapter currentChpt) {
    int sectionIndex = currentChpt.section;
    int chapterIndex = currentChpt.chapter - 1;
    final totalSections = bookIndex.length;
    final bool _isLastChapter = currentChpt.section == totalSections - 1 &&
        currentChpt.chapter == bookIndex.last.chapters.last.chapter;
    if (_isLastChapter) {
      nextChapter = null;
    } else if (currentChpt.chapter == currentChpt.total) {
      // check if need to go next section
      Section nextSection = bookIndex[sectionIndex + 1];
      nextChapter = nextSection.chapters[0];
    } else {
      nextChapter = bookIndex[sectionIndex].chapters[chapterIndex + 1];
    }
  }

  Future<void> fetchBookMark() async {
    List _data = await DbHelper.getBookmark();
    if (_data.isEmpty) {
    getChapter(initialChpter);
    } else {
    int _section = _data[0]["section"];
    int _chapter = _data[0]["chapter"];
    double _scrollIndex = _data[0]["scrollIndex"];
    Chapter _chapterData = bookIndex[_section].chapters[_chapter - 1];
    localBookMark = BookMark(scrollIndex: _scrollIndex, bookMark: _chapterData);
    print("fetch book mark in provider");
    getChapter(_chapterData);
    }
  }

  Future<void> saveBookMark(double scrollIndex) async {
    var bookMark = {
      "id": "settingsId",
      "scrollIndex": scrollIndex,
      "section": currentChapter.section,
      "chapter": currentChapter.chapter,
    };
    DbHelper.updateBookmark(bookMark);
  }

  void saveSettings(Settings settings) {
    DbHelper.updateSettings(settings.toMap());
  }
}

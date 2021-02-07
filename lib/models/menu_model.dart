import 'package:flutter/foundation.dart';

class Section {
  @required
  final String sectionTitle;
  final String cover;
  final String shortDescription;
  final List<Chapter> chapters;

  Section(this.sectionTitle, this.shortDescription,
      {this.cover, this.chapters});
}

class Chapter {
  final int total;
  final String chapterTitle;
  final String shortDescription;
  final int section;
  final int chapter;

  Chapter(this.chapterTitle, this.shortDescription,
      {@required this.total, @required this.chapter, @required this.section});
}

import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';

class SectionMenu extends StatelessWidget {
  final Section section;
  final Function _scrollToTop;
  SectionMenu(this.section, this._scrollToTop);

  @override
  Widget build(BuildContext context) {
    _buildChapters() => section.chapters
        .map(
          (chpt) => Container(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9.0),
                  child: Text("•",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Provider.of<BooKProvider>(context, listen: false)
                          .getChapter(chpt);
                      _scrollToTop();
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(chpt.chapterTitle,
                              style: Theme.of(context).textTheme.headline2),
                          Text(chpt.shortDescription,
                              softWrap: true,
                              style: Theme.of(context).textTheme.subtitle1)
                        ]),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

    return Theme(
      data: Theme.of(context).copyWith(accentColor: Theme.of(context).unselectedWidgetColor),
          child: ExpansionTile(
        backgroundColor: Colors.yellow.withOpacity(0.05),
        tilePadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                section.sectionTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
              Divider(
                thickness: 1.0,
              ),
            ]),
            subtitle: Text(section.shortDescription,
                  style: Theme.of(context).textTheme.subtitle1),
        children: [..._buildChapters(), SizedBox(height: 20.0)],
        childrenPadding: EdgeInsets.symmetric(horizontal: 20.0),
      ),
    );
  }
}

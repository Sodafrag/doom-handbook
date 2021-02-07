import 'package:doom/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';

class BottomNavButtonNext extends StatelessWidget {
  final Function _scrollToTop;
  BottomNavButtonNext(this._scrollToTop,);
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<BooKProvider>(context, listen: false);
    Chapter _next = _provider.nextChapter;
    Chapter _previous = _provider.previousChapter;

    Widget _widgetIconBack = Container(
      decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(50.0)),
      alignment: Alignment.center,
      child: IconButton(
          color: Theme.of(context).textTheme.button.color,
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            _provider.getChapter(_previous);
            _scrollToTop();
          }),
    );

    Widget _widgetIconNext() => FlatButton.icon(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    textColor: Theme.of(context).textTheme.button.color,
    color: Theme.of(context).buttonColor,
    icon: Icon(Icons.arrow_forward_rounded),
    label: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 200),
      child: Text(_next.chapterTitle)),
    onPressed: () {
      _provider.getChapter(_next);
      _scrollToTop();
    });

    return SafeArea(
      top: false,
          child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 50.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _previous == null ? SizedBox() : _widgetIconBack,
            _next == null ? SizedBox() : _widgetIconNext(),
          ],
        ),
      ),
    );
  }
}

import 'package:doom/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';

import '../screens/library_screen.dart';

class SliverHeader extends SliverPersistentHeaderDelegate {
  final GlobalKey<ScaffoldState> _key;
  double height;
  SliverHeader(
    this._key,
    this.height,
  );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  double get minExtent => 90.0;

  @override
  double get maxExtent => 400;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double _opacity = shrinkOffset / 420;
    BoxDecoration _glassDecoration(context) => BoxDecoration(
          color: Theme.of(context).backgroundColor.withOpacity(_opacity),
          borderRadius: BorderRadius.circular(50.0),
        );

    void _toLibrary() {
      Navigator.of(context).pushNamed(LibraryScreen.routeName);
    }

    Widget _menuButton(context) {
      return Container(
        height: 38,
        margin: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
        decoration: _glassDecoration(context),
        child: IconButton(
          padding: EdgeInsets.zero,
          color: Theme.of(context).textTheme.headline2.color,
          icon: Icon(Icons.menu_rounded),
          onPressed: () => _key.currentState.openDrawer(),
        ),
      );
    }

    Widget _libraryButton(context) {
      return Positioned(
        right: 0,
        child: Container(
          height: 38,
          margin: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          decoration: _glassDecoration(context),
          child: IconButton(
            padding: EdgeInsets.zero,
            color: Theme.of(context).textTheme.headline2.color,
            icon: Icon(Icons.collections_bookmark),
            onPressed: _toLibrary,
          ),
        ),
      );
    }

    final Chapter currentChapter =
        Provider.of<BooKProvider>(context).currentChapter;
    final String _title = currentChapter.chapterTitle;
    final String _shortDescription = currentChapter.shortDescription;

    return Container(
      // decoration: _glassDecoration(context),
      child: Stack(fit: StackFit.expand, children: [
        // ShaderMask(
        //   shaderCallback:
        //   (_) => LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color.fromRGBO(255, 255, 255, _opacity),
        //       Color.fromRGBO(255, 255, 255, 0)
        //     ],
        //   ).createShader(_),
        //   blendMode: BlendMode.modulate,
        //   child: Image(
        //       width: shrinkOffset * 3, fit: BoxFit.cover, image: AssetImage(cover)),
        // ),
        PreferredSize(
          preferredSize: Size(double.infinity, maxExtent),
          child: SafeArea(
              bottom: false,
              child: Stack(children: [
                IgnorePointer(
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      height: maxExtent,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 80 - (shrinkOffset / 5)),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0 - 20 * shrinkOffset * 0.0025, vertical: 8.0),
                              decoration: _glassDecoration(context),
                              child: FittedBox(
                                child: Text(
                                  _title ?? "Waiting...",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .color
                                        .withOpacity(1 - _opacity / 1.5),
                                    fontSize: 32.0 - 14 * (shrinkOffset / 300),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 1 - _opacity,
                              child: Divider(
                                thickness: 0.0,
                                height: 20,
                                indent: 40,
                                endIndent: 40,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 45.0, vertical: 15.0),
                              child: Text(
                                _shortDescription,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                _menuButton(context),
                _libraryButton(context),
              ])),
        ),
      ]),

      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: AssetImage(image)),
      //   ),
      height: maxExtent,
    );
  }
}

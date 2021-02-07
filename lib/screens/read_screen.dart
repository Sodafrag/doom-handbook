import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as fmd;
import 'package:provider/provider.dart';

import '../widgets/sliver_header.dart';
import '../widgets/menu_drawer.dart';
import '../widgets/explain_boad.dart';
import '../providers/book_provider.dart';
import '../widgets/bottom_nav_button_next.dart';
import '../models/settings.dart';
import '../widgets/loading.dart';
import '../widgets/cover.dart';

class ReadScreen extends StatefulWidget {
  static const String routeName = "/read_screen";
  final Function _toggleTheme;
  final Function _toggleTextSize;
  final double textModifier;
  final Settings settings;
  ReadScreen(this._toggleTheme, this._toggleTextSize,
      {this.textModifier, @required this.settings});

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  // String data;
  double topBarOpac = 1;

  final GlobalKey<ScaffoldState> _scaffod = GlobalKey();

  final StreamController<String> _streamController =
      StreamController.broadcast();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initiateScrollIndex();
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      Provider.of<BooKProvider>(context, listen: false)
          .saveBookMark(_scrollController.offset);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _streamController.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.jumpTo(
      0.0,
    );
  }

  // void _initiateChapter() {
  //   Provider.of<BooKProvider>(context, listen: false).fetchBookMark();
  // }

  void _initiateScrollIndex() async {
    var _data = Provider.of<BooKProvider>(context, listen: false);
    await _data.fetchBookMark();
    Timer(Duration(milliseconds: 800),() {
      _scrollController.animateTo(_data.localBookMark.scrollIndex ?? 0.0,
        duration: Duration(milliseconds: 150), curve: Curves.easeIn);
    } );
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _styles = fmd.MarkdownStyleSheet(
        blockSpacing: 25.0,
        blockquotePadding:
            EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        blockquoteDecoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: Theme.of(context).buttonColor, width: 6.0)),
            color: Theme.of(context).accentColor),
        blockquote: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(fontSize: 17 + widget.textModifier),
        tableHead: Theme.of(context).textTheme.headline3,
        listBullet: Theme.of(context).textTheme.bodyText1,
        h2: Theme.of(context).textTheme.headline4,
        h1: Theme.of(context).textTheme.headline1,
        h3: Theme.of(context).textTheme.headline3,
        p: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 18 + widget.textModifier));

    // var chapterData = Provider.of<BooKProvider>(context).chapterData;

    _buildBody(context, BooKProvider provider) {
      
      return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: CustomScrollView(
          dragStartBehavior: DragStartBehavior.start,
          controller: _scrollController,
          slivers: 
          provider.chapterData.isEmpty
              ? <Widget>[
                  SliverFillViewport(
                      delegate: SliverChildListDelegate([Loading()]))
                ]
              : <Widget>[
                  if (provider.currentChapter.chapter == 1)
                    SliverToBoxAdapter(child: Cover()),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverHeader(_scaffod, _screenHeight),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: fmd.MarkdownBody(
                          data: provider.chapterData,
                          onTapLink: (text, href, title) {
                            // print("$text || $href || $title");
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10.0),
                                        right: Radius.circular(10.0))),
                                context: context,
                                builder: (_) {
                                  return ExplainBoard(
                                    name: text,
                                    href: href,
                                  );
                                });
                          },
                          imageBuilder: (uri, title, alt) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 10),
                                  Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(uri.path)),
                                  if (title != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Text(title,
                                      textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ),
                                  SizedBox(height: 10),
                                ]);
                          },
                          styleSheet: _styles,
                          selectable: true,
                        ),
                      ),
                      BottomNavButtonNext(
                        _scrollToTop,
                      ),
                    ]),
                  ),
                ],
        ),
      );
    }

    return Scaffold(
        key: _scaffod,
        drawerScrimColor: Colors.transparent,
        drawer: Theme(
          data: Theme.of(context),
          child: MenuDrawer(
            widget._toggleTheme,
            widget._toggleTextSize,
            _scrollToTop,
            settings: widget.settings,
          ),
        ),
        body: Consumer<BooKProvider>(
          builder: (context, provider, children) {
            return 
            provider.isLoading ? Loading() : _buildBody(context, provider);
          },
        ));
  }
}

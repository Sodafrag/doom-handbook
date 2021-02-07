import 'package:doom/providers/library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as fmd;
import 'package:provider/provider.dart';

import 'sliver_header_tab.dart';

class LibraryEntryTab extends StatefulWidget {
  final String title;
  final String filePath;
  final double textModifier;
  final String cover;
  const LibraryEntryTab(
      {this.filePath, this.textModifier, this.cover, this.title});

  @override
  _LibraryEntryTabState createState() => _LibraryEntryTabState();
}

class _LibraryEntryTabState extends State<LibraryEntryTab> {
  String data;

  @override
  void didChangeDependencies() async {
    data = await Provider.of<LibraryProvider>(context, listen: false)
        .fetchEntry(widget.filePath);
    if (mounted) setState(() {});
    super.didChangeDependencies();
  }

  Widget _bufferPage() {
    return Container(
        color: Theme.of(context).backgroundColor,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
              Theme.of(context).textTheme.bodyText1.color.withOpacity(0.1)),
        ));
  }

  @override
  Widget build(BuildContext context) {
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
    return data == null
        ? _bufferPage()
        : CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  delegate: SliverHeaderTab(widget.cover, widget.title)),
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
                  child: fmd.MarkdownBody(
                    styleSheet: _styles,
                    data: data,
                    imageBuilder: (uri, title, alt) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 20),
                            Image(fit: BoxFit.cover, image: AssetImage(uri.path)),
                            if (title != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(title,
                                    style: Theme.of(context).textTheme.caption),
                              ),
                            SizedBox(height: 20),
                          ]);
                    },
                  ),
                ),
              ]))
            ],
          );
  }
}

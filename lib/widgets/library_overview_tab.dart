import 'package:doom/providers/library_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as fmd;
import 'package:provider/provider.dart';

class LibraryOverviewTab extends StatelessWidget {
  final double textModifier;
  const LibraryOverviewTab(this.textModifier);
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
            .copyWith(fontSize: 17 + textModifier),
        tableHead: Theme.of(context).textTheme.headline3,
        listBullet: Theme.of(context).textTheme.bodyText1,
        h2: Theme.of(context).textTheme.headline4,
        h1: Theme.of(context).textTheme.headline1,
        h3: Theme.of(context).textTheme.headline3,
        p: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 18 + textModifier));

    final _data = Provider.of<LibraryProvider>(context).overview;

    return _data == null
        ? CircularProgressIndicator()
        : ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: fmd.MarkdownBody(styleSheet: _styles, data: _data),
              ),
              SizedBox(height: 100.0)
            ],
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ExplainBoard extends StatelessWidget {
  final name;
  final href;
  final title;
  ExplainBoard({this.name, this.href, this.title = ""});

  Future<String> get explain async {
    String prepath = "assets/text/";
    return await rootBundle.loadString(prepath + href);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: explain,
          builder: (context, futureSnapshot) {
            String data = futureSnapshot.data;
            return data == null
                ? CircularProgressIndicator()
                : Markdown(
                    styleSheet: MarkdownStyleSheet(
                      p: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16.0, height: 1.8),
                      h2: Theme.of(context).textTheme.headline4,
                    ),
                    imageBuilder: (uri, title, alt) {
                      return Column(children: <Widget>[
                        Image(
                          width: 200.0,
                          fit: BoxFit.cover,
                          image: AssetImage(uri.path),
                        ),
                      ]);
                    },
                    data: data);
          }),
      height: 600.0,
    );
  }
}

import 'package:doom/managers/book_index.dart';
import 'package:doom/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _sectionNum =
        context.select((BooKProvider value) => value.currentSectionNumber);
    String _title = bookIndex[_sectionNum].sectionTitle;
    String _description = bookIndex[_sectionNum].shortDescription;
    double _height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: _height,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/covers/cover_$_sectionNum.jpg")),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                _title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 32.0,
                    shadows: [Shadow(color: Colors.black54, blurRadius: 10.0)]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  _description,
                  style: TextStyle(color: Colors.white),
                )),
          ],
        )
      ],
    );
  }
}

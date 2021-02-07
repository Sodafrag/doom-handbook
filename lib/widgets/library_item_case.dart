import 'package:flutter/material.dart';

class LibraryItemCase extends StatelessWidget {
  final String imagePath;
  final String name;
  final VoidCallback toTab;
  final String _formatedName;
  LibraryItemCase({this.name, this.imagePath, this.toTab}) : _formatedName = name.replaceAll(RegExp(r"\（([^）]+)\）"), "");
  // LibraryItemCase({name, imagePath, toTab})
  // : name = name, imagePath = imagePath, toTab = toTab, _formatedName = name.replaceAll("/\(([^)]+)\)/", "");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toTab,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 38,
            backgroundImage: AssetImage(imagePath)),
          FittedBox(
                      child: Text(_formatedName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 14.0
            )),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatefulWidget {
  final bool _menuOpended;
  final VoidCallback _toggleMenu;
  final iconHissy = "assets/icons/hissy_boy.png";
  CustomFloatingButton(this._toggleMenu, this._menuOpended);
  @override
  _CustomFloatingButtonState createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {

  // @override
  // void didUpdateWidget(covariant CustomFloatingButton oldWidget) {
  //   print("did update widget");
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 25.0),
        height: 40,
        width: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(50)),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightElevation: 0,
          elevation: 0,
          child: widget._menuOpended ? Icon(Icons.close) : ImageIcon(AssetImage(widget.iconHissy), size: 32.0),
          onPressed: () {
            widget._toggleMenu();
          },
        ),
      );
  }
}
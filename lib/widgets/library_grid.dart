import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/library_item_case.dart';
import '../models/library_item.dart';

class LibraryGrid extends StatefulWidget {
  final List<LibraryItem> _data;
  final TabController _controller;
  final VoidCallback _toggleMenu;

  LibraryGrid(this._data, this._controller, this._toggleMenu);

  @override
  _LibraryGridState createState() => _LibraryGridState();
}

class _LibraryGridState extends State<LibraryGrid> {
  bool _isShow = false;
  bool _showGrid = false;

  // @override
  // // void didUpdateWidget(covariant LibraryGrid oldWidget) {
  // //   setState(() {
  // //     _isShow = !_isShow;
  // //   });
  // //   super.didUpdateWidget(oldWidget);
  // // }

  void _onAnimaEnd() {
    if (_isShow)
      setState(() {
        _showGrid = true;
      });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _isShow = !_isShow;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: AnimatedContainer(
        onEnd: _onAnimaEnd,
        curve: Curves.easeInOutSine,
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.fromLTRB(
            _isShow ? 15.0 : 100, _isShow ? 160 : 500, _isShow ? 15.0 : 100, 80.0),
        child: !_showGrid
            ? null
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3.8 / 6,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 3,
                ),
                itemCount: widget._data.length,
                itemBuilder: (ctx, i) {
                  return LibraryItemCase(
                      name: widget._data[i].name,
                      imagePath: widget._data[i].thumbImg,
                      toTab: () {
                        widget._controller.animateTo(i + 1);
                        setState(() {
                          _isShow = !_isShow;
                          widget._toggleMenu();
                        });
                      });
                },
              ),
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 15.0,
            )
          ], 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Theme.of(context).primaryColor.withOpacity(0.95),
        ),
      ),
    );
  }
}

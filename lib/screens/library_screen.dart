import 'package:doom/models/library_item.dart';
import 'package:doom/providers/library_provider.dart';
import 'package:doom/widgets/library_entry_tab.dart';
import 'package:doom/widgets/library_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../managers/monsters.dart';
import '../widgets/library_overview_tab.dart';
import '../widgets/custom_floating_button.dart';

class LibraryScreen extends StatefulWidget {
  static const String routeName = "/library_screen";
  final double textModifier;

  LibraryScreen({this.textModifier});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  bool _menuOpened = false;
  OverlayEntry _overlay;
  String _currentTitle = "恶魔资料库";
  final int listLength = monstersData.length + 1;
  List<LibraryItem> menuData = monstersData;

  // Future fetchMonsterData(String filePath) async {
  //   return await rootBundle.loadString("$filePath.txt");
  // }

  _buildEntries() {
    return monstersData.map((monster) => LibraryEntryTab(
          title: monster.name,
          filePath: monster.filePath,
          textModifier: widget.textModifier,
          cover: monster.cover,
        ));
  }

  List<Widget> _buildTabs() {
    return menuData.map((monster) => Text(monster.name)).toList();
  }

  void _toggleMenu() {
    if (!_menuOpened) {
      Overlay.of(context).insert(_overlay);
    } else {
      _overlay.remove();
    }
    setState(() {
      _menuOpened = !_menuOpened;
    });
  }

  @override
  void initState() {
    _overlay = OverlayEntry(builder: (ctx) {
      return Stack(
          children: [LibraryGrid(menuData, tabController, _toggleMenu)]);
    });
    tabController = TabController(vsync: this, length: listLength);
    Provider.of<LibraryProvider>(context, listen: false)
        .fetchOverview(monstersOverview["filePath"]);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.of(context).pop();
              if (_menuOpened) _overlay.remove();
            }),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_currentTitle),
        bottom: TabBar(controller: tabController, isScrollable: true, tabs: [
          Container(child: Text("概览")),
          ..._buildTabs(),
        ]),
      ),
      body: TabBarView(controller: tabController, children: [
        LibraryOverviewTab(widget.textModifier),
        ..._buildEntries(),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingButton(_toggleMenu, _menuOpened),
    );
  }
}

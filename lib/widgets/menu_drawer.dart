import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/section_menu.dart';

import '../managers/book_index.dart';
import '../widgets/app_icons.dart';
import '../models/settings.dart';

class MenuDrawer extends StatelessWidget {
  final Function _toggleTheme;
  final Function _toggleTextSize;
  final Function _scrollToTop;
  final Settings settings;

  MenuDrawer(this._toggleTheme, this._toggleTextSize, this._scrollToTop,
      {@required this.settings});

  @override
  Widget build(BuildContext context) {
    ImageIcon iconBigText = ImageIcon(
      AssetImage("assets/icons/icon_bigText.png"), color: Theme.of(context).backgroundColor,
    );
    ImageIcon iconSmallText =
        ImageIcon(AssetImage("assets/icons/icon_smallText.png"), color: Theme.of(context).backgroundColor,);
    // Widget topBar = SliverToBoxAdapter(
    //     child: Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(left: 5),
    //       child: IconButton(
    //         iconSize: 40,
    //         padding: EdgeInsets.all(0),
    //         onPressed: () => Navigator.of(context).pop(),
    //         icon: Icon(Icons.close_rounded),
    //         color: Theme.of(context).textTheme.button.color,
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(right: 20.0),
    //       child: Row(
    //         children: [
    //           IconButton(
    //             padding: EdgeInsets.all(0),
    //             icon: Icon(
    //               settings.isLightMode ? AppIcons.icon_moon : AppIcons.icon_sun,
    //               color: Theme.of(context).textTheme.button.color,
    //             ),
    //             onPressed: _toggleTheme,
    //           ),
    //           IconButton(
    //             padding: EdgeInsets.all(0),
    //             icon: settings.isBigSize ? _icon_bigText : _icon_smallText,
    //             onPressed: _toggleTextSize,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // ));

    return ClipRect(
        child: Container(
      width: double.infinity,
      child: Drawer(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).textTheme.headline2.color,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(100),
                          right: Radius.circular(100)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            settings.isLightMode
                                ? AppIcons.icon_moon
                                : AppIcons.icon_sun,
                            color: Theme.of(context).backgroundColor,
                          ),
                          onPressed: _toggleTheme,
                        ),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          icon: settings.isBigSize
                              ? iconBigText
                              : iconSmallText,
                          onPressed: _toggleTextSize,
                        ),
                      ],
                    ),
                  ),
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).textTheme.headline2.color),
                  margin: EdgeInsets.only(left: 15.0),
                  child: IconButton(
                      iconSize: 24,
                      padding: EdgeInsets.all(0),
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close_rounded),
                      color: Theme.of(context).backgroundColor),
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => SectionMenu(bookIndex[i], _scrollToTop),
                  childCount: bookIndex.length,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

// BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//           child: ListView.builder(
//             itemCount: bookIndex.length,
//             itemBuilder: (ctx, i) => SectionMenu(
//               bookIndex[i],
//             ),
//           ),
//         )

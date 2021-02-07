import 'package:flutter/material.dart';

class SliverHeaderTab extends SliverPersistentHeaderDelegate {
  final String cover;
  final String title;
  double height;
  SliverHeaderTab(
    this.cover,
    this.title,
  );

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  double get minExtent => 0.0;

  @override
  double get maxExtent => 320;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double _opacity = shrinkOffset / 320;
    // BoxDecoration _glassDecoration(context) => BoxDecoration(
    //       color: Colors.black38,
    //     );

    return Container(
      // decoration: _glassDecoration(context),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
        Image(
          height: double.maxFinite,
          width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage(cover)),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          color: Colors.black.withOpacity(0.6),
          child: Text(
              title ?? "Waiting...",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.white
          .withOpacity(1 - _opacity / 1.5),
                fontSize: 32.0 - 14 * (shrinkOffset / 300),
                fontWeight: FontWeight.w600,
              ),
            ),
        ),
      ]),

      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: AssetImage(image)),
      //   ),
      height: maxExtent,
    );
  }
}

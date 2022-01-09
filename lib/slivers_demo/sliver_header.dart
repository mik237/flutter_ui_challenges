import 'package:flutter/material.dart';

class SliverHeader extends StatelessWidget {
  final Color backgroundColor;
  final String title;

  const SliverHeader(
      {Key? key, required this.backgroundColor, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,pinned: true,
      delegate: Delegate(
        backgroundColor: backgroundColor,
        title: title,
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String title;

  Delegate({required this.backgroundColor, required this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/utils/theme/export.dart';

class HbSliverAppBar extends StatelessWidget {
  const HbSliverAppBar({
    super.key,
    this.height = 44.0,
    this.child,
    this.titleText = '',
    this.actions = const [],
    this.leading,
  });
  final double height;
  final Widget? child;
  final String titleText;
  final List<Widget> actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final totalHeight = height + topPadding;

    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: totalHeight,
        maxHeight: totalHeight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                if (leading != null)
                  leading!
                else if (context.router.canPop())
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: BackButton(),
                  ),
                Center(
                  child: Text(
                    titleText,
                    textAlign: TextAlign.center,
                    style: context.hbTheme.title20Semi,
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  static double feedMaxOffset = 50;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final borderOpacity = (shrinkOffset / feedMaxOffset).clamp(0.0, 1.0);
    final theme = context.hbTheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 40 * borderOpacity,
              sigmaY: 40 * borderOpacity,
            ),
            child: Container(
              height: maxExtent,
              decoration: BoxDecoration(
                color: theme.bgPrimary.withOpacity(borderOpacity * 0.8),
                border: Border(
                  bottom: BorderSide(
                    color: theme.dividerPrimary.withOpacity(borderOpacity),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox.expand(child: child),
      ],
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotel_booking_app/utils/theme/export.dart';

class TabItem extends StatefulWidget {
  const TabItem({
    super.key,
    this.iconSize = 24,
    required this.label,
    required this.iconFill,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });
  final String label;
  final double iconSize;
  final IconData iconFill;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.hbTheme;
    final label = widget.label;
    final iconSize = widget.iconSize;
    final icon = widget.icon;
    final iconFill = widget.iconFill;
    final isSelected = widget.isSelected;
    final textColor = isSelected ? Colors.black : const Color(0xff868991);

    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onPressed();
      },
      child: ColoredBox(
        color: Colors.white.withValues(alpha: 0.001),
        child: Container(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  );
                },
                child: SizedBox.square(
                    dimension: iconSize,
                    child: Container(
                        key: ValueKey("${icon}_tab_icon"),
                        child: widget.isSelected
                            ? Icon(
                                iconFill,
                                size: iconSize,
                                color: textColor,
                              )
                            : Icon(
                                icon,
                                size: iconSize,
                                color: textColor,
                              ))),
              ),
              Gap(2),
              Text(
                label,
                style: isSelected ? theme.body12M : theme.body12.copyWith(color: theme.textSecondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}

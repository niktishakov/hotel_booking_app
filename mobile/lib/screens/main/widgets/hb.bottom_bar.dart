import 'dart:ui';

import 'package:flutter/material.dart';

class HbBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HbBottomBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 60 + MediaQuery.of(context).padding.bottom,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 0.5,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _TabItem(
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                  label: 'Overview',
                  isSelected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                _TabItem(
                  icon: Icons.favorite_outline,
                  selectedIcon: Icons.favorite,
                  label: 'Favorites',
                  isSelected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                _TabItem(
                  icon: Icons.person_outline,
                  selectedIcon: Icons.person,
                  label: 'Account',
                  isSelected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected ? selectedIcon : icon,
                key: ValueKey(isSelected),
                color: isSelected ? Colors.green : Colors.grey,
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.green : Colors.grey,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotel_booking_app/utils/theme/export.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.details,
    this.onFavoritePressed,
    this.isFavorite = false,
    this.onWebsitePressed,
  });

  final HotelEntity details;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onWebsitePressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = context.hbTheme;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      color: theme.bgCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.borderPrimary),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    details.title,
                    style: theme.title16Semi.copyWith(color: theme.textPrimary),
                  ),
                ),
                _FavoriteButton(
                  onPressed: onFavoritePressed,
                  isFavorite: isFavorite,
                  theme: theme,
                ),
              ],
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.location_on,
              text: details.address,
              theme: theme,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: theme.bgWarning,
                ),
                const SizedBox(width: 4),
                Text(
                  details.rating.toString(),
                  style: theme.body14M.copyWith(color: theme.textPrimary),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${details.ratingCount} reviews)',
                  style: theme.body12.copyWith(color: theme.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _InfoRow(
              icon: Icons.category,
              text: details.category,
              theme: theme,
            ),
            const SizedBox(height: 8),
            _InfoRow(
              icon: Icons.phone,
              text: details.phoneNumber,
              theme: theme,
            ),
            const SizedBox(height: 8),
            Center(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => launchUrl(Uri.parse(details.website)),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.globe, color: theme.iconPrimary, size: 24),
                    const Gap(8),
                    Text('Visit Website', style: theme.body16M.copyWith(color: theme.textPrimary)),
                    const Spacer(),
                    const Icon(CupertinoIcons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.onPressed,
    required this.isFavorite,
    required this.theme,
  });

  final VoidCallback? onPressed;
  final bool isFavorite;
  final HbTheme theme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFavorite ? theme.bgDangerOpacity : Colors.transparent,
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 24,
            color: isFavorite ? theme.bgDanger : theme.iconSecondary,
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    required this.theme,
  });

  final IconData icon;
  final String text;
  final HbTheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: theme.iconSecondary,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: theme.body14.copyWith(color: theme.textSecondary),
          ),
        ),
      ],
    );
  }
}

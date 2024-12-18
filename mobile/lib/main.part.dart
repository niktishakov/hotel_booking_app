part of 'main.dart';

class _MaterialAppLevelOverlay extends StatelessWidget {
  const _MaterialAppLevelOverlay({
    required this.notifier,
    required this.child,
  });

  final MaterialAppOverlayNotifier notifier;
  final Widget child;

  Color _getBgColor(BuildContext context) {
    switch (notifier.overlayType) {
      case OverlayType.transparent:
        return Colors.transparent;
      case OverlayType.white:
        return context.hbTheme.bgWhite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Listen<MaterialAppOverlayNotifier>(
          builder: (context) {
            return Positioned.fill(
              child: TweenAnimationBuilder(
                tween: notifier.shouldDisplayOverlay ? Tween<double>(begin: 0.0, end: 1.0) : Tween<double>(begin: 1.0, end: 0.0),
                duration: kThemeAnimationDuration,
                builder: (context, value, child) {
                  if (value == 0.0) return const SizedBox();

                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: ColoredBox(
                  color: _getBgColor(context),
                  child: Container(
                    color: context.hbTheme.bgWhite,
                    alignment: Alignment.center,
                    // child: const AiCircularIndicator(),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

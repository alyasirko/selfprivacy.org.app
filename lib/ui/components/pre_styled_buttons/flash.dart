part of 'pre_styled_buttons.dart';

class _BrandFlashButton extends StatefulWidget {
  @override
  _BrandFlashButtonState createState() => _BrandFlashButtonState();
}

class _BrandFlashButtonState extends State<_BrandFlashButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _colorTween = ColorTween(
      begin: BrandColors.black,
      end: BrandColors.primary,
    ).animate(_animationController);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(final _) {
    if (Theme.of(context).brightness == Brightness.dark) {
      setState(() {
        _colorTween = ColorTween(
          begin: BrandColors.white,
          end: BrandColors.primary,
        ).animate(_animationController);
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool wasPrevStateIsEmpty = true;

  @override
  Widget build(final BuildContext context) =>
      BlocListener<JobsCubit, JobsState>(
        listener: (final context, final state) {
          if (wasPrevStateIsEmpty && state is! JobsStateEmpty) {
            wasPrevStateIsEmpty = false;
            _animationController.forward();
          } else if (!wasPrevStateIsEmpty && state is JobsStateEmpty) {
            wasPrevStateIsEmpty = true;

            _animationController.reverse();
          }
        },
        child: IconButton(
          onPressed: () {
            showBrandBottomSheet(
              context: context,
              builder: (final context) => const BrandBottomSheet(
                isExpended: true,
                child: JobsContent(),
              ),
            );
          },
          icon: AnimatedBuilder(
            animation: _colorTween,
            builder: (final context, final child) {
              final double v = _animationController.value;
              final IconData icon =
                  v > 0.5 ? Ionicons.flash : Ionicons.flash_outline;
              return Transform.scale(
                scale: 1 + (v < 0.5 ? v : 1 - v) * 2,
                child: Icon(
                  icon,
                  color: _colorTween.value,
                ),
              );
            },
          ),
        ),
      );
}
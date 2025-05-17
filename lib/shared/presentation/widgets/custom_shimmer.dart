import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/util.dart';

class CustomShimmer extends StatefulWidget {
  final Widget child;
  final Color? color;

  const CustomShimmer({required this.child, this.color, super.key});

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorBorder =
        widget.color != null && !Util.isDark(widget.color!)
            ? Util.darken(widget.color!, 0.1)
            : Colors.grey.shade300;
    final colorCenter =
        widget.color != null && !Util.isDark(widget.color!)
            ? Util.darken(widget.color!, 0.2)
            : Colors.grey.shade400;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final width = bounds.width;
            final shimmerPosition = _controller.value * width * 2;

            return LinearGradient(
              colors: [
                colorBorder,
                colorCenter,
                colorCenter,
                colorCenter,
                colorBorder,
              ],
              stops: const [0.0, 0.25, 0.5, 0.85, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp,
              transform: GradientTranslation(shimmerPosition - width),
            ).createShader(Rect.fromLTWH(0, 0, width, bounds.height));
          },
          blendMode: BlendMode.srcATop,
          child: widget.child,
        );
      },
    );
  }
}

class GradientTranslation extends GradientTransform {
  final double dx;

  const GradientTranslation(this.dx);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(dx, 0, 0);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/core/util.dart';

class Avatar extends StatelessWidget {
  final String image;
  final Color color;
  final double? height;
  final String? heroTag;
  final EdgeInsets? padding;

  const Avatar({
    super.key,
    required this.image,
    this.heroTag,
    this.color = Colors.white,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colorPlaceholder = Util.darken(color, 0.1);
    return Padding(
      padding: padding ?? const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Container(
          constraints: BoxConstraints(minHeight: height ?? 180),
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/placeholder.svg',
                height: height ?? 180,
                colorFilter: ColorFilter.mode(
                  colorPlaceholder,
                  BlendMode.srcIn,
                ),
              ),
              Hero(
                tag: heroTag ?? image,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

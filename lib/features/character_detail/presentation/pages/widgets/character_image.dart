import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/core/util.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    super.key,
    required this.character,
    required this.color,
  });

  final Character character;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colorPlaceholder = Util.darken(color, 0.1);
    return Hero(
      tag: 'image_${character.id}',
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/placeholder.svg',
            height: 180,
            colorFilter: ColorFilter.mode(colorPlaceholder, BlendMode.srcIn),
          ),
          Image.network(
            character.image,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) => SizedBox(),
          ),
          Positioned(
            bottom: -14,
            left: -20,
            right: -20,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: color, blurRadius: 20, spreadRadius: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

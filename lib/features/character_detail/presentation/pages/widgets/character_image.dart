import 'package:flutter/material.dart';
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
    return Hero(
      tag: 'image_${character.id}',
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            character.image,
            fit: BoxFit.cover,
            width: double.infinity,
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

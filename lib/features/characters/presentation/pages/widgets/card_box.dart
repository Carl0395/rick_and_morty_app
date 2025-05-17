import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/util.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/character_detail_page.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:rick_and_morty_app/shared/presentation/widgets/avatar.dart';
import 'package:rick_and_morty_app/shared/presentation/widgets/status_dot.dart';

class CardBox extends StatelessWidget {
  final Character character;

  const CardBox({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Util.getDominantColorFromNetwork(character.image),
      builder: (context, snapshot) {
        final color = snapshot.data ?? Colors.white;

        final colorText =
            Util.isDark(color) ? Colors.white : Util.darken(color, 0.3);
        final titleColor =
            Util.isDark(color) ? Colors.white : Util.darken(color, 0.7);
        final borderColor = Util.darken(color, 0.2);

        return GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder:
                      (context) => CharacterDetailPage(
                        character: character,
                        color: color,
                      ),
                ),
              ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOut,
            margin: EdgeInsets.only(bottom: 4, left: 2, right: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Column(
              children: [
                Avatar(
                  image: character.image,
                  heroTag: 'image_${character.id}',
                  color: color,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        character.name,
                        style: TextStyle(
                          height: 1.2,
                          color: titleColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Status: ',
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: StatusDot(status: character.status ?? ''),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: character.status,
                              style: TextStyle(
                                color: colorText,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Species: ',
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: character.species,
                              style: TextStyle(
                                color: colorText,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

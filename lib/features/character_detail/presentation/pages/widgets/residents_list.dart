import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/core/router.dart';
import 'package:rick_and_morty_app/core/util.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:rick_and_morty_app/shared/presentation/widgets/avatar.dart';

class ResidentsList extends StatelessWidget {
  final List<Character> residents;
  const ResidentsList({
    super.key,
    required this.darkenColor,
    required this.color,
    required this.residents,
  });

  final Color darkenColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children:
            residents
                .map(
                  (c) => GestureDetector(
                    onTap: () async {
                      final colorResident =
                          await Util.getDominantColorFromNetwork(c.image);
                      if (context.mounted) {
                        context.push(
                          Routes.resident,
                          extra: (c, colorResident),
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: darkenColor, width: 3),
                      ),
                      child: Avatar(
                        image: c.image,
                        height: 80,
                        padding: EdgeInsets.zero,
                        color: color,
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}

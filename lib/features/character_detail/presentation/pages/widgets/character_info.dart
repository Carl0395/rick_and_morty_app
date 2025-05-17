import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/util.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/widgets/residents_list.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

class CharacterInfo extends StatelessWidget {
  final Character character;
  final Color color;
  const CharacterInfo({
    super.key,
    required this.character,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final darkenColor = Util.darken(color, 0.2);
    final colorText =
        Util.isDark(color) ? Colors.white : Util.darken(color, 0.5);
    final borderColor = Util.isDark(color) ? Colors.white : darkenColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.5,
              ),
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/pickle_rick.png',
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 3),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelInfo('Gender', character.gender),
                  labelInfo('Species', character.species),
                  labelInfo('Type', character.type),
                  labelInfo('Status', character.status),
                  labelInfo('Origin', character.origin?.name),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last known location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorText,
                ),
              ),
              Text(
                character.location?.name ?? '',
                style: TextStyle(fontSize: 20, color: colorText),
              ),
              SizedBox(height: 10),
              if ((character.location?.residents ?? []).isNotEmpty)
                Text(
                  'People who have been last seen in the location.',
                  style: TextStyle(color: colorText),
                ),
            ],
          ),
        ),
        ResidentsList(
          darkenColor: darkenColor,
          color: color,
          residents: character.location?.residents ?? [],
        ),
      ],
    );
  }

  RichText labelInfo(String label, String? value) {
    value = (value ?? '').isEmpty ? 'No Available' : value;
    final colorText =
        Util.isDark(color) ? Colors.white : Util.darken(color, 0.5);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorText,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(fontSize: 20, color: colorText),
          ),
        ],
      ),
    );
  }
}

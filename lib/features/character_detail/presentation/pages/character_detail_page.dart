import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/core/util.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/providers/character_provider.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:rick_and_morty_app/shared/presentation/widgets/avatar.dart';

class CharacterDetailPage extends ConsumerWidget {
  final Color color;
  final Character character;
  const CharacterDetailPage({
    super.key,
    required this.color,
    required this.character,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullCharacter = ref.watch(characterDetailProvider(character.id));

    final darkenColor = Util.darken(color, 0.2);
    final titleColor =
        Util.isDark(color) ? Colors.white : Util.darken(color, 0.7);
    final colorText =
        Util.isDark(color) ? Colors.white : Util.darken(color, 0.5);
    return Scaffold(
      backgroundColor: color,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CharacterImage(character: character, color: color),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    character.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.1,
                      color: titleColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                fullCharacter.when(
                  data: (data) {
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: darkenColor,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  labelInfo('Gender', data.gender),
                                  labelInfo('Species', data.species),
                                  labelInfo('Type', data.type),
                                  labelInfo('Status', data.status),
                                  labelInfo('Origin', data.origin?.name),
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
                                data.origin?.name ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: colorText,
                                ),
                              ),
                              Text(
                                'List of characters who have been last seen in the location.',
                              ),
                            ],
                          ),
                        ),
                        Residents(
                          darkenColor: darkenColor,
                          color: color,
                          residents: data.origin?.residents ?? [],
                        ),
                      ],
                    );
                  },
                  error: (e, stack) => Text(e.toString()),
                  loading: () => CircularProgressIndicator(),
                ),
                SizedBox(height: 100),
              ],
            ),
            BackButton(darkenColor: darkenColor),
          ],
        ),
      ),
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

class Residents extends StatelessWidget {
  final List<Character> residents;
  const Residents({
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
        scrollDirection: Axis.horizontal,
        children:
            residents
                .map(
                  (c) => Container(
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
                )
                .toList() ??
            [],
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key, required this.darkenColor});

  final Color darkenColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 10),
          decoration: BoxDecoration(
            color: darkenColor.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            Icons.chevron_left_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

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
        children: [
          Image.network(
            character.image,
            fit: BoxFit.contain,
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

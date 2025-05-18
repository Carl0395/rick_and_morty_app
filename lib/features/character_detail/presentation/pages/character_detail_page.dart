import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/core/util.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/widgets/back_appbar_button.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/widgets/character_image.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/widgets/character_info.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/widgets/character_info_shimmer.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/widgets/error_info.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/providers/character_provider.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

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

    return Scaffold(
      backgroundColor: color,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: color,
            expandedHeight: 340.0,
            pinned: true,
            stretch: true,
            leading: BackAppBarButton(darkenColor: darkenColor),
            leadingWidth: 60,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              collapseMode: CollapseMode.pin,
              background: Stack(
                fit: StackFit.expand,
                children: [CharacterImage(character: character, color: color)],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, __) {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        data:
                            (data) =>
                                CharacterInfo(character: data, color: color),
                        error: (e, stack) {
                          final message =
                              e is SocketException || e is NetworkException
                                  ? 'Rick está causando fallas en el sistema; le pediremos a Morty que restablezca la conexión'
                                  : 'Rick desconectó algo del servidor... Morty intentará solucionarlo.';
                          return ErrorInfo(
                            color: color,
                            message: message,
                            onRetry: () async {
                              ref.invalidate(characterDetailProvider);
                            },
                          );
                        },
                        loading: () => CharacterInfoShimmer(color: color),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}

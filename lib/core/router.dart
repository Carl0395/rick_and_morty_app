import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/pages/character_detail_page.dart';
import 'package:rick_and_morty_app/features/characters/presentation/pages/characters_page.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.charactersList,
      builder: (context, state) => const CharactersPage(),
    ),
    GoRoute(
      path: Routes.characterDetail,
      builder: (context, state) {
        final (character, color) = state.extra as (Character, Color);
        return CharacterDetailPage(character: character, color: color);
      },
    ),
    GoRoute(
      path: Routes.resident,
      builder: (context, state) {
        final (character, color) = state.extra as (Character, Color);
        return CharacterDetailPage(character: character, color: color);
      },
    ),
  ],
);

class Routes {
  Routes._();
  static final String charactersList = '/';
  static final String characterDetail = '/detail';
  static final String resident = '/resident';
}

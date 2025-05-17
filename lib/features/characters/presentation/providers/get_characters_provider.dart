import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/core/di.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_characters_provider.g.dart';

@riverpod
Future<List<Character>> getCharacters(Ref ref, int page) async {
  final useCase = ref.watch(getCharactersUseCaseProvider);
  return useCase(page);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/core/di.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_provider.g.dart';

@riverpod
Future<Character> characterDetail(Ref ref, String id) {
  final useCase = ref.watch(getCharacterUseCaseProvider);
  return useCase(id);
}

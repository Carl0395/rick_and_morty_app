import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';

class GetCharacters {
  final CharactersRepository repository;
  GetCharacters(this.repository);

  Future<List<Character>> call(int page) => repository.getCharacters(page);
}

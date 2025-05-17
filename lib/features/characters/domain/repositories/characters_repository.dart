import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

abstract class CharactersRepository {
  Future<List<Character>> getCharacters(int page);
}

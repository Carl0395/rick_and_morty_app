import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Character> getCharacter(String id);
}

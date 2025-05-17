import 'package:rick_and_morty_app/features/character_detail/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';

class GetCharacter {
  final CharacterRepository repository;
  GetCharacter(this.repository);

  Future<Character> call(String id) => repository.getCharacter(id);
}

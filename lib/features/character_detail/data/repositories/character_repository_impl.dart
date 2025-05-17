import 'package:rick_and_morty_app/features/character_detail/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/shared/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remote;
  CharacterRepositoryImpl(this.remote);

  @override
  Future<Character> getCharacter(String id) async {
    final model = await remote.getCharacter(id);
    return model.toEntity();
  }
}

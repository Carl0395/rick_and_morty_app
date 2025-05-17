import 'package:rick_and_morty_app/shared/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/shared/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharacterRemoteDataSource remote;
  CharactersRepositoryImpl(this.remote);

  @override
  Future<List<Character>> getCharacters(int page) async {
    final models = await remote.getCharacters(page);
    return models.map((e) => e.toEntity()).toList();
  }
}

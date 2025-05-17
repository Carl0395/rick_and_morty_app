import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/features/character_detail/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/use_cases/get_character.dart';
import 'package:rick_and_morty_app/shared/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/use_cases/get_characters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'graphql_client.dart';

part 'di.g.dart';

// GraphQL provider
@Riverpod(keepAlive: true)
GraphQLClient graphQLClient(Ref ref) => setupGraphQLClient();

// DataSource
@Riverpod(keepAlive: true)
CharacterRemoteDataSource characterRemoteDataSource(Ref ref) {
  final client = ref.watch(graphQLClientProvider);
  return CharacterRemoteDataSource(client);
}

// Repositories
@Riverpod(keepAlive: true)
CharactersRepository charactersRepository(Ref ref) {
  final remote = ref.watch(characterRemoteDataSourceProvider);
  return CharactersRepositoryImpl(remote);
}

@Riverpod(keepAlive: true)
CharacterRepository characterRepository(Ref ref) {
  final remote = ref.watch(characterRemoteDataSourceProvider);
  return CharacterRepositoryImpl(remote);
}

// Use Cases

@Riverpod(keepAlive: true)
GetCharacters getCharactersUseCase(Ref ref) {
  final repository = ref.watch(charactersRepositoryProvider);
  return GetCharacters(repository);
}

@Riverpod(keepAlive: true)
GetCharacter getCharacterUseCase(Ref ref) {
  final repository = ref.watch(characterRepositoryProvider);
  return GetCharacter(repository);
}

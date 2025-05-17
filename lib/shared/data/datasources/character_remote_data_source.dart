import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';

class CharacterRemoteDataSource {
  final GraphQLClient client;
  CharacterRemoteDataSource(this.client);

  Future<List<CharacterModel>> getCharacters(int page) async {
    const query = r'''
    query getCharacters($page: Int) {
      characters(page: $page) {
        results {
          id
          name
          image
          status
          species
        }
      }
    }
    ''';

    final result = await client.query(
      QueryOptions(document: gql(query), variables: {"page": page}),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final results = result.data?["characters"]?["results"] as List<dynamic>;
    return results.map((json) {
      return CharacterModel.fromJson(json);
    }).toList();
  }

  Future<CharacterModel> getCharacter(String id) async {
    const query = r'''
      query getCharacter($id: ID!) {
        character(id: $id) {
          id
          name
          image
          status
          species
          type
          gender
          origin {
            name
            type
            dimension
            residents {
              id
              name
              image
            }
          }
          location {
            name
            residents {
              id
              name
              image
            }
          }
        }
      }
    ''';

    final result = await client.query(
      QueryOptions(document: gql(query), variables: {"id": id}),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final json = result.data?["character"];
    return CharacterModel.fromJson(json);
  }
}

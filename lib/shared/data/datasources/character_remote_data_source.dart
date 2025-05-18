import 'dart:async';
import 'dart:io';

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
      throw handleGraphQLException(result.exception!);
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
      throw handleGraphQLException(result.exception!);
    }

    final json = result.data?["character"];
    return CharacterModel.fromJson(json);
  }

  Exception handleGraphQLException(OperationException? exception) {
    if (exception == null) {
      return Exception('Unknown GraphQL error.');
    }

    final linkException = exception.linkException;
    final graphqlErrors = exception.graphqlErrors;

    if (linkException is ServerException) {
      return ServerException(originalException: exception);
    }
    if (linkException is NetworkException || linkException is SocketException) {
      return NetworkException(originalException: exception, uri: Uri());
    }

    if (graphqlErrors.isNotEmpty) {
      return Exception(graphqlErrors.map((e) => e.message).join('\n'));
    }

    return Exception('Error desconocido.');
  }
}

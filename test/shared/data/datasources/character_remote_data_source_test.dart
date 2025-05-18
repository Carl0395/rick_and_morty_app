import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/shared/data/datasources/character_remote_data_source.dart';

import '../../../helpers/test_helpers.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

class FakeQueryOptions extends Mock implements QueryOptions {}

void main() {
  late MockGraphQLClient mockGraphQLClient;
  late CharacterRemoteDataSource characterRemoteDataSource;

  setUpAll(() {
    registerFallbackValue(FakeQueryOptions());
    mockGraphQLClient = MockGraphQLClient();
    characterRemoteDataSource = CharacterRemoteDataSource(mockGraphQLClient);
  });

  group('getCharacters', () {
    test('Get characters successfully', () async {
      final jsonData = json.decode(fixture('characters.json'))['data'];
      when(() => mockGraphQLClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql('')),
          data: jsonData,
          source: QueryResultSource.network,
        ),
      );

      final result = await characterRemoteDataSource.getCharacters(1);

      expect(result, isNotNull);
      expect(result.first, isA<CharacterModel>());
      expect(result.length, 6);
    });

    test('Get characters with network error', () async {
      when(() => mockGraphQLClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql('')),
          source: QueryResultSource.network,
          data: null,
          exception: OperationException(
            linkException: NetworkException(
              message: 'Connection failed',
              originalException: {'message': 'Connection failed'},
              uri: null,
            ),
          ),
        ),
      );

      expect(
        () async => await characterRemoteDataSource.getCharacters(1),
        throwsA(isA<NetworkException>()),
      );
    });
  });

  group('getCharacter', () {
    test('Get character successfully', () async {
      final jsonData = json.decode(fixture('character.json'))['data'];
      when(() => mockGraphQLClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql('')),
          data: jsonData,
          source: QueryResultSource.network,
        ),
      );

      final result = await characterRemoteDataSource.getCharacter('1');

      expect(result, isNotNull);
      expect(result, isA<CharacterModel>());
      expect(result.name, 'Rick Sanchez');
    });

    test('Get character with server error', () async {
      when(() => mockGraphQLClient.query(any())).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql('')),
          source: QueryResultSource.network,
          data: null,
          exception: OperationException(linkException: ServerException()),
        ),
      );

      expect(
        () async => await characterRemoteDataSource.getCharacters(1),
        throwsA(isA<ServerException>()),
      );
    });
  });
}

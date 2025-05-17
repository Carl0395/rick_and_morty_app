import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLClient setupGraphQLClient() {
  final httpLink = HttpLink('https://rickandmortyapi.com/graphql');
  return GraphQLClient(link: httpLink, cache: GraphQLCache());
}

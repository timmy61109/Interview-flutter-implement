import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:graphql/client.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    "http://127.0.0.1:8000/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}

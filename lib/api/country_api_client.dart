import 'package:graphql/client.dart';
import 'models/models.dart' as models;
import 'models/models.dart';
import 'queries/queries.dart' as queries;


class GetCountrysRequestFailure implements Exception {}

class CountryApiClient {
  const CountryApiClient({required GraphQLClient graphQLClient})
      : _graphQLClient = graphQLClient;

  factory CountryApiClient.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return CountryApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<models.CountryCodeModel>> getCountryInfos() async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(queries.getAllCountryInfoQuery),
      ),
    );
    if (result.hasException) throw GetCountrysRequestFailure();
    final data = result.data?['countries'] as List;
    return data
        .map((dynamic country) =>
            models.CountryCodeModel.fromJson(country as Map<String, dynamic>))
        .toList();
  }

  Future<CountryDetailModel> getDetailCounryInfoByCode(
      {required String code}) async {
    final result = await _graphQLClient.query(
      QueryOptions(
        document: gql(queries.getDetailCountryInfo),
        variables:{"code": code},
      ),
    );
    if (result.hasException) throw GetCountrysRequestFailure();
    final data = result.data?['country'] as Map<String, dynamic>;
    return CountryDetailModel.fromJson(data);
  }
}
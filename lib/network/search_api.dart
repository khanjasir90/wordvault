import 'package:dio/dio.dart';
import 'package:wordvault/model/search_result.dart';

abstract class SearchApi {
  Future<SearchResult> getSearchResults(String query);
}

class SearchApiImpl implements SearchApi {
  @override
  Future<SearchResult> getSearchResults(String query) async {

    const String baseUrl = 'https://lexigraph.dictionary.com/search';

    Dio dio = Dio();
    final response = await dio.get(baseUrl, queryParameters: {'searchTerm': query, 'context': 'dcom'});

    return SearchResult.fromJson(response.data);
  }
}
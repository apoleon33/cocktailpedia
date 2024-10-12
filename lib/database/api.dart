import 'dart:convert';

import 'package:http/http.dart';

class Api {
  /// The base url of the api
  final String baseUrl = "https://example.com/";

  /// The additional endpoint of the api. Default to [""]
  final String endpoint;

  Api({this.endpoint = ""});

  Future<Response> fetchApi() {
    // baseUrl + endpoint
    return get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  static Future<T> createFromApi<T extends ApiCreatable>(
    T Function(ApiContent) builder,
    String endpoint,
  ) async {
    final Api api = Api(endpoint: endpoint);
    final response = await api.fetchApi();

    return builder(
      ApiContent(
        content: jsonDecode(response.body) as Map<String, dynamic>,
      ),
    );
  }
}

/// Class to store data from the api
/// Pretty useless for the moment.
class ApiContent {
  final Map<String, dynamic> content;

  ApiContent({required this.content});
}

/// Abstract interface to make the creation of any object with data coming from an api possible.
abstract class ApiCreatable {
  
  /// How the object should be created, with the information from the api being stored in [apiContent.content].
  ApiCreatable getFromApi(ApiContent apiContent);
}

import 'dart:convert';

import 'package:http/http.dart';

class Api {
  /// The base url of the api
  final String baseUrl = "https://example.com/";

  /// The additional endpoint of the api. Default to [""]
  final String endpoint;

  Api({this.endpoint = ""});

  Future<Response> _fetchApi() {
    // baseUrl + endpoint
    return get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  /// Get Api informations about an object
  static Future<ApiContent> getFromApi(ApiConnectivity object) async {
    final Api api = Api(endpoint: object.endpoint);
    final response = await api._fetchApi();
    return ApiContent(content: jsonDecode(response.body) as Map<String, dynamic>);
  }
}

/// Class to store data from the api
/// Pretty useless for the moment.
class ApiContent {
  final Map<String, dynamic> content;

  ApiContent({required this.content});
}

/// Everything an object need, to be
abstract class ApiConnectivity {
  /// This is the endpoint added to the base of the Api url, depending on which data we wants.
  String get endpoint;
}

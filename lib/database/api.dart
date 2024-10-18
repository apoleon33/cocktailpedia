import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  /// The base url of the api
  final String baseUrl = "http://172.252.236.195:8080/";
  final Map<String, dynamic> queryParameters;

  final Dio dio = Dio();

  /// The additional endpoint of the api. Default to [""]
  final String endpoint;

  Api({this.endpoint = "", this.queryParameters = const {}});

  Future<Response> _fetchApi() async {
    // baseUrl + endpoint
    return dio.get(
      baseUrl + endpoint,
      queryParameters: queryParameters,
    );
  }

  /// Get Api informations about an object
  static Future<ApiContent> getFromApi(
    String endpoint,
    Map<String, dynamic> queryParameters,
  ) async {
    final Api api = Api(endpoint: endpoint, queryParameters: queryParameters);
    final response = await api._fetchApi();
    return ApiContent(response.data);
  }
}

/// Class to store data from the api.
/// Pretty useless for the moment.
class ApiContent {
  final dynamic rawData;

  ApiContent(this.rawData);

  bool isThisType<T>() => rawData.runtimeType == T;

  Map<String, dynamic> get asMap => isThisType<Map<String, dynamic>>()? rawData: rawData[0];
}

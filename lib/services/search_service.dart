import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/models/search_response.dart';

class SearchService {
  final baseUrl = 'https://geocoding-api.open-meteo.com/v1';
  final String configVars = 'language=es&countryCode=ES';

  Future<String> getBody(String path) async {
    final uri = Uri.parse('$baseUrl/search?$path');
    final http.Response response = await http.get(uri);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
        'Request failed with status ${response.statusCode}: ${response.reasonPhrase}',
      );
    }

    return response.body;
  }

  Future<List<DataPlace>> getDataPlace(String name) async {
    final normalizedName = name.trim();
    if (normalizedName.isEmpty) {
      return <DataPlace>[];
    }

    final escapedName = Uri.encodeQueryComponent(normalizedName);
    final body = await getBody('$configVars&name=$escapedName');
    return searchResponseFromJson(body).results;
  }
}

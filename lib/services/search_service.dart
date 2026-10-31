import 'package:http/http.dart' as http;
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/models/search_response.dart';

class SearchService {
  final baseUrl = 'https://geocoding-api.open-meteo.com/v1';
  final String configVars = 'language=es&countryCode=ES';

  Future<String> getBody(String path) async {
    final http.Response response = await http.get(
      Uri.parse('$baseUrl/search?$path'),
    );
    return response.body;
  }

  Future<List<DataPlace>> getDataPlace(String name) async {
    final body = await getBody('$configVars&name=$name');
    return searchResponseFromJson(body).results;
  }
}

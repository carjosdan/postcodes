import 'dart:convert';

import 'package:postcodes/models/data_place.dart';

SearchResponse searchResponseFromJson(String str) {
  try {
    final decoded = json.decode(str);
    if (decoded is! Map<String, dynamic>) {
      return SearchResponse(results: const [], generationtimeMs: 0.0);
    }

    return SearchResponse.fromJson(decoded);
  } on FormatException {
    return SearchResponse(results: const [], generationtimeMs: 0.0);
  }
}

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  final List<DataPlace> results;
  final double generationtimeMs;

  SearchResponse({required this.results, required this.generationtimeMs});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    final dynamic rawResults = json['results'];
    final List<dynamic> resultsJson;

    if (rawResults is Map) {
      resultsJson = [rawResults];
    } else if (rawResults is Iterable) {
      resultsJson = List<dynamic>.from(rawResults);
    } else {
      resultsJson = const <dynamic>[];
    }

    return SearchResponse(
      results: resultsJson
          .map((item) {
            if (item is Map) {
              return DataPlace.fromJson(Map<String, dynamic>.from(item));
            }
            return DataPlace.empty();
          })
          .toList(),
      generationtimeMs: _asDouble(json['generationtime_ms']) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    'results': List<dynamic>.from(results.map((x) => x.toJson())),
    'generationtime_ms': generationtimeMs,
  };
}

double? _asDouble(dynamic value) {
  if (value == null) {
    return null;
  }

  if (value is num) {
    return value.toDouble();
  }

  return double.tryParse(value.toString());
}

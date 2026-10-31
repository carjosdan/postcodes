import 'dart:convert';

import 'package:postcodes/models/data_place.dart';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  final List<DataPlace> results;
  final double generationtimeMs;

  SearchResponse({required this.results, required this.generationtimeMs});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    final resultsJson = json["results"] as List<dynamic>? ?? [];

    return SearchResponse(
      results: resultsJson
          .map((item) => DataPlace.fromJson(item as Map<String, dynamic>))
          .toList(),
      generationtimeMs:
          (json["generationtime_ms"] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "generationtime_ms": generationtimeMs,
  };
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postcodes/models/search_response.dart';
import 'package:postcodes/services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  SearchProvider({SearchService? searchService})
    : searchService = searchService ?? SearchService();

  final SearchService searchService;
  SearchResponse _searchResponse = SearchResponse(
    results: const [],
    generationtimeMs: 0.0,
  );
  String? _searchError;
  bool _hasNoResults = false;
  bool _isSearching = false;
  int _requestId = 0;

  SearchResponse get searchResponse => _searchResponse;
  String? get searchError => _searchError;
  bool get hasNoResults => _hasNoResults;
  bool get isSearching => _isSearching;

  Future<void> searchPlace(String value) async {
    final name = value.trim();
    final requestId = ++_requestId;

    if (name.length < 3) {
      _resetSearchState();
      notifyListeners();
      return;
    }

    _searchResponse = SearchResponse(results: const [], generationtimeMs: 0.0);
    _searchError = null;
    _hasNoResults = false;
    _isSearching = true;
    notifyListeners();

    try {
      final result = await searchService.getDataPlace(name);
      if (requestId == _requestId) {
        _searchResponse = result;
        _hasNoResults = result.results.isEmpty;
        debugPrint(jsonEncode(result.toJson()));
      }
    } on SocketException catch (error) {
      if (requestId == _requestId) {
        debugPrint('Search connection failed: $error');
        _reportSearchError(
          'No hay conexión a internet. Comprueba tu conexión e inténtalo de nuevo.',
        );
      }
    } on http.ClientException catch (error) {
      if (requestId == _requestId) {
        debugPrint('Search request failed: $error');
        _reportSearchError(
          'No hay conexión a internet. Comprueba tu conexión e inténtalo de nuevo.',
        );
      }
    } on HttpException catch (error) {
      if (requestId == _requestId) {
        debugPrint('Search service returned an HTTP error: $error');
        _reportSearchError(
          'Error de obtención de datos. Inténtalo de nuevo más tarde.',
        );
      }
    } on FormatException catch (error) {
      if (requestId == _requestId) {
        debugPrint('Search service returned invalid data: $error');
        _reportSearchError(
          'No se pudieron leer los datos recibidos. Inténtalo de nuevo más tarde.',
        );
      }
    } finally {
      if (requestId == _requestId) {
        _isSearching = false;
        notifyListeners();
      }
    }
  }

  void _reportSearchError(String message) {
    _searchResponse = SearchResponse(results: const [], generationtimeMs: 0.0);
    _hasNoResults = false;
    _searchError = message;
  }

  void _resetSearchState() {
    _searchResponse = SearchResponse(results: const [], generationtimeMs: 0.0);
    _searchError = null;
    _hasNoResults = false;
    _isSearching = false;
  }

  void clearSearch() {
    ++_requestId;
    _resetSearchState();
    notifyListeners();
  }
}

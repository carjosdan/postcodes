import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  SearchService searchService = SearchService();
  List<DataPlace> _dataPlace = [];
  String _name = '';

  List<DataPlace> get dataPlace => _dataPlace;

  Future<List<DataPlace>> searchPlace(String value) async {
    _name = value.trim();

    if (_name.isEmpty) {
      _dataPlace = [];
      notifyListeners();
      return _dataPlace;
    }

    try {
      _dataPlace = await searchService.getDataPlace(_name);
    } catch (_) {
      _dataPlace = [];
    }

    notifyListeners();
    return _dataPlace;
  }

  void clearSearch() {
    _name = '';
    _dataPlace = [];
    notifyListeners();
  }
}

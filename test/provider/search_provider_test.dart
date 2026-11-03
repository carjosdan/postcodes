import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:postcodes/models/search_response.dart';
import 'package:postcodes/provider/search_provider.dart';
import 'package:postcodes/services/search_service.dart';

void main() {
  test('exposes loading and no-results states for a search', () async {
    final responseCompleter = Completer<SearchResponse>();
    String? requestedName;
    final provider = SearchProvider(
      searchService: _FakeSearchService((name) {
        requestedName = name;
        return responseCompleter.future;
      }),
    );
    addTearDown(provider.dispose);

    final search = provider.searchPlace('  Madrid  ');

    expect(requestedName, 'Madrid');
    expect(provider.isSearching, isTrue);
    expect(provider.searchError, isNull);
    expect(provider.hasNoResults, isFalse);

    responseCompleter.complete(
      SearchResponse(results: const [], generationtimeMs: 1.0),
    );
    await search;

    expect(provider.isSearching, isFalse);
    expect(provider.hasNoResults, isTrue);
    expect(provider.searchResponse.generationtimeMs, 1.0);
  });

  test('ignores a stale response and clears state for short queries', () async {
    final staleResponseCompleter = Completer<SearchResponse>();
    final provider = SearchProvider(
      searchService: _FakeSearchService(
        (name) => name == 'Madrid'
            ? staleResponseCompleter.future
            : Future.value(
                SearchResponse(results: const [], generationtimeMs: 2.0),
              ),
      ),
    );
    addTearDown(provider.dispose);

    final staleSearch = provider.searchPlace('Madrid');
    await provider.searchPlace('Seville');
    staleResponseCompleter.complete(
      SearchResponse(results: const [], generationtimeMs: 1.0),
    );
    await staleSearch;

    expect(provider.searchResponse.generationtimeMs, 2.0);
    expect(provider.isSearching, isFalse);
    expect(provider.hasNoResults, isTrue);

    await provider.searchPlace('Se');

    expect(provider.searchResponse.results, isEmpty);
    expect(provider.searchResponse.generationtimeMs, 0.0);
    expect(provider.isSearching, isFalse);
    expect(provider.hasNoResults, isFalse);
    expect(provider.searchError, isNull);
  });
}

class _FakeSearchService extends SearchService {
  _FakeSearchService(this.onGetDataPlace);

  final Future<SearchResponse> Function(String name) onGetDataPlace;

  @override
  Future<SearchResponse> getDataPlace(String name) => onGetDataPlace(name);
}

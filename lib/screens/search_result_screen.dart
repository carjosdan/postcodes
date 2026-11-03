import 'package:flutter/material.dart';
import 'package:postcodes/provider/search_provider.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/widgets/widget_header.dart';
import 'package:postcodes/widgets/widget_results.dart';
import 'package:postcodes/widgets/widget_scroll_to_top_button.dart';
import 'package:postcodes/widgets/widget_search.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final ScrollController _scrollController = ScrollController();
  final SearchProvider _searchProvider = SearchProvider();
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    _searchProvider.addListener(_handleSearchStateChanged);
  }

  void _handleSearchStateChanged() {
    setState(() {});
  }

  void _handleScroll() {
    final shouldShow = _scrollController.offset > 0;
    if (shouldShow != _showScrollToTop) {
      setState(() => _showScrollToTop = shouldShow);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _searchProvider
      ..removeListener(_handleSearchStateChanged)
      ..clearSearch()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppStyles.appBar,
        child: WidgetHeader(),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          WidgetSearch(onSearchChanged: _searchProvider.searchPlace),
          WidgetResults(
            response: _searchProvider.searchResponse,
            searchError: _searchProvider.searchError,
            hasNoResults: _searchProvider.hasNoResults,
            isSearching: _searchProvider.isSearching,
          ),
        ],
      ),
      floatingActionButton: _showScrollToTop
          ? WidgetScrollToTopButton(scrollController: _scrollController)
          : null,
      //bottomNavigationBar: Widgetfooter(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/provider/search_provider.dart';

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({super.key, required this.onSearchResult});

  final ValueChanged<List<DataPlace>> onSearchResult;

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  final TextEditingController searchController = TextEditingController();
  final SearchProvider searchProvider = SearchProvider();

  @override
  void dispose() {
    searchController.dispose();
    searchProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.edgeInsetsOnlyLeftRightbottom1620,
      decoration: BoxDecoration(
        color: AppStyles.primary, // Color azul oscuro de fondo
      ),
      child: Row(
        children: [
          AppStyles.sizedBoxWidth16,
          Expanded(
            child: Container(
              decoration: AppStyles.boxDecorationRoundedWhiteAlpha015,
              child: TextField(
                style: AppStyles.textMediumWhite,
                cursorColor: AppStyles.onPrimary,
                decoration: InputDecoration(
                  hintText: 'CP o Ciudad (e.g., 08022 o Girona)',
                  hintStyle: AppStyles.textMediumWhiteAlpha,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppStyles.onPrimary,
                    size: 33,
                  ),
                  border: InputBorder.none,
                  contentPadding: AppStyles.edgeInsetsSymetric1420,
                ),
                onChanged: (value) async {
                  searchProvider.trimTheValue(value, widget);
                },
              ),
            ),
          ),
          AppStyles.sizedBoxWidth16,
        ],
      ),
    );
  }
}

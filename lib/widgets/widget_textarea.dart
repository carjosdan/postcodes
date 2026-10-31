import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/provider/search_provider.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetTextarea extends StatefulWidget {
  const WidgetTextarea({super.key, required this.onSearchResult});

  final ValueChanged<List<DataPlace>> onSearchResult;

  @override
  State<WidgetTextarea> createState() => _WidgetTextareaState();
}

class _WidgetTextareaState extends State<WidgetTextarea> {
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
    return Column(
      children: [
        Padding(
          padding: AppStyles.edgeInsets16,
          child: TextField(
            controller: searchController,
            onChanged: (value) {},
            onSubmitted: (value) async {
              final result = await searchProvider.searchPlace(value);
              debugPrint(
                jsonEncode(result.map((place) => place.toJson()).toList()),
              );
              widget.onSearchResult(result);
            },
            decoration: InputDecoration(
              hintText: 'Entre nombre o código postal',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}

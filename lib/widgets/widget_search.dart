import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/provider/search_provider.dart';

//import 'package:postcodes/styles/app_styles.dart';

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
      padding: const EdgeInsets.only(
        //top: 50.0,
        left: 16.0,
        right: 16.0,
        bottom: 20.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF1E3A8A), // Color azul oscuro de fondo
        //borderRadius: BorderRadius.only(
        //  bottomLeft: Radius.circular(24.0),
        //  bottomRight: Radius.circular(24.0),
        //),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(
                  alpha: 0.15,
                ), // Fondo semi-transparente
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 16),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Search postcode (e.g., 08022)',
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 15,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white70,
                    size: 33,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 20.0,
                  ),
                ),
                onChanged: (value) async {
                  final result = await searchProvider.searchPlace(value);
                  debugPrint(
                    jsonEncode(result.map((place) => place.toJson()).toList()),
                  );
                  widget.onSearchResult(result);
                  // Lógica de búsqueda aquí
                },
              ),
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}

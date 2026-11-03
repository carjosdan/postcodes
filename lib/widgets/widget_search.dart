import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/features/constants/app_strings.dart';

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({super.key, required this.onSearchChanged});

  final ValueChanged<String> onSearchChanged;

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
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
                controller: _searchController,
                style: AppStyles.textMediumWhite,
                cursorColor: AppStyles.onPrimary,
                decoration: InputDecoration(
                  hintText: AppStrings.hintText,
                  hintStyle: AppStyles.textMediumWhiteAlpha,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppStyles.onPrimary,
                    size: 33,
                  ),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            _searchController.clear();
                            widget.onSearchChanged('');
                            setState(() {});
                          },
                          icon: Icon(Symbols.close, color: AppStyles.onPrimary),
                          color: AppStyles.onPrimary,
                        ),
                  border: InputBorder.none,
                  contentPadding: AppStyles.edgeInsetsSymetric1420,
                ),
                onChanged: (value) {
                  setState(() {});
                  widget.onSearchChanged(value);
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

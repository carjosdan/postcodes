import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';
import 'package:postcodes/widgets/widget_header.dart';
import 'package:postcodes/widgets/widget_results.dart';
import 'package:postcodes/widgets/widget_search.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  List<DataPlace> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppStyles.appBar,
        child: WidgetHeader(),
      ),
      body: ListView(
        children: [
          WidgetSearch(
            onSearchResult: (result) {
              data = result;
              setState(() {});
            },
          ),
          WidgetResults.name(data: data),
        ],
      ),
      //bottomNavigationBar: Widgetfooter(),
    );
  }
}

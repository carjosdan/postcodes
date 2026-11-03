import 'package:flutter/material.dart';
import 'package:postcodes/models/search_response.dart';
import 'package:postcodes/widgets/messages/widget_fail_conection.dart';
import 'package:postcodes/widgets/messages/widget_no_resutls.dart';
import 'package:postcodes/widgets/widget_progres_bar.dart';
import 'package:postcodes/widgets/widget_title.dart';
import 'package:postcodes/widgets/widget_principal.dart';
import 'package:postcodes/widgets/widget_welcome.dart';

class WidgetResults extends StatelessWidget {
  const WidgetResults({
    super.key,
    required this.response,
    required this.searchError,
    required this.hasNoResults,
    required this.isSearching,
  });

  final SearchResponse response;
  final String? searchError;
  final bool hasNoResults;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return Column(children: [WidgetProgresBar(), const WidgetWelcome()]);
    }

    if (searchError != null) {
      return Column(
        children: [
          WidgetFailConection(message: searchError!),
          const WidgetWelcome(),
        ],
      );
    }

    if (hasNoResults) {
      return Column(children: [const WidgetNoResutls(), const WidgetWelcome()]);
    }

    if (response.results.isEmpty) {
      return const WidgetWelcome();
    }
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: response.results.map((place) {
        return ListTile(
          title: WidgetTitle(place: place),
          subtitle: WidgetPrincipal(
            place: place,
            generationtimeMs: response.generationtimeMs,
          ),
        );
      }).toList(),
    );
  }
}

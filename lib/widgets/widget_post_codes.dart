import 'package:flutter/material.dart';
import 'package:postcodes/features/constants/app_strings.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetPostCodes extends StatefulWidget {
  const WidgetPostCodes({super.key, required this.place});

  final DataPlace place;

  @override
  State<WidgetPostCodes> createState() => _WidgetPostCodesState();
}

class _WidgetPostCodesState extends State<WidgetPostCodes> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final postcodes = widget.place.postcodes;
    final hasManyPostcodes = postcodes.length > 3;
    final visiblePostcodes = _isExpanded || !hasManyPostcodes
        ? postcodes
        : postcodes.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.postCode,
          textAlign: TextAlign.center,
          style: AppStyles.sectTitle,
        ),
        AppStyles.sizedBoxHeight8,
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final postcode in visiblePostcodes)
              Container(
                padding: AppStyles.edgeInsetsSymetric124,
                decoration: AppStyles.boxDecorationGreyBlackFrame,
                child: Text(
                  postcode,
                  textAlign: TextAlign.center,
                  style: AppStyles.textMediumBoldBlue,
                ),
              ),
            if (hasManyPostcodes)
              InkWell(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                borderRadius: AppStyles.borderRadius4,
                child: Padding(
                  padding: AppStyles.edgeInsetsSymetric124,
                  child: Text(
                    _isExpanded ? AppStrings.showLess : AppStrings.showMore,
                    style: AppStyles.textMediumBoldBlue,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

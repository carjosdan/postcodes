import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:postcodes/models/data_place.dart';
import 'package:postcodes/styles/app_styles.dart';

class WidgetCard extends StatefulWidget {
  const WidgetCard({super.key, required this.data});
  final DataPlace data;

  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppStyles.whiteRGB, // Color de fondo del Card
      elevation: 16,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyles.sizedBoxHeight26,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  //Icon(Icons.groups, color: Colors.black, size: 40),
                  AppStyles.styleIconCard(Icons.groups),
                  AppStyles.sizedBoxHeight8,
                  Text(
                    widget.data.population != null
                        ? 'Población:\n${widget.data.population} habs.'
                        : 'Población: -',
                    style: AppStyles.textSmallBold,
                  ),
                ],
              ), // POBLACION
              Column(
                crossAxisAlignment: .start,
                children: [
                  AppStyles.styleIconCard(Symbols.altitude),
                  AppStyles.sizedBoxHeight8,
                  Text('Elevación:', style: AppStyles.textSmallBold),
                  Text(
                    widget.data.elevation != null
                        ? '${widget.data.elevation} m'
                        : '-',
                    style: AppStyles.textSmallBold,
                  ),
                ],
              ), // ELEVACION
            ],
          ),
          AppStyles.sizedBoxHeight32,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  AppStyles.styleIconCard(Icons.place),
                  AppStyles.sizedBoxHeight8,
                  Text('Coordenadas:', style: AppStyles.textSmallBold),
                  Text(
                    'Lat: ${widget.data.latitude}',
                    style: AppStyles.textSmallBold,
                  ),
                  Text(
                    'Lon: ${widget.data.longitude}',
                    style: AppStyles.textSmallBold,
                  ),
                ],
              ), // COORDENADAS
              Column(
                crossAxisAlignment: .start,
                children: [
                  AppStyles.styleIconCard(Icons.schedule),
                  AppStyles.sizedBoxHeight8,
                  Text('Zona horaria:', style: AppStyles.textSmallBold),
                  Text(
                    widget.data.timezone != null
                        ? widget.data.timezone.toString()
                        : '-',
                    style: AppStyles.textSmallBold,
                  ),
                ],
              ), // ZONA HORARIA
            ],
          ),
          AppStyles.sizedBoxHeight26,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:postcodes/models/data_place.dart';

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
      elevation: 16,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(Icons.groups, color: Colors.blue, size: 40),
                    Text(
                      widget.data.population != null
                          ? 'Población:\n${widget.data.population} habs.'
                          : 'Población: -',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(Icons.terrain, color: Colors.blue, size: 40),
                    Text(
                      'Elevación:',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.data.elevation != null
                          ? '${widget.data.elevation} m'
                          : '-',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(Icons.place, color: Colors.blue, size: 40),
                    Text(
                      'Coordenadas:',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lat: ${widget.data.latitude}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lon: ${widget.data.longitude}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(Icons.schedule, color: Colors.blue, size: 40),
                    Text(
                      'Timezone:',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.data.timezone != null
                          ? widget.data.timezone.toString()
                          : '-',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

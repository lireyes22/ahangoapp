import 'package:ahangoapp/config/app_google_map.dart';
import 'package:ahangoapp/config/utils/map_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timelines_plus/timelines_plus.dart';

class ItinerarioView extends ConsumerStatefulWidget {
  const ItinerarioView({super.key});

  @override
  ItinerarioViewState createState() => ItinerarioViewState();
}

class ItinerarioViewState extends ConsumerState<ItinerarioView> {
  final List<ItineraryItem> itinerary = [
    ItineraryItem(
        time: "8:00 AM",
        activity: "Desayuno en el hotel",
        location: "Hotel Riviera"),
    ItineraryItem(
        time: "10:00 AM",
        activity: "Visita a las ruinas de Tulum",
        location: "Zona Arqueológica de Tulum"),
    ItineraryItem(
        time: "12:30 PM",
        activity: "Almuerzo en la playa",
        location: "Playa Paraíso"),
    ItineraryItem(
        time: "3:00 PM",
        activity: "Snorkeling en el Gran Arrecife Maya",
        location: "Arrecife Maya"),
    ItineraryItem(
        time: "6:00 PM",
        activity: "Cena en el centro",
        location: "Restaurante La Nave"),
    ItineraryItem(
        time: "8:00 PM",
        activity: "Paseo nocturno",
        location: "Centro de Tulum"),
  ];
  final _appGoogleMap = AppGoogleMap();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            width: 600,
            height: 600,
            child: Column(
              children: [
                const Text('Alexandro Sanchez Jimenez',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 500,
                  height: 500,
                  child: Timeline.tileBuilder(
                    theme: TimelineThemeData(
                      nodePosition: 0,
                      color: Colors.green,
                      indicatorTheme: const IndicatorThemeData(
                        size: 30.0,
                        color: Colors.green,
                      ),
                    ),
                    builder: TimelineTileBuilder.connected(
                      connectionDirection: ConnectionDirection.before,
                      itemCount: itinerary.length,
                      contentsBuilder: (context, index) {
                        final item = itinerary[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.time,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold)),
                              Text(item.activity,
                                  style: const TextStyle(fontSize: 16)),
                              Text(item.location,
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        );
                      },
                      indicatorBuilder: (context, index) => const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check, // Cambia este ícono según sea necesario
                          color: Colors.white,
                        ),
                      ),
                      connectorBuilder: (_, index, __) => const SolidLineConnector(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            width: 600,
            height: 400,
            child: GoogleMap(
              style: mapStyle,
              onMapCreated: _appGoogleMap.onMapCreated,
              //zoomControlsEnabled: false,
              mapType: MapType.satellite,
              initialCameraPosition: const CameraPosition(
                zoom: 15,
                target: LatLng(18.6836535, -88.3860595),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItineraryItem {
  final String time;
  final String activity;
  final String location;

  ItineraryItem({
    required this.time,
    required this.activity,
    required this.location,
  });
}

import 'package:ahangoapp/services/google_places_api.dart';
import 'package:ahangoapp/widgets/icon_button_li.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShortsView extends ConsumerStatefulWidget {
  const ShortsView({super.key});

  @override
  ShortsViewState createState() => ShortsViewState();
}

class ShortsViewState extends ConsumerState<ShortsView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 100,
        child:
            IconButtonLi(onPressed: (a) {
              final x = GooglePlacesApi();
      
              x.obtenerDetallesDeLugar(18.1500, -88.3581);
            }, icon: const Icon(Icons.abc), label: 'label'),
      );
  }
}

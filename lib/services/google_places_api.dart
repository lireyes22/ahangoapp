import 'dart:convert';
import 'package:http/http.dart' as http;

class GooglePlacesApi {
  final apiKey = 'AIzaSyBDXalc_zdDrCmPRKWbzkOglRfF_ceTKk8';

  Future<void> obtenerDetallesDeLugar(double latitud, double longitud) async {
    const url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json' +
            '?fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry' +
            '&input=Museum%20of%20Contemporary%20Art%20Australia' +
            '&inputtype=textquery' +
            '&key=AIzaSyBDXalc_zdDrCmPRKWbzkOglRfF_ceTKk8';

    print(url);

    final response = await http.get(Uri.parse(url));
  }
}

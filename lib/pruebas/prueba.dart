// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> peticionApi(String token) async {
    const url = 'http://10.0.2.2/CatalogBackEnd/public/api/clients';

    // Define los headers que quieres agregar
    final headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      // Puedes agregar más headers si es necesario
    };

    try {
      // Realiza la petición GET
      final response = await http.get(Uri.parse(url), headers: headers);

      final data = jsonDecode(response.body);
      print('Datos obtenidos: $data');
    } catch (e) {
      // Maneja cualquier error que ocurra durante la petición
      print('Error al hacer la petición: $e');
    }
  }
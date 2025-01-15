import 'package:ahangoapp/models/estaciones_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'estaciones_provider.g.dart';

@riverpod
Future<List<Estacion>> getEstaciones(GetEstacionesRef ref) async {
  final url = Uri.parse(
      'https://apimapachitos.raccoders.com.mx/ahangobackend/public/api/estaciones');
  final response = await http.get(url);
  final data = json.decode(response.body)['data'];

  final List<Estacion> estacionesList = (data.map<Estacion>(
    (json) => Estacion(
      type: json['type'],
      id: json['id'],
      attributes: Attributes(
        estacionNombre: json['attributes']['Estacion_Nombre'],
        estacionLocalidades: EstacionLocalidades(
          localidades: json['attributes']['Estacion_Localidades']
              .map<Localidad>(
                (localidad) => Localidad(
                  localidadId: localidad['Localidad_Id'],
                  localidadNombre: localidad['Localidad_Nombre'],
                  localidadDescripcion: localidad['Localidad_Descripcion'],
                ),
              )
              .toList(),
        ),
      ),
    ),
  )).toList();
  return estacionesList;
}

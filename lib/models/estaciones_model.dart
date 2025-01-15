// Clase principal para las estaciones
class Estacion {
  final String type;
  final String id;
  final Attributes attributes;

  Estacion({
    required this.type, 
    required this.id, 
    required this.attributes
    });

}

class  Attributes{
  final String estacionNombre;
  final EstacionLocalidades estacionLocalidades;


  Attributes({
    required this.estacionNombre,
    required this.estacionLocalidades
  });
}

class EstacionLocalidades{
  final List<Localidad> localidades;

  EstacionLocalidades({
    required this.localidades
  });
}

class Localidad{
  final String localidadId;
  final String localidadNombre;
  final String localidadDescripcion;
  

  Localidad({
    required this.localidadId,
    required this.localidadNombre,
    required this.localidadDescripcion
  });
}
Map<String, List<Map<String, String>>> filterLugares(
  Map<String, List<Map<String, String>>> lugares,
  String titlesearch,
) {
  if (titlesearch.isEmpty) {
    return lugares;
  }

  // Crea un nuevo mapa para guardar los resultados filtrados.
  Map<String, List<Map<String, String>>> filteredLugares = {};

  // Itera sobre las entradas del mapa original.
  for (var entry in lugares.entries) {
    String lugar = entry.key;
    List<Map<String, String>> lista = entry.value;

    // Filtra los mapas en la lista según el título y el contenido.
    List<Map<String, String>> filteredList = lista.where((item) {
      // Verifica si el título coincide y el contenido no está vacío.
      return item['title']?.contains(titlesearch) == true &&
          item['description']?.isNotEmpty == true;
    }).toList();

    // Solo agrega el lugar al nuevo mapa si hay elementos filtrados.
    if (filteredList.isNotEmpty) {
      filteredLugares[lugar] = filteredList;
    }
  }

  return filteredLugares;
}

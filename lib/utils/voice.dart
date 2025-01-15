import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

Future<void> speak(String text) async {
  await flutterTts.setLanguage("es-ES");
  await flutterTts.setPitch(1.0); // Ajusta el tono
  await flutterTts.speak(text); // Reproduce el texto
}

Future<void> pauseTTS() async {
  await flutterTts.pause(); // Pausa el texto
}

Future<void> resetTTS() async {
  await flutterTts.stop(); // Detiene y resetea el texto
}

/*
  {"name":"es-ES-language","locale":"es-ES"}
  {"name":"es-es-x-eee-local","locale":"es-ES"}
  {"name":"es-es-x-eef-local","locale":"es-ES"}
  {"name":"es-es-x-eec-network","locale":"es-ES"}
  {"name":"es-es-x-eea-local","locale":"es-ES"}
  {"name":"es-es-x-eea-network","locale":"es-ES"}
  {"name":"es-es-x-eed-local","locale":"es-ES"}
  {"name":"es-es-x-eed-network","locale":"es-ES"}
  {"name":"es-es-x-eec-local","locale":"es-ES"}
*/
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Util {
  Util._();

  static final Map<String, Color> _cacheColors = {};

  static Future<Color> getDominantColorFromNetwork(String imageUrl) async {
    if (_cacheColors.containsKey(imageUrl)) {
      return _cacheColors[imageUrl]!;
    }

    // 1. Descargar la imagen
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode != 200) {
      throw Exception('No se pudo descargar la imagen');
    }

    // 2. Decodificar la imagen
    final codec = await ui.instantiateImageCodec(
      response.bodyBytes,
      targetWidth: 10, // Reducción para análisis más rápido
      targetHeight: 10,
    );
    final frame = await codec.getNextFrame();
    final image = frame.image;

    // 3. Obtener píxeles
    final byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    final bytes = byteData!.buffer.asUint8List();

    final Map<int, int> colorCount = {};

    for (int i = 0; i < bytes.lengthInBytes; i += 4) {
      final r = bytes[i];
      final g = bytes[i + 1];
      final b = bytes[i + 2];
      final a = bytes[i + 3];

      if (a < 255) continue; // Ignorar píxeles transparentes

      final rgb = (r << 16) | (g << 8) | b;
      colorCount[rgb] = (colorCount[rgb] ?? 0) + 1;
    }

    // 4. Determinar el color más común
    final mostFrequentColor =
        colorCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    _cacheColors[imageUrl] = Color(
      0xFF000000 | mostFrequentColor,
    ); // Alpha a 255
    return _cacheColors[imageUrl]!;
  }

  static Color darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  static bool isDark(Color color) {
    return color.computeLuminance() < 0.2;
  }

  static String getSpecie(String specie) {
    if (specie.contains('unknown')) {
      return 'Desconocido';
    } else {
      return specie;
    }
  }
}

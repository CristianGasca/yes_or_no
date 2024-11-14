
import 'package:flutter/src/widgets/text.dart';

enum FromWho { mine, AMLOs }

class Messages {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;

  Messages({ 
    required this.text,
    this.imageUrl,
    required this.fromWho, 
    DateTime? timestamp, // parámetro opcional
  }) : timestamp = timestamp ?? DateTime.now(); // Si no se pasa, se usa la hora actual
}
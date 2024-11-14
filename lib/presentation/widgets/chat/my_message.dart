import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_or_no/domain/entities/messages.dart';

class MyMessage extends StatelessWidget {

  final Messages message;

  const MyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color:  Colors.blue,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // Alineamos a la derecha
          children: [
            Text(
              DateFormat('hh:mm a').format(message.timestamp), 
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4), // Espacio entre la hora y la palomita
            const Icon(
              Icons.check, // Icono de la palomita
              size: 15,
              color: Colors.blue, // Color de la palomita
            ),
            const SizedBox(width: 3),
              const Icon( Icons.check,
              size: 15,
              color: Colors.blue,
              )
          ],
        ),
      ],
    );
  }
}
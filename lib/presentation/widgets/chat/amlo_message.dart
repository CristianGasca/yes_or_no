import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_or_no/domain/entities/messages.dart';

class AMLOMessage extends StatelessWidget {

  final Messages message;

  const AMLOMessage({super.key, required this.message});

  

 @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color:  Colors.green,
            borderRadius: BorderRadius.circular(20)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, // Alineamos a la derecha
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

        const SizedBox(height: 15),

        //imagen 
         _iamgebuble(message.imageUrl!),
         const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.start, // Alineamos a la derecha
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

class _iamgebuble extends StatelessWidget {

  final String imageUrl;

  const _iamgebuble( this.imageUrl );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(borderRadius: BorderRadius.circular(20),
    child: Image.network(imageUrl,
    width: size.width * 0.7, height: 350, fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      
      if (loadingProgress == null) return child;

      return Container(
        width: size.width * 0.7,
        height: 350,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: const Text('AMLO is sending a gif'),
      );
      
    },),

    );
  }
}
import 'package:flutter/material.dart';
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

        const SizedBox(height: 5)
      ],
    );
  }
}
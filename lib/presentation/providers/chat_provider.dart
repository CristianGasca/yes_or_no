
import 'package:flutter/material.dart';
import 'package:yes_or_no/config/theme/helpers/yes_no_answer.dart';
import 'package:yes_or_no/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier{
  
  final ScrollController chatScrollcontroler = ScrollController();
  final GetYesNoanswer getYesNoanswer = GetYesNoanswer();

  List<Messages> message = [
    Messages(text: 'Buenos dia', fromWho: FromWho.mine),
    Messages(text: 'hola', fromWho: FromWho.mine)
  ];
  // el future es una promesa
  Future<void> sendMessage(String text) async{ 
    
    final newMessage = Messages(text: text, fromWho: FromWho.mine);
    if (text.isNotEmpty){
      message.add(newMessage);
    }
   // message.add(newMessage);
    if (text.endsWith('?')){ 
       amloReply();
     }
     // notifica al provider para saber si algo cambio
    notifyListeners();
    // mueve el escroll debajo del texto 
    moveScrollToBottom();

   }


  Future<void> amloReply() async { 
    //obtener el mensaje de la peticion 
    final AMLOMessage = await getYesNoanswer.getAnswer();
    //añade el mensaje a la lista
    message.add(AMLOMessage);
    // notifica si algo cambio para el estado
    notifyListeners();
    // mueve el scroll hasta abajo 
    moveScrollToBottom();

   }

  void moveScrollToBottom(){ 
    WidgetsBinding.instance.addPostFrameCallback((_) {
    print("Max scroll extent: ${chatScrollcontroler.position.maxScrollExtent}");
    chatScrollcontroler.animateTo(
      chatScrollcontroler.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  });
    print("Numero de mensajes:");
    print(message.length);

  }
}
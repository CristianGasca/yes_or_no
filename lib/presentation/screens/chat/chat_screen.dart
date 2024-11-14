import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no/domain/entities/messages.dart';
import 'package:yes_or_no/presentation/providers/chat_provider.dart';
import 'package:yes_or_no/presentation/widgets/chat/amlo_message.dart';
import 'package:yes_or_no/presentation/widgets/chat/my_message.dart';
import 'package:yes_or_no/presentation/widgets/share/message_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Stack(
          children: [
           Text('AMLO BB💗'), Padding(
             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 1),
             child: Text( textAlign: TextAlign.left, 'Online', style: TextStyle(fontSize: 15),),
           )
          ],
        ),
        actions: <Widget>[  ButtonTheme(
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: Icon(Icons.videocam),
        ),
        ), ButtonTheme(child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(Icons.phone),
        )), ButtonTheme(child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.settings),
        ),)],
        leading: const Padding(
          padding: EdgeInsets.all(1.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://s.yimg.com/ny/api/res/1.2/mikxlE25AS8wN6FmKdBVQQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQyNw--/https://s.yimg.com/os/creatr-uploaded-images/2023-02/3fcfb540-a7f0-11ed-b9f6-a2818024442c'),
          ),
        ),
      ),
      body: _chatview(),
    );
  }
}

class _chatview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // lo que hace es pedirle al widget que este pendiente de todos los cambios
   final chatprovider = context.watch<ChatProvider>(); 

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child:ListView.builder(
              controller: chatprovider.chatScrollcontroler,
              itemCount: chatprovider.message.length,
              itemBuilder: (context, index) {
                //Es la instancia del mensaje que saldra de quien es el mensaje 
                final message = chatprovider.message[index];
              
                return (message.fromWho == FromWho.AMLOs)
                  // da el mensaje de amlo 
                  ? AMLOMessage(message: message)
                  // este da mi mensaje
                  : MyMessage(message: message,); 
            },)),
              // muestra los mensajes
             MessageBox(
              onValue: (value) => chatprovider.sendMessage(value),
             )
          ],
        ),
      ),
    );
  }  
}
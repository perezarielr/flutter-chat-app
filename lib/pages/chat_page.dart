
import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const CircleAvatar(              
              // ignore: unnecessary_const
              child: const Text('Te', style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blueAccent,
              maxRadius: 14,
            ),
            const SizedBox(height: 3),
            const Text('Melissa Flores', style: TextStyle(color: Colors.black87,fontSize: 12))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: ( _, i ) => _messages[i],
                reverse: true,
              )
            ),
            const Divider(height: 1),
            // ignore: todo
            //TODO: caja de texto
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
   );
  }

 Widget _inputChat() {

   return SafeArea(child: Container(
     margin: EdgeInsets.symmetric( horizontal: 8.0),
     child: Row(
       children: [
         Flexible(child: TextField(
           controller: _textController,
           onSubmitted: _handleSubmit,
           onChanged: ( texto ) {
             setState(() {
               if ( texto.trim().length > 0 ) {
                 _estaEscribiendo = true;
               }else {
                 _estaEscribiendo = false;
               }
             });//cuando hay un valor para poder postear
           },
           decoration: InputDecoration.collapsed(
             hintText: 'Enviar mensaje'
          ),
          focusNode: _focusNode,
         )
         ),
         //Boton de enviar
         Container(
           margin: const EdgeInsets.symmetric( horizontal: 4.0 ),
           child: IconTheme(
             data: IconThemeData( color: Colors.blue[400]),
             child: IconButton(
               highlightColor: Colors.transparent,
               splashColor: Colors.transparent,
               icon: Icon( Icons.send),
               onPressed: _estaEscribiendo
                  ? () => _handleSubmit(_textController.text.trim())
                  : null,
                  ),
              
                     ),
           )
        

       ],
     ),
   )
   );
 }

_handleSubmit(String texto) {
  print(texto);
  _textController.clear(); // borra la escrito luego de enviar
  _focusNode.requestFocus();


  final newMessage = ChatMessage(
    texto: texto,
    uid: '123',
    animationController:AnimationController(vsync: this, duration: const Duration(milliseconds: 200)));
  _messages.insert(0, newMessage);
  newMessage.animationController.forward();


  setState(() {
    _estaEscribiendo = false;
  }); // no se va el teclado 
}
@override
  void dispose() {
    // TODO: Off del socket

    for ( ChatMessage message in _messages ) {
      message.animationController.dispose();
    }

    super.dispose();
  }
}
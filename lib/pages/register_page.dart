import 'package:flutter/material.dart';

import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/custom_input.dart';


// ignore: use_key_in_widget_constructors
class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body:SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          // ignore: sized_box_for_whitespace
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                Logo(titulo: 'Registro'),
        
                _Form(),
        
                Lebels(ruta: 'login', titulo: 'Ya tienes cuenta!', subtitulo: 'Ingrasa con tú cuenta'),
        
                const Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),),
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}
class __FormState extends State<_Form> {

  final nameCtrl  = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl  =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(      
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [

            CustomInput(
              icon: Icons.perm_identity,
              placeholder: 'Nombre',
              keyboardtype: TextInputType.text,
              textController: nameCtrl,
            ),
          
            CustomInput(
              icon: Icons.mail_outline,
              placeholder: 'Correo',
              keyboardtype: TextInputType.emailAddress,
              textController: emailCtrl,
            ),

            CustomInput(
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              textController: passCtrl,
              isPassword: true,
            ),
           
           BotonAzul(
             text: 'Ingrese',
             onPressed: () {
               print( emailCtrl.text);
               print( passCtrl.text);
             },
           )
        ],
      ),
    );
  }
}


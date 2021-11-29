import 'package:flutter/material.dart';

class Lebels extends StatelessWidget {

  final String ruta;
  final String titulo;
  final String subtitulo;

  const Lebels({
    Key? key,
    required this.ruta, required this.titulo, required this.subtitulo
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Text(this.titulo , style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),),
          SizedBox(height: 10,),
          GestureDetector(
            child: Text(this.subtitulo , style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta );
            },
            ),
            
        ],
      ),
    );
  }
}
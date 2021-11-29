import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;

  const Logo({
    Key? key,
    required this.titulo
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      // ignore: avoid_unnecessary_containers
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Image(image: const AssetImage("assets/tag-logo.png")),
            const SizedBox(height: 20),
            // ignore: prefer_const_constructors
            Text(this.titulo , style: TextStyle(fontSize: 25))  
          ],
        ),
      ),
    );
  }
}
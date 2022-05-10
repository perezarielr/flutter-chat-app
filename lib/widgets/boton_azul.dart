import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BotonAzul({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // elevation: 2,
      // highlightElevation: 5,
      // shape: const StadiumBorder(),
      // color: Colors.blue,
      // ignore: unnecessary_this
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(StadiumBorder())),
      onPressed: () => this.onPressed(),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

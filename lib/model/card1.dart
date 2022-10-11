import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Card1 extends StatefulWidget {
  const Card1({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  _Card1State createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(20),
          ),
          depth: 8,
          lightSource: LightSource.bottomLeft,
          color: Colors.white),
      child: Container(
        width: MediaQuery.of(context).size.width * .44,
        height: 150,
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * .42,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.network(
            widget.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

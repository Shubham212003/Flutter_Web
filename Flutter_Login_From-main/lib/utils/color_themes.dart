import 'package:flutter/material.dart';

const Color yellowColor = Color(0xfffed813); //Yellow

const Color activeCyanColor = Color(0xff0a7c97);

const Color backgroundColor = Color(0xffebecee);

const List<Color> backgroundGradient = [
  Color(0xff80d9e9),
  Color(0xffa0e9ce),
]; //Cyan, and a mix of Cyan and Green

const List<Color> lightBackgroundaGradient = [
  Color(0xffa2e0eb),
  Color.fromARGB(255, 200, 228, 218),
];
hexStringToColor(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#","");
  if(hexColor.length==6){
    hexColor = "FF" + hexColor;

  }
  return Color(int.parse(hexColor,radix: 16));
}

class Palette {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
}

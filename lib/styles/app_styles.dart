import 'package:flutter/material.dart';

class AppStyles {
  //colores
  static final Color dark = Colors.black45;
  static final Color primary = Color(0xFF1E3A8A);
  static final Color onPrimary = Colors.white;
  static final Color blueGrey = Colors.blueGrey;

  // Configuración de textos
  static final TextStyle bigTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle textSize19 = TextStyle(fontSize: 19);
  static final TextStyle sectTitle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
  // Regular
  static final TextStyle textSize15 = TextStyle(fontSize: 15);
  static final TextStyle textMediumBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  // Medio
  static final TextStyle textSize13 = TextStyle(fontSize: 13);
  static final TextStyle textSmallBold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  // Pequeño
  static final TextStyle textSize11 = TextStyle(fontSize: 11);
  static final TextStyle textTinyBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // espaciados
  static final Widget tinySeparator = SizedBox(height: 4, width: 4);
  static final Widget smallSeparator = SizedBox(height: 8, width: 8);
  static final Widget mediumSeparator = SizedBox(height: 16, width: 16);
  static final Widget bigSeparator = SizedBox(height: 24, width: 24);

  static final Gradient gradientDark = LinearGradient(
    begin: .topCenter,
    end: .bottomCenter,
    colors: [Colors.transparent, Colors.black38, Colors.black54],
    stops: const [0.4, 0.65, 1.0],
  );

  /// Estilos por widgets

  // estilo de la barra fija
  static final Size appBar = Size.fromHeight(kToolbarHeight);

  // area de texto
  static final EdgeInsets edgeInsets16 = EdgeInsets.all(16);
}

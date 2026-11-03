import 'package:flutter/material.dart';

class AppStyles {
  //colores
  static final Color dark = Colors.black;
  static final Color greyDark = Colors.black87;
  static final Color onPrimary = Colors.white;
  static final Color primary = Color(0xFF1E3A8A);
  static final Color danger = Colors.redAccent;
  static final Color warning = Colors.orangeAccent;
  static final Color primaryAlpha = Color(0xFF1E3A8A).withValues(alpha: 0.8);
  static final Color grey = Color.fromARGB(255, 235, 236, 237);
  static final Color whiteRGB = Color.fromARGB(255, 235, 236, 237);
  static final Color whiteAlpha06 = Colors.white.withValues(alpha: 0.6);
  static final Color whiteAlpha015 = Colors.white.withValues(alpha: 0.15);

  // Configuración de textos
  static final TextStyle bigTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: dark,
  );
  static final TextStyle bigSecondaryTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: dark,
  );
  static final TextStyle textSize19 = TextStyle(fontSize: 19);
  static final TextStyle sectTitle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: dark,
  );
  // Regular
  static final TextStyle textSize16 = TextStyle(fontSize: 16);
  static final TextStyle textMediumWhiteAlpha = TextStyle(
    fontSize: 16,
    color: whiteAlpha06,
  );
  static final TextStyle textMediumWhite = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
  static final TextStyle textMediumBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  static final TextStyle textMediumBoldBlue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primaryAlpha,
  );
  // Medio
  static final TextStyle textSize14 = TextStyle(fontSize: 14);
  static final TextStyle textSmallBold = TextStyle(
    fontSize: 14,
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

  static final BorderRadius borderRadius4 = BorderRadius.circular(4.0);

  /// Estilos por widgets

  // estilo de la barra fija
  static final Size appBar = Size.fromHeight(kToolbarHeight);

  // area de texto

  static final EdgeInsets edgeInsets8 = EdgeInsets.all(8);
  static final EdgeInsets edgeInsets16 = EdgeInsets.all(16);
  static final EdgeInsets edgeInsetsSymetric124 = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 4,
  );
  static final EdgeInsets edgeInsetsSymetric1420 = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 20,
  );

  static final EdgeInsets edgeInsetsSymetric258 = EdgeInsets.symmetric(
    horizontal: 25.0,
    vertical: 8.0,
  );

  static final EdgeInsets edgeInsetsOnlytopbottom16 = EdgeInsets.only(
    top: 16,
    bottom: 16,
  );
  static final EdgeInsets edgeInsetsOnlyLeftRightbottom1620 = EdgeInsets.only(
    left: 16,
    right: 16,
    bottom: 20,
  );

  static final SizedBox sizedBoxHeight4 = SizedBox(height: 4);
  static final SizedBox sizedBoxHeight8 = SizedBox(height: 8);
  static final SizedBox sizedBoxHeight16 = SizedBox(height: 16);
  static final SizedBox sizedBoxHeight26 = SizedBox(height: 26);
  static final SizedBox sizedBoxHeight32 = SizedBox(height: 32);
  static final SizedBox sizedBoxHeight64 = SizedBox(height: 64);
  static final SizedBox sizedBoxWidth8 = SizedBox(width: 8);
  static final SizedBox sizedBoxWidth16 = SizedBox(width: 16);

  static final Divider dividerGrey = Divider(
    color: Colors.blueGrey.shade200, // Color de la línea
    thickness: 0.7, // Grosor de la línea
  );

  static final Divider dividerBlack = Divider(
    color: Colors.black, // Color de la línea
    thickness: 1.5, // Grosor de la línea
  );

  static final BoxDecoration boxDecorationRoundedWhiteAlpha015 = BoxDecoration(
    color: whiteAlpha015,
    borderRadius: BorderRadius.circular(20),
  );
  static final BoxDecoration boxDecorationPrimary = BoxDecoration(
    color: AppStyles.primary,
  );
  static final BoxDecoration boxDecorationGrey = BoxDecoration(
    color: AppStyles.grey,
    borderRadius: BorderRadius.circular(8),
  );

  static final BoxDecoration boxDecorationGreyBlackFrame = BoxDecoration(
    color: AppStyles.grey,
    borderRadius: BorderRadius.circular(32),
    border: Border.all(color: Color.fromARGB(255, 190, 192, 196)),
  );

  static Icon styleIconCard(IconData icon) {
    return Icon(icon, color: Colors.black, size: 25);
  }

  static Icon styleIconWarning(IconData icon) {
    return Icon(icon, color: danger, size: 30);
  }

  static Icon styleIconDangerWhite(IconData icon) {
    return Icon(icon, color: Colors.white, size: 30);
  }

  static Icon styleIconDangerRed(IconData icon) {
    return Icon(icon, color: Colors.redAccent, size: 30);
  }

  static final RoundedRectangleBorder roundedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  );
}

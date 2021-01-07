import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  final BuildContext context;

  MyTheme({this.context});

  var pageTransition = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    },
  );

  MaterialColor colorCustom = MaterialColor(0xFF167BD8, {
    50: Color.fromRGBO(22, 123, 216, .1),
    100: Color.fromRGBO(22, 123, 216, .2),
    200: Color.fromRGBO(22, 123, 216, .3),
    300: Color.fromRGBO(22, 123, 216, .4),
    400: Color.fromRGBO(22, 123, 216, .5),
    500: Color.fromRGBO(22, 123, 216, .6),
    600: Color.fromRGBO(22, 123, 216, .7),
    700: Color.fromRGBO(22, 123, 216, .8),
    800: Color.fromRGBO(22, 123, 216, .9),
    900: Color.fromRGBO(22, 123, 216, 1),
  });

  final googleFont = GoogleFonts.nunitoSansTextTheme;

  ThemeData get current => ThemeData(
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          color: Colors.white,
          elevation: 0,
          textTheme: googleFont(Theme.of(context)
              .textTheme
              .apply(bodyColor: colorCustom, fontSizeDelta: 16))),
      brightness: Brightness.light,
      accentColor: Colors.white,
      canvasColor: Colors.white,
      primaryColor: colorCustom,
      shadowColor: Color(0xCCa9a9a9),
      errorColor: Color(0xFFF31629),
      textTheme: googleFont(Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
          )),
      pageTransitionsTheme: pageTransition,
      bottomAppBarColor: MaterialColor(0xFF990E4F, {}));
}

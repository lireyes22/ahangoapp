import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF00BF6D);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF2F6F50);
//const kContentColorLightTheme = Color(0xFF0A3D2A);
//const kContentColorLightTheme = Color(0xFF10271F);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const CustomColors(
        colorOne: Colors.white,
      ),
    ],
    primaryColor: kPrimaryColor,
    cardColor: const Color(0xFF77C3C9),
    primaryColorLight: const Color(0xFF82D7DC),
    primaryColorDark: const Color.fromARGB(255, 35, 144, 150),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme.copyWith(
        backgroundColor: const Color(0xFF82D7DC),
        shape: const Border(bottom: BorderSide(color: Colors.black, width: 1)),
        centerTitle: true),
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 23, 54, 39)),
    textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: const Color.fromARGB(255, 0, 0, 0)),
    /* textTheme: GoogleFonts.antonTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme), */
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        overlayColor: WidgetStateProperty.all<Color>(
            Colors.black.withOpacity(0.2)), // Color del splash
        elevation: WidgetStateProperty.all<double>(10), // Elevación del botón
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    cardTheme: const CardTheme(
      color: Color(0xFFFFFFFF),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const CustomColors(
        colorOne: Colors.white,
      ),
    ],
    cardColor: Colors.teal[900],
    primaryColorLight: Colors.teal[900],
    primaryColor: kPrimaryColor,
    primaryColorDark: kContentColorLightTheme,
    scaffoldBackgroundColor: Colors.teal[600],
    appBarTheme: appBarTheme.copyWith(
        backgroundColor: const Color.fromARGB(255, 0, 95, 84),
        shape: const Border(bottom: BorderSide(color: Colors.white, width: 1)),
        centerTitle: true),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
    cardTheme: const CardTheme(
      color: Color.fromRGBO(0, 77, 64, 1),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

// Clase para definir el color personalizado
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? colorOne;

  const CustomColors({this.colorOne});

  @override
  CustomColors copyWith({Color? colorOne}) {
    return CustomColors(
      colorOne: colorOne ?? this.colorOne,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      colorOne: Color.lerp(colorOne, other.colorOne, t),
    );
  }
}


/**
 * brightness == Brightness.light
              ? Colors.green[200]
              : Colors.teal[600],
 */












/* const seedColor =  Color(0xFF2F6F50);

class AppTheme {
  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,

    listTileTheme: const ListTileThemeData(
      iconColor: seedColor,
      textColor: seedColor,
      
    ),
    scaffoldBackgroundColor: isDarkmode ? Colors.black : Colors.white,
    
  );
} */
/**
 * //colorSchemeSeed: const Color(0xFF2F6F50),
    //colorSchemeSeed: const Color(0xFF4FAF5A),
    //colorSchemeSeed: const Color(0xFF4EAF58),
 */
/*  useMaterial3: true,
        primaryColor: const Color(0xFF2f6f50),
        primaryColorLight: const Color(0xFF4faf5a),
        primaryColorDark: const Color(0xFF4eaf58),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF2f6f50), // Cambiado de backgroundColor a color
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF2f6f50),
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(const Color(0xFFFFFFFF)),
          foregroundColor:
              WidgetStateProperty.all<Color>(const Color(0xFF4faf5a)),
          overlayColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return const Color(
                  0x334faf5a); // Color verde translúcido cuando el botón está presionado
            }
            return Colors.transparent;
          }),
        )),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF2f6f50)),
          bodyMedium: TextStyle(color: Color(0xFF4faf5a)),
          bodySmall: TextStyle(color: Color(0xFF4eaf58)),
          headlineLarge: TextStyle(color: Color(0xFFFFFFFF)),
          headlineMedium: TextStyle(color: Color(0xFF2f6f50)),
          headlineSmall: TextStyle(color: Color(0xFF4faf5a)),
          titleLarge: TextStyle(color: Color(0xFF4eaf58)),
          titleMedium: TextStyle(color: Color(0xFFFFFFFF)),
          titleSmall: TextStyle(color: Color(0xFF2f6f50)),
          labelLarge: TextStyle(color: Color(0xFF4faf5a)),
          labelMedium: TextStyle(color: Color(0xFF4eaf58)),
          labelSmall: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), */
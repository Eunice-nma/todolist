import 'package:flutter/material.dart';

/*
ThemeData basicTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
      headline5: base.headline5.copyWith  (
          fontSize: 20.0,
          color: Colors.grey[500],
          fontWeight: FontWeight.w500
      )
    );
  }

  final ThemeData base= ThemeData.dark();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
  );
}
*/
class AppTheme extends ChangeNotifier{

  ThemeData _selectedTheme;

  //static final ThemeData lightTheme = ThemeData(
  ThemeData light= ThemeData.light().copyWith(
    accentColor: Colors.grey[200],
    appBarTheme: AppBarTheme(
      color: Colors.white
    ),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.grey[900],
            fontSize: 18.0,
            fontWeight: FontWeight.w400
        ),
        bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w400
        ),
        headline1: TextStyle(
            color: Colors.black,
            fontSize: 27.0,
            fontWeight: FontWeight.w500
        ),

    ),
    shadowColor: Colors.grey.withOpacity(0.8),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[400],
    )
  );

  //static final ThemeData darkTheme = ThemeData(
  ThemeData dark= ThemeData.dark().copyWith(
      accentColor: Colors.grey[800],
      appBarTheme: AppBarTheme(
        color: Colors.black
      ),
      scaffoldBackgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white70,
          fontSize: 20.0,
          fontWeight: FontWeight.w500
        ),
        bodyText2: TextStyle(
           color: Colors.white70,
           fontSize: 12.0,
           fontWeight: FontWeight.w400
        ),
        headline1: TextStyle(
            color: Colors.white,
            fontSize: 27.0,
            fontWeight: FontWeight.w500
        ),

    ),
    shadowColor: Colors.black12.withOpacity(0.8),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[850],
    )

  );

  AppTheme({bool isDarkTheme}){
    _selectedTheme = isDarkTheme? dark : light;
  }

  void swapTheme() {
    _selectedTheme = _selectedTheme == dark? light : dark;
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;


}
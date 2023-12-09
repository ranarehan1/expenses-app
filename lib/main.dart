import 'package:expenses_app_two/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp
  //   ]
  // ).then((fn) {
  //
  // });
  runApp(
    const MyApp(),
  );
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 136, 206, 253),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 21, 74, 101),
);




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  var iconBool= false;

  void changingTheme(){
    if(iconBool == false){
     setState(() {
       iconBool = true;
     });
      return;
    }
    if(iconBool == true){
      setState(() {
        iconBool = false;
      });
      return;
    }
  }


  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: iconBool? ThemeMode.dark : ThemeMode.light,
      //Dark theme starts here
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.secondaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(

          titleLarge:  const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 22
        ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: kDarkColorScheme.onSecondaryContainer,
            )
        )
      ),

      //Light Theme starts here


      theme: ThemeData().copyWith(

        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 22,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: kColorScheme.onSecondaryContainer,
          )
        ),

      ),
      home:   Expenses(onChangingTheme: changingTheme, iconBool: iconBool),
    );
  }
}

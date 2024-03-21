import 'package:cozo/src/features/splash/presentation/views/splash.dart';
import 'package:flutter/material.dart';

void main() async{

   
  runApp(Cozo());
}

class Cozo extends StatelessWidget {
  
  const Cozo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.black)),
        scaffoldBackgroundColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(fontFamily:'Tajawal'),
      ),
      home:SplashScreen(key: super.key),
    );
  }
}

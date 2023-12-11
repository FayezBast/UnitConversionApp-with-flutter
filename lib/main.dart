import 'package:mobileappproject/screens/Lenghtcoversion.dart';
import 'package:mobileappproject/screens/Moneyconversion.dart';
import 'package:mobileappproject/screens/Weghtconversion.dart';
import 'package:mobileappproject/screens/Temperatureconversion.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Conversion App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          secondaryHeaderColor: Colors.red,
        ),
        home: LengthConversionScreen(),
        routes: {
          LengthConversionScreen.routeName: (ctx) => LengthConversionScreen(),
          TemperatureConversionScreen.routeName: (ctx) =>
              TemperatureConversionScreen(),
          WeightConversionScreen.routeName: (ctx) => WeightConversionScreen(),
          MoneyConversionScreen.routeName:(ctx) => MoneyConversionScreen() 
        },
      ),
    );
  }
}

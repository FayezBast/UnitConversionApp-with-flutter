import 'package:mobileappproject/screens/Lenghtcoversion.dart';
import 'package:mobileappproject/screens/Moneyconversion.dart';
import 'package:mobileappproject/screens/Weghtconversion.dart';
import 'package:mobileappproject/screens/Temperatureconversion.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'What you want to convert?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.linear_scale),
            title: Text('Length'),
            onTap: () {
              Navigator.restorablePushNamed(
                  context, LengthConversionScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.thermostat_outlined),
            title: Text('Temperature'),
            onTap: () {
              Navigator.restorablePushNamed(
                  context, TemperatureConversionScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.monitor_weight),
            title: Text('Weight'),
            onTap: () {
              Navigator.restorablePushNamed(
                  context, WeightConversionScreen.routeName);
            },
          ),
            ListTile(
            leading: Icon(Icons.currency_exchange),
            title: Text('Currency'),
            onTap: () {
              Navigator.restorablePushNamed(
                  context, MoneyConversionScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

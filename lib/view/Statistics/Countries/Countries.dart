import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_blue_color,

      body: Center(

        child: Text('CountriesView',style: TextStyle(fontSize: 30,color: Colors.amber),),
      ),
    );
  }
}
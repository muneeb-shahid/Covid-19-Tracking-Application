import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';

class TotalView extends StatelessWidget {
  const TotalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_pink_color,
       body: Center(
        child: Text('TotalView',style: TextStyle(fontSize: 30,color: Colors.amber),),
      ),
    );
  }
}

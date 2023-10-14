import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/CountriesViewController/CountriesViewController.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    CountriesViewController countriesViewController =
        Get.put(CountriesViewController());
    return Scaffold(
        backgroundColor: App_Constants_Colors.app_background_color,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  focusNode: countriesViewController.focusnode1,
                  style: TextStyle(color: App_Constants_Colors.app_black_color),
                  decoration: InputDecoration(
                    
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2,
                            color: App_Constants_Colors.app_green_color)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: App_Constants_Colors.app_black_color,
                    ),
                    hintText: "Search with countries names",
                    hintStyle:
                        TextStyle(color: App_Constants_Colors.app_black_color),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  controller: countriesViewController.searchController,
                )
              ],
            ),
          ),
        ));
  }
}

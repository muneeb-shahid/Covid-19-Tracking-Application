import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/TextParagraph/TextParagraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/services/StatesServices/StatesServices.dart';
import 'package:covid_19_trackingapp/view/FullScreenCountriesDetail/FullScreenCountriesDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/CountriesViewController/CountriesViewController.dart';
import 'package:shimmer/shimmer.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices _statesServices = Get.put(StatesServices());
    CountriesViewController countriesViewController =
        Get.put(CountriesViewController());
    return Scaffold(
        backgroundColor: App_Constants_Colors.app_background_color,
        body: GetBuilder<CountriesViewController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  TextFormField(
                    focusNode: countriesViewController.focusnode1,
                    onChanged: (value) {
                      countriesViewController.UpdateonChanged(value);
                    },
                    style:
                        TextStyle(color: App_Constants_Colors.app_black_color),
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          countriesViewController.searchController.clear();
                        },
                        icon: Icon(
                          Icons.close,
                          color: App_Constants_Colors.app_black_color,
                        ),
                      ),
                      hintText: "Search with countries names",
                      hintStyle: TextStyle(
                          color: App_Constants_Colors.app_black_color),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    controller: countriesViewController.searchController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  FutureBuilder(
                    future: _statesServices.fetchCountriesModel(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data?.length.toInt(),
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        height: screenHeight * 0.1,
                                        width: screenWidth * 0.15,
                                        color: App_Constants_Colors
                                            .app_white_color,
                                      ),
                                      title: Container(
                                        height: screenHeight * 0.01,
                                        width: screenWidth * 0.01,
                                        color: App_Constants_Colors
                                            .app_white_color,
                                      ),
                                      subtitle: Container(
                                        height: screenHeight * 0.01,
                                        width: screenWidth * 0.01,
                                        color: App_Constants_Colors
                                            .app_white_color,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]["country"];

                              if (countriesViewController
                                  .searchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                          FullScreenCountriesDetail(
                                            data: snapshot.data![index],
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Image(
                                            height: screenHeight * 0.15,
                                            width: screenWidth * 0.15,
                                            image: NetworkImage(
                                              snapshot.data![index]
                                                  ["countryInfo"]["flag"],
                                            )),
                                        title: TextHeading(
                                            snapshot.data![index]["country"],
                                            App_Constants_Colors
                                                .app_black_color),
                                        subtitle: TextParagraph(
                                            "Total Cases: ${snapshot.data![index]["cases"].toString()}\nTotal Recovered: ${snapshot.data![index]["recovered"].toString()} ",
                                            App_Constants_Colors
                                                .app_grey_color),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ),
                                  ],
                                );
                              } else if (name.toLowerCase().contains(
                                  countriesViewController.searchController.text
                                      .toLowerCase())) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                          FullScreenCountriesDetail(
                                            data: snapshot.data![index],
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Image(
                                            height: screenHeight * 0.15,
                                            width: screenWidth * 0.15,
                                            image: NetworkImage(
                                              snapshot.data![index]
                                                  ["countryInfo"]["flag"],
                                            )),
                                        title: TextHeading(
                                            snapshot.data![index]["country"],
                                            App_Constants_Colors
                                                .app_black_color),
                                        subtitle: TextParagraph(
                                            "Total Cases: ${snapshot.data![index]["cases"].toString()}\nTotal Recovered: ${snapshot.data![index]["recovered"].toString()} ",
                                            App_Constants_Colors
                                                .app_grey_color),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.02,
                                    ),
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}

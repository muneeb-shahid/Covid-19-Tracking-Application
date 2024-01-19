import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/text_paragraph/text_paragraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/services/states_services/states_services.dart';
import 'package:covid_19_trackingapp/view/full_Screen_countries_detail/full_Screen_countries_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/countries_view_controller/countries_view_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../reuseable_components/custom_button/login_and_signup_button.dart';


class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = Get.put(StatesServices());
    CountriesViewController countriesViewController =
        Get.put(CountriesViewController());
    return Scaffold(
        backgroundColor: AppConstantsColors.appBackgroundColor,
        body: GetBuilder<CountriesViewController>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  TextFormField(
                    focusNode: countriesViewController.focusnode1,
                    onChanged: (value) {
                      countriesViewController.UpdateonChanged(value);
                    },
                    style: TextStyle(color: AppConstantsColors.appBlackColor),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              width: 2,
                              color: AppConstantsColors.appGreenColor)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppConstantsColors.appBlackColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          countriesViewController.searchController.clear();
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppConstantsColors.appBlackColor,
                        ),
                      ),
                      hintText: "Search with countries names",
                      hintStyle:
                          TextStyle(color: AppConstantsColors.appBlackColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    controller: countriesViewController.searchController,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  FutureBuilder(
                    future: statesServices.fetchCountriesModel(),
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
                                        color: AppConstantsColors
                                            .appWhiteColor,
                                      ),
                                      title: Container(
                                        height: screenHeight * 0.01,
                                        width: screenWidth * 0.01,
                                        color: AppConstantsColors
                                            .appWhiteColor,
                                      ),
                                      subtitle: Container(
                                        height: screenHeight * 0.01,
                                        width: screenWidth * 0.01,
                                        color: AppConstantsColors
                                            .appWhiteColor,
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
                                        title: textHeading(
                                            snapshot.data![index]["country"],
                                            AppConstantsColors.appBlackColor),
                                        subtitle: textParagraph(
                                            "Total Cases: ${snapshot.data![index]["cases"].toString()}\nTotal Recovered: ${snapshot.data![index]["recovered"].toString()} ",
                                            AppConstantsColors.appGreyColor),
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
                                        title: textHeading(
                                            snapshot.data![index]["country"],
                                            AppConstantsColors.appBlackColor),
                                        subtitle: textParagraph(
                                            "Total Cases: ${snapshot.data![index]["cases"].toString()}\nTotal Recovered: ${snapshot.data![index]["recovered"].toString()} ",
                                            AppConstantsColors.appGreyColor),
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

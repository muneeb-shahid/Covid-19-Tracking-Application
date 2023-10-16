import 'package:covid_19_trackingapp/routes/approutes.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:covid_19_trackingapp/view/Statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/Statistics/StatisticsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid 19 Application',
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: StatisticsView(),
          // getPages: AppRoutes.appRoutes(),
        );
      },
    );
  }
}

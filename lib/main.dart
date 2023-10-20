import 'package:covid_19_trackingapp/Reuseable%20Components/InternetConnection/InternetConnection.dart';
import 'package:covid_19_trackingapp/routes/approutes.dart';
import 'package:covid_19_trackingapp/view/Help/HelpView.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:covid_19_trackingapp/view/Statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/Statistics/StatisticsView.dart';
import 'package:covid_19_trackingapp/view/Symptoms/SymptomsView.dart';
import 'package:covid_19_trackingapp/view/WriteArticles/WriteArticles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          home: HomeView(),
          // getPages: AppRoutes.appRoutes(),
        );
      },
    );
  }
}

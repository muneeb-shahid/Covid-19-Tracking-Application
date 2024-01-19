import 'package:covid_19_trackingapp/controller/my_app_controller/my_app_controller.dart';
import 'package:covid_19_trackingapp/dependency_injection.dart';
import 'package:covid_19_trackingapp/routes/approutes.dart';
import 'package:covid_19_trackingapp/view/Articles/ArticlesView.dart';
import 'package:covid_19_trackingapp/view/CreateBlog/CreateBlog.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:covid_19_trackingapp/view/OnBoardingScreen/OnBoardingScreen.dart';
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
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyAppController appController = Get.put(MyAppController());
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
          getPages: AppRoutes.appRoutes(),
          // home: CreateBlog(),
          // home: appController.user != null ? HomeView() : OnBoardingScreen(),
        );
      },
    );
  }
}

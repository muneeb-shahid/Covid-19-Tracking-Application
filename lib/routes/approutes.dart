import 'package:covid_19_trackingapp/routes/routes_name.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:covid_19_trackingapp/view/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.OnBoardingScreen,
          page: () => OnBoardingScreen(),
        ),

        GetPage(
          name: RoutesName.HomeView,
          page: () => HomeView(),
        ),
        // GetPage(name: RoutesName.SignUp, page: () => SignUp()),
        // GetPage(
        //   name: RoutesName.EmailVerification,
        //   page: () => EmailVerification(),
        // ),
        // GetPage(
        //   name: RoutesName.EmailVerification,
        //   page: () => ForgetPassword(),
        // ),
        // GetPage(
        //   name: RoutesName.EmailVerification,
        //   page: () => HomePage(),
        // ),
        // GetPage(
        //   name: RoutesName.Note,
        //   page: () => Note(),
        // ),
        // GetPage(
        //   name: RoutesName.Checklist,
        //   page: () => Checklist(),
        // ),
        // GetPage(
        //   name: RoutesName.Folder,
        //   page: () => Folder(),
        // ),
        // GetPage(
        //   name: RoutesName.FullPageNote,
        //   page: () => FullPageNote(),
        // ),
      
      ];
}

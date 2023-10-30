import 'package:covid_19_trackingapp/routes/routes_name.dart';
import 'package:covid_19_trackingapp/view/Articles/ArticlesView.dart';
import 'package:covid_19_trackingapp/view/BlogFullPost/BlogFullPost.dart';
import 'package:covid_19_trackingapp/view/CreateBlog/CreateBlog.dart';
import 'package:covid_19_trackingapp/view/FullScreenCountriesDetail/FullScreenCountriesDetail.dart';
import 'package:covid_19_trackingapp/view/Help/HelpView.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:covid_19_trackingapp/view/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:covid_19_trackingapp/view/Statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/Statistics/StatisticsView.dart';
import 'package:covid_19_trackingapp/view/Statistics/Total/Total.dart';
import 'package:covid_19_trackingapp/view/Symptoms/SymptomsView.dart';
import 'package:covid_19_trackingapp/view/WriteArticles/WriteArticles.dart';
import 'package:covid_19_trackingapp/view/signUp/signUp.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.OnBoardingScreen,
          page: () => const OnBoardingScreen(),
        ),
        GetPage(
          name: RoutesName.HomeView,
          page: () => const HomeView(),
        ),
        GetPage(name: RoutesName.ArticlesView, page: () => ArticlesView()),
        GetPage(
          name: RoutesName.BlogFullPost,
          page: () => BlogFullPost(
            blogData: null,
          ),
        ),
        GetPage(
          name: RoutesName.CreateBlog,
          page: () => CreateBlog(),
        ),
        GetPage(
          name: RoutesName.FullScreenCountriesDetail,
          page: () => FullScreenCountriesDetail(),
        ),
        GetPage(
          name: RoutesName.HelpView,
          page: () => HelpView(),
        ),
        GetPage(
          name: RoutesName.Login,
          page: () => Login(),
        ),
        GetPage(
          name: RoutesName.SignUp,
          page: () => SignUp(),
        ),
        GetPage(
          name: RoutesName.StatisticsView,
          page: () => StatisticsView(),
        ),
        GetPage(
          name: RoutesName.TotalView,
          page: () => TotalView(),
        ),
        GetPage(
          name: RoutesName.CountriesView,
          page: () => CountriesView(),
        ),
        GetPage(
          name: RoutesName.SymptomsView,
          page: () => SymptomsView(),
        ),
        GetPage(
          name: RoutesName.WriteArticles,
          page: () => WriteArticles(),
        ),
      ];
}

import 'package:covid_19_trackingapp/routes/routes_name.dart';
import 'package:covid_19_trackingapp/view/articles/articles_view.dart';
import 'package:covid_19_trackingapp/view/blog_full_post/blog_full_post.dart';
import 'package:covid_19_trackingapp/view/create_blog/create_blog.dart';
import 'package:covid_19_trackingapp/view/full_Screen_countries_detail/full_Screen_countries_detail.dart';
import 'package:covid_19_trackingapp/view/help/help_view.dart';
import 'package:covid_19_trackingapp/view/home_view/home_view.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:covid_19_trackingapp/view/onboarding_screen/onboarding_screen.dart';
import 'package:covid_19_trackingapp/view/statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/statistics/statistics_view.dart';
import 'package:covid_19_trackingapp/view/statistics/Total/Total.dart';
import 'package:covid_19_trackingapp/view/symptoms/symptoms_view.dart';
import 'package:covid_19_trackingapp/view/write_articles/write_articles.dart';
import 'package:covid_19_trackingapp/view/signUp/signUp.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.onBoardingScreen,
          page: () => const OnBoardingScreen(),
        ),
        GetPage(
          name: RoutesName.homeView,
          page: () => const HomeView(),
        ),
        GetPage(name: RoutesName.articlesView, page: () => ArticlesView()),
        GetPage(
          name: RoutesName.blogFullPost,
          page: () => BlogFullPost(
            blogData: null,
          ),
        ),
        GetPage(
          name: RoutesName.createBlog,
          page: () => CreateBlog(),
        ),
        GetPage(
          name: RoutesName.fullScreenCountriesDetail,
          page: () => FullScreenCountriesDetail(),
        ),
        GetPage(
          name: RoutesName.helpView,
          page: () => HelpView(),
        ),
        GetPage(
          name: RoutesName.login,
          page: () => Login(),
        ),
        GetPage(
          name: RoutesName.signUp,
          page: () => SignUp(),
        ),
        GetPage(
          name: RoutesName.statisticsView,
          page: () => StatisticsView(),
        ),
        GetPage(
          name: RoutesName.totalView,
          page: () => TotalView(),
        ),
        GetPage(
          name: RoutesName.countriesView,
          page: () => CountriesView(),
        ),
        GetPage(
          name: RoutesName.symptomsView,
          page: () => SymptomsView(),
        ),
        GetPage(
          name: RoutesName.writeArticles,
          page: () => WriteArticles(),
        ),
      ];
}

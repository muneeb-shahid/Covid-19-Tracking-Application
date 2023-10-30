import 'package:covid_19_trackingapp/controller/NetworkController/network_controller.dart';
import 'package:get/get.dart';


class DependencyInjection {
  
  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}
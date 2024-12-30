import 'package:get/get.dart';
import 'package:machine_test/utis/app_routes.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SplashController);
  }

}
class SplashController extends GetxController{
  static SplashController get to =>Get.find();
  @override
  void onInit() {
    print('Here');
    super.onInit();
  }
  // @override
  // void onInit() {
  //   super.onInit();
  //   _startSplashTimer();
  // }
  // void _startSplashTimer() {
  //   Future.delayed( Duration(seconds: 3), () {
  //     Get.toNamed(Routes.home);
  //     print('object=====');
  //   });
  // }
}



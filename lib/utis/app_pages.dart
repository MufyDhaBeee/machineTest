import 'package:get/get.dart';
import 'package:machine_test/UI/Home/bind/home_bind.dart';
import 'package:machine_test/UI/Home/view/home_view.dart';
import 'package:machine_test/UI/splash/bind/splash_bind.dart';
import 'package:machine_test/UI/splash/view/splash_view.dart';
import 'package:machine_test/UI/userAdd/bind/useradd_bind.dart';
import 'package:machine_test/UI/userAdd/view/useradd_view.dart';
import 'package:machine_test/utis/app_routes.dart';

abstract class AppPage {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.usrAdd,
        page: () => UserAddView(),
         binding: UserAddBinding(),
    ),
  ];
}

import 'package:first_first_project/res/routes/routes_name.dart';
import 'package:first_first_project/src/screens/login_screen.dart';
import 'package:first_first_project/src/screens/user_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.LOGIN_SCREEN,
            page: () => const LoginScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.USER_SCREEN,
            page: () => const UserScreen(title: 'Flutter App'),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.rightToLeftWithFade),
    GetPage(
        name: RoutesName.PRODUCT_SCREEN,
        page: () => const UserScreen(title: 'Flutter App'),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.rightToLeftWithFade)
      ];
}

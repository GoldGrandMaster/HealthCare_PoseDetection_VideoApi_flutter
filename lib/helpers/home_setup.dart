import 'package:get/get.dart';
import '../components/home_view.dart';
import 'home_controller.dart';

class HomeSetup {
  static const initialRoute = '/home';

  static final routes = [
    GetPage(
      name: initialRoute,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );
      }),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:social_app/view/main/bindings/main_binding.dart';
import '../../core/routes/app_routes.dart';
import '../../view/main/ui/main_page.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const MainPage(),
        binding: MainBinding()),
  ];
}

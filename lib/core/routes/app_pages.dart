import 'package:get/get.dart';
import 'package:social_app/home/bindings/home_binding.dart';
import 'package:social_app/home/ui/home_page.dart';
import '../../core/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
  ];
}

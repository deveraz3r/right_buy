import 'package:rightbuy/view/all%20brands/all_brand_screen.dart';
import 'package:rightbuy/view/home%20screen/home_screen.dart';
import 'package:rightbuy/view/splash_screen.dart';

import '../../view/select_languages_screen.dart';
import '../navigation_screen/navigation_screen.dart';
import '../urls.dart';

class Routes {
  static appRoutes() => [
        GetPage(
            name: RoutesNames.splashScreen, page: () => const SplashScreen()),
        GetPage(
            name: RoutesNames.selectLanguageScreen,
            page: () => SelectLanguageScreen()),
        GetPage(name: RoutesNames.homeScreen, page: () => HomeScreen()),
        GetPage(
            name: RoutesNames.bottomNavigationBar,
            page: () => NavigationScreen()),
        GetPage(
            name: RoutesNames.historyScreen, page: () => const HistoryScreen()),
        GetPage(
            name: RoutesNames.dashboardScreen,
            page: () => const DashboardScreen()),
    GetPage(
            name: RoutesNames.brandScreen,
            page: () => const BrandsScreen()),
    GetPage(
        name: RoutesNames.imageDetailsScreen,
        page: () => const ImageDetailsScreen(imagePath: '')),
      ];
}

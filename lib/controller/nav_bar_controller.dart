import 'package:get/get.dart';
import 'package:rightbuy/resources/navigation_screen/navigation_screen.dart';
import 'package:rightbuy/resources/urls.dart';
import 'package:rightbuy/view/home%20screen/home_screen.dart';

class NavBarController extends GetxController {
  List children = [
    HomeScreen(),
    const SearchPage(),
    const ListPage(),
    DashboardScreen(),
  ];
  RxInt selectedIndex = 0.obs;

  void OnTap(int index){
    selectedIndex.value = index;
  }
}


// HomeScreen(),
// const SearchPage(),
// const CameraPage(), // Placeholder for the camera screen
// const ListPage(),
// const DashboardScreen(),
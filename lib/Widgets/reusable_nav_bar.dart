import 'package:flutter/material.dart';
import 'package:rightbuy/controller/nav_bar_controller.dart';
import 'package:rightbuy/resources/urls.dart';

class ReusableNavBar extends StatelessWidget {
  ReusableNavBar({super.key});

  NavBarController _navBarController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: primaryColor,
      child: Obx(
        () => Row(
          children: [
            _navItem(
              Icons.home,
              _navBarController.selectedIndex.value == 0,
              onTap: () => _navBarController.OnTap(0),
            ),
            _navItem(
              Icons.search,
              _navBarController.selectedIndex.value == 1,
              onTap: () => _navBarController.OnTap(1),
            ),
            SizedBox(width: 70,),
            _navItem(
              Icons.list_alt,
              _navBarController.selectedIndex.value == 2,
              onTap: () => _navBarController.OnTap(2),
            ),
            _navItem(
              Icons.account_circle,
              _navBarController.selectedIndex.value == 3,
              onTap: () => _navBarController.OnTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _navItem(IconData icon, bool isSelected, {VoidCallback? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: isSelected? Colors.red: Colors.white,
        size: 30,
      ),
    ),
  );
}

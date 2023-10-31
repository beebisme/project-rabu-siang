import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/routes/app_pages.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
    required Null Function(dynamic index) onItemTapped,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'Main',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: index, // Ganti selectedIndex menjadi index
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      onTap: (index) {
        if (index == 0) {
          Get.toNamed(Routes
              .home_screen_view); // Ganti Routes.home_screen_view menjadi Routes.HOME_SCREEN
        } else if (index == 1) {
          // Tambahkan perintah yang sesuai untuk tampilan Browse jika diperlukan
        } else if (index == 2) {
          // Tambahkan perintah yang sesuai untuk tampilan Favorites jika diperlukan
        } else if (index == 3) {
          Get.toNamed(Routes.PROFILE);
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// Import screen widgets yang digunakan
import 'package:alfariz_property/features/shop/screens/home/home.dart';
import 'package:alfariz_property/features/personalization/screens/settings/settings.dart';

// Import helper function yang mungkin diperlukan
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key});

void _launchUrl() async {
  final Uri _url = Uri.parse('https://wa.me/6281259352510');
  if (!await launchUrl(_url)) {
  throw Exception('Could not launch $_url');
  }
}

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.black : Colors.white,
          selectedItemColor: darkMode ? Colors.white : Colors.black,
          unselectedItemColor: darkMode ? Colors.grey : Colors.grey[600],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchUrl, // Menggunakan openWebURL untuk membuka URL web
        child: const Icon(Iconsax.message_square),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const SettingsScreen(),
  ];
}

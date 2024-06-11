import 'package:alfariz_property/common/widgets/appbar/appbar.dart';
import 'package:alfariz_property/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:alfariz_property/common/widgets/layouts/list_tile/settings_menu_tile.dart';
import 'package:alfariz_property/common/widgets/layouts/list_tile/user_profile_tile.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/authentication/screens/login/login.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:alfariz_property/features/personalization/screens/profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                    title: Text('Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.light))),
                TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: Tsizes.spaceBtwSection),

                /// user profile

              ],
            ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: Tsizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  const SizedBox(height: Tsizes.spaceBtwSection),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // Remove token from local storage
                          TLocalStorage().removeData('token');

                          // Navigate to the login screen
                          Get.offAll(() => const LoginScreen());
                        },
                        child: const Text('Logout')),
                  ),
                  // const SizedBox(height: Tsizes.spaceBtwSection * 2.5)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

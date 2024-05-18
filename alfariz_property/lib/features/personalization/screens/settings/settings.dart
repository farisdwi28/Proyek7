import 'package:alfariz_property/common/widgets/appbar/appbar.dart';
import 'package:alfariz_property/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:alfariz_property/common/widgets/layouts/list_tile/settings_menu_tile.dart';
import 'package:alfariz_property/common/widgets/layouts/list_tile/user_profile_tile.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/authentication/screens/login/login.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                const SizedBox(height: Tsizes.spaceBtwSection),

                /// user profile

                const TUserProfileTile(),
                const SizedBox(height: Tsizes.spaceBtwSection),
              ],
            )),

            /// body
            Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: Tsizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set Shopping delivery address',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add remove products and move to checkout',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed orders',
                    onTap: () {},
                  ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.bank,
                  //   title: 'Bank Account',
                  //   subTitle: 'Withdraw balance to registered bank account',
                  //   onTap: () {},
                  // ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.security_card,
                  //   title: 'Account Privacy',
                  //   subTitle: 'Manage datausage and connected accounts',
                  //   onTap: () {},
                  // ),

                  // app settings

                  // const SizedBox(height: Tsizes.spaceBtwSection),
                  // const TSectionHeading(
                  //     title: 'App Settings', showActionButton: false),
                  // const SizedBox(height: Tsizes.spaceBtwItems),
                  // const TSettingsMenuTile(
                  //     icon: Iconsax.document_upload,
                  //     title: 'Load Data',
                  //     subTitle: 'Upload Data to your Firebase'),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.location,
                  //   title: 'Geolocation',
                  //   subTitle: 'Set recommendation based on location',
                  //   trailing: Switch(value: true, onChanged: (value) {}),
                  // ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.security_user,
                  //   title: 'Safe Mode',
                  //   subTitle: 'Search result is safe for all ages',
                  //   trailing: Switch(value: false, onChanged: (value) {}),
                  // ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.image,
                  //   title: 'HD image quality',
                  //   subTitle: 'Set image quality to be seen',
                  //   trailing: Switch(value: false, onChanged: (value) {}),
                  // ),

                  /// logout button
                  // const SizedBox(height: Tsizes.spaceBtwSection),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.offAll(() => const LoginScreen()),
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

import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/device/device_utility.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    required this.text,
    required this.controller,
    required this.onSubmitted,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final TextEditingController controller;
  final VoidCallback onSubmitted;
  final IconData icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {}, // You can optionally handle onTap if needed
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(Tsizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(Tsizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: TColors.darkerkgrey,
              ),
              const SizedBox(
                width: Tsizes.spaceBtwItems,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: text,
                    border: InputBorder.none,
                  ),
                  onSubmitted: (_) {
                    onSubmitted();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

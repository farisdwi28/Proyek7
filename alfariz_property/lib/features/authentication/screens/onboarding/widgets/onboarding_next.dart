import 'package:alfariz_property/features/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/device/device_utility.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: Tsizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? Colors.black : TColors.primary),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}

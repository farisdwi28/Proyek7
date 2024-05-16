import 'package:alfariz_property/common/styles/spacing_styles.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidht() * 0.6,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              /// Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              // Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(TText.tContinue))),
            ],
          ),
        ),
      ),
    );
  }
}

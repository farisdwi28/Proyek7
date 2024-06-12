import 'package:alfariz_property/common/styles/rounded_container.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(Tsizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              Column(
                children: [
                  const TSectionHeading(
                      title: 'Facility', showActionButton: false),
                  const SizedBox(height: Tsizes.spaceBtwItems / 1.5),
                  Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.bed, size: Tsizes.iconmd),
                              const SizedBox(width: Tsizes.spaceBtwItems / 2),
                              Text('Bed',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(decoration: TextDecoration.none)),
                            ],
                          ),
                          const SizedBox(width: Tsizes.spaceBtwItems),
                          Row(
                            children: [
                              const Icon(Icons.bathtub, size: Tsizes.iconmd),
                              const SizedBox(width: Tsizes.spaceBtwItems / 2),
                              Text('Bath',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(decoration: TextDecoration.none)),
                            ],
                          ),
                          const SizedBox(width: Tsizes.spaceBtwItems),
                          Row(
                            children: [
                              const Icon(Icons.square_foot, size: Tsizes.iconmd),
                              const SizedBox(width: Tsizes.spaceBtwItems / 2),
                              Text('Surface Area',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(decoration: TextDecoration.none)),
                            ],
                          ),
                          const SizedBox(width: Tsizes.spaceBtwItems),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: Tsizes.spaceBtwItems),
              Column(
                children: [
                  const TSectionHeading(
                      title: 'Property Description', showActionButton: false),
                  const SizedBox(height: Tsizes.spaceBtwItems / 1.5),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(decoration: TextDecoration.none)),
                  const SizedBox(width: Tsizes.spaceBtwItems),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

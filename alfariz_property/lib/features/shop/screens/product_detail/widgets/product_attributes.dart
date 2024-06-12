import 'package:alfariz_property/common/styles/rounded_container.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  final String bed;
  final String bath;
  final String surfaceArea;
  final String description;

  const ProductAttributes({
    Key? key,
    required this.bed,
    required this.bath,
    required this.surfaceArea,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Facility
        TRoundedContainer(
          padding: const EdgeInsets.all(Tsizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(
                title: 'Facility',
                showActionButton: false,
              ),
              const SizedBox(height: Tsizes.spaceBtwItems / 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFacilityItem(
                    context,
                    icon: Icons.bed,
                    label: 'Bed',
                    value: bed,
                  ),
                  _buildFacilityItem(
                    context,
                    icon: Icons.bathtub,
                    label: 'Bath',
                    value: bath,
                  ),
                  _buildFacilityItem(
                    context,
                    icon: Icons.square_foot,
                    label: 'Surface Area',
                    value: surfaceArea,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: Tsizes.spaceBtwItems),

        /// Property Description
        TRoundedContainer(
          padding: const EdgeInsets.all(Tsizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(
                title: 'Property Description',
                showActionButton: false,
              ),
              const SizedBox(height: Tsizes.spaceBtwItems / 1.5),
              Text(
                description,
                style: theme.textTheme.bodyText2?.copyWith(
                  color: dark ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFacilityItem(BuildContext context, {required IconData icon, required String label, required String value}) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, size: Tsizes.iconmd, color: theme.primaryColor),
        const SizedBox(height: Tsizes.spaceBtwItems / 2),
        Text(
          value,
          style: theme.textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.caption?.copyWith(
            color: theme.textTheme.caption?.color?.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

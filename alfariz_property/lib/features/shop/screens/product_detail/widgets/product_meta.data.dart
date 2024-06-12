import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale price
        Row(
          children: [
            /// Price
            Text('Rumah Al-Fariz',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(decoration: TextDecoration.none)),
            const SizedBox(width: Tsizes.spaceBtwItems),
          ],
        ),
        const SizedBox(height: Tsizes.spaceBtwItems / 1.5),

        /// Title
        Row(
          children: [
            const Icon(Icons.location_on, size: Tsizes.iconmd),
            const SizedBox(width: Tsizes.spaceBtwItems / 2),
            Text('Bandung', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: Tsizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const Icon(Icons.person, size: Tsizes.iconmd),
            const SizedBox(width: Tsizes.spaceBtwItems / 2),
            Text('Joko Anwar', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: Tsizes.spaceBtwItems / 1.5),

        /// Brand
      ],
    );
  }
}

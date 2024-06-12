import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  final String nameProperty;
  final String owner;
  final String location;

  const TProductMetaData({
    Key? key,
    required this.nameProperty,
    required this.owner,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Property Name
        Text(
          nameProperty,
          style: theme.textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: Tsizes.spaceBtwItems),

        /// Location
        Row(
          children: [
            const Icon(Icons.location_on, size: Tsizes.iconmd, color: Colors.red),
            const SizedBox(width: Tsizes.spaceBtwItems / 2),
            Expanded(
              child: Text(
                location,
                style: theme.textTheme.subtitle1?.copyWith(
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: Tsizes.spaceBtwItems),

        /// Owner
        Row(
          children: [
            const Icon(Icons.person, size: Tsizes.iconmd, color: Colors.blue),
            const SizedBox(width: Tsizes.spaceBtwItems / 2),
            Expanded(
              child: Text(
                owner,
                style: theme.textTheme.subtitle1?.copyWith(
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: Tsizes.spaceBtwItems),
      ],
    );
  }
}

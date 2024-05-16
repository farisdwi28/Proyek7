import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: Tsizes.iconmd,
              height: Tsizes.iconmd,
              image: AssetImage(TImages.google),
            ),
          ),
        )
      ],
    );
  }
}
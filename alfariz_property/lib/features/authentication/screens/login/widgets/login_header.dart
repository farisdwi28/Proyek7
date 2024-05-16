import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 130,
          image: AssetImage(TImages.lightAppLogoNoBg),
        ),
        Text(TText.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: Tsizes.sm),
        Text(TText.loginSubtitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
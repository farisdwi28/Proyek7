

import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(height: Tsizes.spaceBtwInputFields),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: TText.iAgreeto,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: TText.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: TColors.primary,
                    )),
            TextSpan(
                text: TText.and,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: TText.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: TColors.primary,
                    )),
          ]),
        ),
      ],
    );
  }
}
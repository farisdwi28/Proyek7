import 'package:alfariz_property/features/authentication/screens/signup.widgets/terms_conditions_checkbox.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        // first & lastname
        Row(children: [
          Expanded(
            child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: TText.firstName, prefixIcon: Icon(Iconsax.user)),
            ),
          ),
        ]),
        const SizedBox(height: Tsizes.spaceBtwInputFields),

        /// username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TText.lastName, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: Tsizes.spaceBtwInputFields),

        /// Email
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TText.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: Tsizes.spaceBtwInputFields),

        /// Phone number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TText.call, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: Tsizes.spaceBtwInputFields),

        /// password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: TText.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: Tsizes.spaceBtwInputFields),

        /// terms & conditions Checkbox
        const TTermsAndConditionCheckbox(),
        const SizedBox(height: Tsizes.spaceBtwInputFields),

        /// Sign up Button
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text(TText.createAccount))),
      ]),
    );
  }
}



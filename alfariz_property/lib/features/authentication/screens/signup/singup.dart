import 'package:alfariz_property/common/widgets/login_signup/form_divider.dart';
import 'package:alfariz_property/common/widgets/login_signup/social_buttons.dart';
import 'package:alfariz_property/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  // title
                  Text(TText.signupTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: Tsizes.spaceBtwSection),

                  // Form
                  const TSignupForm(),
                  const SizedBox(height: Tsizes.spaceBtwInputFields),

                  /// Divider
                  TFormDivider(dividerText: TText.orSignInWith.capitalize!),
                  const SizedBox(height: Tsizes.spaceBtwInputFields),

                  /// Social Button
                  const TSocialButtons(),
                ],
              )),
        ));
  }
}

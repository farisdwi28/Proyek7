import 'package:alfariz_property/common/widgets/login_signup/form_divider.dart';
import 'package:alfariz_property/common/widgets/login_signup/social_buttons.dart';
import 'package:alfariz_property/features/authentication/screens/login/widgets/login_form.dart';
import 'package:alfariz_property/features/authentication/screens/login/widgets/login_header.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:alfariz_property/common/styles/spacing_styles.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title dan Sub-tittle
              const LoginHeader(),

              /// Form
              const LoginForm(),

              /// Divider (GOOGLE LOGIN)
              TFormDivider(dividerText: TText.orSignInWith.capitalize!),
              const SizedBox(height: Tsizes.spaceBtwSection),

              const TSocialButtons()
              // Footer
            ],
          ),
        ),
      ),
    );
  }
}

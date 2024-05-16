import 'package:alfariz_property/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:alfariz_property/features/authentication/screens/signup/singup.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Tsizes.spaceBtwSection),
        child: Column(children: [
          // email
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: TText.email),
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          // password
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: TText.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields / 2),

          // rememberme & forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(TText.rememberMe),
                ],
              ),
              // Forgot Password
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(TText.forgotPassword)),
            ],
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          // Sign In Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(TText.singIn))),
          const SizedBox(height: Tsizes.spaceBtwItems),
          // Create Account Button
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TText.createAccount))),
        ]),
      ));
  }
}

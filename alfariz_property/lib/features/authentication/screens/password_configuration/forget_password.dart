import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:alfariz_property/utils/services/auth_service.dart';
import 'package:alfariz_property/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool obscureText = true;

  void _resetPassword() async {
    final email = _emailController.text;
    final newPassword = _passwordController.text;
    await _authService.resetPassword(email, newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(TText.forgotPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: Tsizes.spaceBtwItems),
            Text(TText.forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: Tsizes.spaceBtwItems * 2),

            /// Email Text Field
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: TText.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
                  validator: TValidator.validateEmail,
            ),
            const SizedBox(height: Tsizes.spaceBtwItems * 2),

            /// New Password Text Field
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: TText.password,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
              obscureText: obscureText,
              validator: TValidator.validatePassword,
            ),
            const SizedBox(height: Tsizes.spaceBtwItems * 2),

            /// Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: _resetPassword,
                    child: const Text(TText.submit)))
          ],
        ),
      ),
    );
  }
}

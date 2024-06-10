import 'package:alfariz_property/features/authentication/screens/signup/succes_screen.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:alfariz_property/utils/services/auth_service.dart';
import 'package:alfariz_property/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TSignupFormState createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _acceptedTerms = false;
   bool obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _register() async {
    if (_formKey.currentState!.validate() && _acceptedTerms) {
      final userDetails = {
        'first_name': _firstNameController.text,
        'last_name': _lastNameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'password': _passwordController.text,
      };

      try {
        // Pertama, cek apakah email sudah ada
        final checkEmailResponse =
            await AuthService().checkEmail(userDetails['email']!);
        if (checkEmailResponse.containsKey('error') &&
            checkEmailResponse['error'] == 'Email is already in use') {
          Get.snackbar('Registration Failed',
              'Email is already in use. Please use a different email.',
              snackPosition: SnackPosition.TOP);
          return;
        }

        // Jika email belum ada, lanjutkan dengan pendaftaran
        await AuthService().registerUser(userDetails);
        Get.to(() => const SuccessScreen());
      } catch (e) {
        Get.snackbar(
            'Registration Failed', 'Unable to register. Please try again.',
            snackPosition: SnackPosition.TOP);
      }
    } else if (!_acceptedTerms) {
      Get.snackbar(
          'Terms & Conditions', 'You must accept the terms and conditions.',
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: TText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: TText.lastName,
                    prefixIcon: Icon(Iconsax.user_edit),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            validator: TValidator.validateEmail,
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: TText.call,
              prefixIcon: Icon(Iconsax.call),
            ),
            validator: TValidator.validatePhoneNumber,
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
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
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          Row(
            children: [
              Checkbox(
                value: _acceptedTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptedTerms = value!;
                  });
                },
              ),
              const Text('I accept the terms and conditions'),
            ],
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
            ),
          )
        ],
      ),
    );
  }
}

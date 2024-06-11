import 'package:alfariz_property/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:alfariz_property/features/authentication/screens/signup/singup.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:alfariz_property/utils/services/auth_service.dart';
import 'package:alfariz_property/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() =>
      _LoginFormState(); // _LoginFormState tidak boleh private
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;
  bool obscureText = true;

  final AuthService _authService = AuthService();

  void _toggleRememberMe(bool? newValue) {
    if (newValue != null) {
      setState(() {
        _rememberMe = newValue;
      });
    }
  }

  // ignore: unused_element
  void _togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final data = {
        'email': _emailController.text,
        'password': _passwordController.text,
      };
      try {
        await _authService.loginUser(data);
        // Save remember me preference if checked
        if (_rememberMe) {
          await TLocalStorage().saveData<bool>('remember_me', _rememberMe);
        }
      } catch (error) {
        // Show error message if login fails
        _showErrorSnackbar('Invalid email or password');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Tsizes.spaceBtwSection),
        child: Column(children: [
          // email
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TText.email,
            ),
            validator: TValidator.validateEmail,
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          // password
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields / 2),

          // rememberme & forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: _toggleRememberMe,
                  ),
                  const Text(TText.rememberMe),
                ],
              ),
              // Forgot Password
              TextButton(
                onPressed: () => Get.to(() => const ForgetPassword()),
                child: const Text(TText.forgotPassword),
              ),
            ],
          ),
          const SizedBox(height: Tsizes.spaceBtwInputFields),
          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(TText.singIn),
            ),
          ),
          const SizedBox(height: Tsizes.spaceBtwItems),
          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              child: const Text(TText.createAccount),
            ),
          ),
        ]),
      ),
    );
  }
}

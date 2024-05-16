import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:alfariz_property/common/styles/spacing_styles.dart';
import 'package:iconsax/iconsax.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    height: 150,
                    image: AssetImage(TImages.lightAppLogoNoBg),
                  ),
                  Text(TText.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: Tsizes.sm),
                  Text(TText.loginSubtitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

              /// Form
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Tsizes.spaceBtwSection),
                child: Column(children: [
                  // email
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: TText.email),
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
                          onPressed: () {},
                          child: const Text(TText.forgotPassword)),
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
                          onPressed: () {},
                          child: const Text(TText.createAccount))),
                ]),
              )),

              /// Divider (GOOGLE LOGIN)
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Divider(
              //       color: dark ? TColors.darkGrey : TColors.grey,
              //       thickness: 0.5,
              //       indent: 50,
              //       endIndent: 5,
              //     )
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Flexible(
              //         child: Divider(
              //             color: dark ? TColors.darkGrey : TColors.grey,
              //             thickness: 0.5,
              //             indent: 60,
              //             endIndent: 5)),
              //     Text(TText.orSignInWith.capitalize!,
              //         style: Theme.of(context).textTheme.labelMedium),
              //     Flexible(
              //         child: Divider(
              //             color: dark ? TColors.darkGrey : TColors.grey,
              //             thickness: 0.5,
              //             indent: 5,
              //             endIndent: 60)),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //           border: Border.all(color: TColors.grey),
              //           borderRadius: BorderRadius.circular(100)),
              //       child: IconButton(
              //         onPressed: () {},
              //         icon: const Image(
              //           width: Tsizes.iconmd,
              //           height: Tsizes.iconmd,
              //           image: AssetImage(TImages.google),
              //         ),
              //       ),
              //     )
              //   ],
              // )
              // Footer
            ],
          ),
        ),
      ),
    );
  }
}

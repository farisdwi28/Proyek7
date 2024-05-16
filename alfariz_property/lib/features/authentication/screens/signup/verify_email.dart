import 'package:alfariz_property/common/widgets/success_screen/success_screen.dart';
import 'package:alfariz_property/features/authentication/screens/login/login.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(TImages.verifyEmail),
                width: THelperFunctions.screenWidht() * 0.6,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              /// Title & Subtitle
              Text(
                TText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              Text(
                'dummy@dummy.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              Text(
                TText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                          image: TImages.verifyEmailSuccess,
                          title: TText.yourAccountCreatedTitle,
                          subtitle: TText.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        )),
                    child: const Text(TText.tContinue)),
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text(TText.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}

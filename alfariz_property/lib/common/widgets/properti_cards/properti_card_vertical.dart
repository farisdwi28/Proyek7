import 'package:alfariz_property/common/styles/rounded_container.dart';
import 'package:alfariz_property/common/styles/shadow.dart';
import 'package:alfariz_property/common/widgets/images/t_rounded_image.dart';
import 'package:alfariz_property/common/widgets/texts/properti_price_text.dart';
import 'package:alfariz_property/common/widgets/texts/properti_title_text.dart';
import 'package:alfariz_property/features/shop/screens/product_detail/product_detail.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:typed_data';

class TPropertyCardVertical extends StatelessWidget {
  final String nameProperty;
  final String owner;
  final String price;
  final String imageUrl;

  const TPropertyCardVertical({
    super.key,
    required this.nameProperty,
    required this.owner,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    Uint8List? _decodeBase64Image(String base64String) {
      try {
        return base64Decode(base64String);
      } catch (e) {
        return null;
      }
    }

    final imageBytes = _decodeBase64Image(imageUrl);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(Tsizes.productImageRadius),
          color: dark ? TColors.darkerkgrey : TColors.light,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(Tsizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  imageBytes != null
                      ? Image.memory(
                          imageBytes,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : const TRoundedImage(
                          imageUrl: TImages.notFound,
                          applyImageRadius: true,
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Tsizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TPropertyTitleText(
                    title: nameProperty,
                    smallSize: false,
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        owner,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: Tsizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: Tsizes.iconXs,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TPropertyPriceText(
                        price: price,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

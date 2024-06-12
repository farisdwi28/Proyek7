import 'package:alfariz_property/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:alfariz_property/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:alfariz_property/features/shop/screens/product_detail/widgets/product_meta.data.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Pastikan Anda menambahkan paket ini di pubspec.yaml

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 -- Product image slider
            const TProductImageSlider(),

            /// 2 -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: Tsizes.defaultSpace,
                  left: Tsizes.defaultSpace,
                  bottom: Tsizes.defaultSpace),
              child: Column(
                children: [
                  const TProductMetaData(),
                  const ProductAttributes(),

                  /// Button WhatsApp untuk chat ke pemilik
                  const SizedBox(height: Tsizes.defaultSpace),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Tambahkan logika untuk membuka WhatsApp chat
                    },
                    icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
                    label: const Text('Chat Pemilik'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace, vertical: Tsizes.sm),
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

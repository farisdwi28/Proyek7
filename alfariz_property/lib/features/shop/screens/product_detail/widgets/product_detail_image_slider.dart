import 'package:alfariz_property/common/widgets/appbar/appbar.dart';
import 'package:alfariz_property/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:alfariz_property/common/widgets/images/t_rounded_image.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(Tsizes.productImageRadius * 2.5),
                child:
                    Center(child: Image(image: AssetImage(TImages.property1))),
              ),
            ),

            /// image slider
            Positioned(
              bottom: 30,
              left: Tsizes.defaultSpace,
              right: Tsizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: Tsizes.spaceBtwItems),
                  itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(Tsizes.sm),
                    imageUrl: TImages.property1,
                  ),
                ),
              ),
            ),

            /// Appbar Icons
            const TAppBar(
              showBackArrow: true,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:alfariz_property/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:alfariz_property/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:alfariz_property/common/widgets/layouts/grid_layout.dart';
import 'package:alfariz_property/common/widgets/properti_cards/properti_card_vertical.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_categories.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// App bar
                THomeAppBar(),
                SizedBox(height: Tsizes.defaultSpace),

                // SearchBar
                TSearchContainer(
                  text: 'Search in here',
                ),
                SizedBox(height: Tsizes.defaultSpace),

                /// Categories
                Padding(
                  padding: EdgeInsets.only(left: Tsizes.defaultSpace),
                  child: Column(
                    children: [
                      /// heading
                      TSectionHeading(
                        title: 'List Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: Tsizes.spaceBtwItems),

                      /// catagories
                      THomeScategories()
                    ],
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  TGridLayout(itemCount: 10, itemBuilder: (_, index) => const TPropertyCardVertical())                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

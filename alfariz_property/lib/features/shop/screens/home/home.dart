import 'package:alfariz_property/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:alfariz_property/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_categories.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
              THomeAppBar(),
              SizedBox(height: Tsizes.defaultSpace),
              TSearchContainer(
                  text: 'Search in here',
                ),
              SizedBox(height: Tsizes.defaultSpace),
                Padding(
                  padding: EdgeInsets.only(left: Tsizes.defaultSpace),
                  child: Column(
                    children: [
                    TSectionHeading(
                        title: 'List Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                    SizedBox(height: Tsizes.spaceBtwItems),
                      THomeScategories()
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}





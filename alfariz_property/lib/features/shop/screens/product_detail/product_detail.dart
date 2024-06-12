import 'package:alfariz_property/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:alfariz_property/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:alfariz_property/features/shop/screens/product_detail/widgets/product_meta.data.dart';
import 'package:alfariz_property/utils/services/property_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  final PropertyService _propertyService = PropertyService();
  final String propertyId;

  ProductDetailScreen({Key? key, required this.propertyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Property Details'),
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _propertyService.fetchPropertyById(propertyId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Property not found'));
          }

          final propertyData = snapshot.data!;
          if (propertyData.isEmpty) {
            return Center(child: Text('No property data available'));
          }

          final String nameProperty = propertyData['name_property'] ?? 'N/A';
          final String owner = propertyData['owner'] ?? 'N/A';
          final String location = propertyData['location'] ?? 'N/A';
          final String bed = propertyData['bed']?.toString() ?? 'N/A';
          final String bath = propertyData['bath']?.toString() ?? 'N/A';
          final String surfaceArea = propertyData['surface_area']?.toString() ?? 'N/A';
          final String description = propertyData['description'] ?? 'N/A';

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 1 -- Product image slider
                  TProductImageSlider(propertyId: propertyId),

                  /// 2 -- Product Details
                  const SizedBox(height: Tsizes.defaultSpace),
                  TProductMetaData(
                    nameProperty: nameProperty,
                    owner: owner,
                    location: location,
                  ),

                  /// 3 -- Property Attributes
                  const SizedBox(height: Tsizes.defaultSpace),
                  ProductAttributes(
                    bed: bed,
                    bath: bath,
                    surfaceArea: surfaceArea,
                    description: description,
                  ),

                  /// 4 -- Button WhatsApp untuk chat ke pemilik
                  const SizedBox(height: Tsizes.defaultSpace),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Tambahkan logika untuk membuka WhatsApp chat
                      },
                      icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
                      label: const Text('Chat Pemilik'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace, vertical: Tsizes.sm),
                        textStyle: theme.textTheme.headline6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

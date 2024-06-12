import 'package:alfariz_property/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:alfariz_property/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:alfariz_property/common/widgets/layouts/grid_layout.dart';
import 'package:alfariz_property/common/widgets/properti_cards/properti_card_vertical.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_categories.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/services/property_auth.dart';
import 'package:flutter/material.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart'; // Import TImages

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PropertyService _propertyService = PropertyService();
  List<Map<String, dynamic>> _properties = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProperties();
  }

  Future<void> _fetchProperties() async {
    try {
      final properties = await _propertyService.fetchProperties();
      setState(() {
        _properties = properties;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching properties: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const TPrimaryHeaderContainer(
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Tsizes.defaultSpace),
                        child: TGridLayout(
                          itemCount: _properties.length,
                          itemBuilder: (_, index) {
                            final property = _properties[index];
                            final imageUrl = property['property_medias'].isNotEmpty
                                ? property['property_medias'][0]['media']
                                : TImages.notFound; // Default image if no media available
                            return TPropertyCardVertical(
                              nameProperty: property['name_property'],
                              owner: property['owner'],
                              price: property['price'].toString(),
                              imageUrl: imageUrl,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

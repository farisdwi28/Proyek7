import 'package:flutter/material.dart';
import 'package:alfariz_property/utils/services/property_auth.dart';
import 'package:alfariz_property/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:alfariz_property/common/widgets/layouts/grid_layout.dart';
import 'package:alfariz_property/common/widgets/properti_cards/properti_card_vertical.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:alfariz_property/features/shop/screens/home/widgets/home_categories.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PropertyService _propertyService = PropertyService();
  List<Map<String, dynamic>> _properties = [];
  List<Map<String, dynamic>> _filteredProperties = [];
  bool _isLoading = true;
  String? _errorMessage;
  TextEditingController _searchController = TextEditingController();

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
        _filteredProperties =
            properties; // Initialize filtered properties with all properties
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching properties: $e';
        _isLoading = false;
      });
    }
  }

  void _filterProperties(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredProperties = _properties; // Reset to show all properties
      } else {
        _filteredProperties = _properties
            .where((property) => property['name_property']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
      }
    });
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
                      TPrimaryHeaderContainer(
                        child: Column(
                          children: [
                            THomeAppBar(),
                            SizedBox(height: Tsizes.defaultSpace),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Tsizes.defaultSpace),
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Search in here',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white), // border color
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white), // border color
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  suffixIcon: _searchController.text.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(Icons.clear,
                                              color: Colors.white),
                                          onPressed: () {
                                            _searchController.clear();
                                            _filterProperties('');
                                          },
                                        )
                                      : null,
                                  floatingLabelBehavior: FloatingLabelBehavior
                                      .never, // Hide the hint label when focused
                                ),
                                style: TextStyle(
                                    color: Colors.white), // text color
                                onChanged: (value) {
                                  _filterProperties(value);
                                },
                              ),
                            ),
                            SizedBox(height: Tsizes.defaultSpace),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: Tsizes.defaultSpace),
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
                          itemCount: _filteredProperties.length,
                          itemBuilder: (_, index) {
                            final property = _filteredProperties[index];
                            final imageUrl = property['property_medias']
                                    .isNotEmpty
                                ? property['property_medias'][0]['media']
                                : TImages
                                    .notFound; // Default image if no media available
                            return TPropertyCardVertical(
                              propertyId: property['id'].toString(),
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

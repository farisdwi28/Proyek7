import 'package:alfariz_property/utils/services/property_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class TProductImageSlider extends StatefulWidget {
  final String propertyId;

  const TProductImageSlider({super.key, required this.propertyId});

  @override
  _TProductImageSliderState createState() => _TProductImageSliderState();
}

class _TProductImageSliderState extends State<TProductImageSlider> {
  int _selectedIndex = 0;
  List<String> _images = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchPropertyImages();
  }

  Future<void> _fetchPropertyImages() async {
    try {
      final propertyService = PropertyService();
      final propertyData = await propertyService.fetchPropertyById(widget.propertyId);
      if (propertyData != null && propertyData.containsKey('property_medias')) {
        setState(() {
          _images = List<String>.from(
            propertyData['property_medias'].map((media) => media['media'] as String),
          );
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'No images found';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching images: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_errorMessage != null)
            Center(child: Text(_errorMessage!))
          else if (_images.isNotEmpty) ...[
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: _buildImage(_images[_selectedIndex]),
                ),
              ),
            ),
          ] else ...[
            /// Default Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/property/no-image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],

          /// Image Slider
          if (_images.isNotEmpty)
            Positioned(
              bottom: 30,
              left: 16,
              right: 16,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: _images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _selectedIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ),
                      child: _buildImage(_images[index], width: 80, height: 80),
                    ),
                  ),
                ),
              ),
            ),

          /// Image Indicator
          if (_images.isNotEmpty)
            Positioned(
              top: 30,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${_selectedIndex + 1}/${_images.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImage(String base64Image, {double? width, double? height}) {
    try {
      final decodedBytes = base64Decode(base64Image);
      return Image.memory(
        decodedBytes,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print('Error decoding image: $error');
          return Image.asset(
            'assets/images/not_found.png',
            fit: BoxFit.cover,
            width: width,
            height: height,
          );
        },
      );
    } catch (e) {
      print('Error decoding image: $e');
      return Image.asset(
        'assets/images/not_found.png',
        fit: BoxFit.cover,
        width: width,
        height: height,
      );
    }
  }
}

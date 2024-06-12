import 'package:alfariz_property/utils/constants/api_constants.dart';
import 'package:alfariz_property/utils/http/http_client.dart';

class PropertyService {
  Future<List<Map<String, dynamic>>> fetchProperties() async {
    try {
      final response = await THttpHelper.get(APIConstants.getAllProperty);

      if (response is List) {
        // Ensure that all items are of type Map<String, dynamic>
        return response.cast<Map<String, dynamic>>();
      } else if (response.containsKey('data') && response['data'] is List) {
        // Ensure that 'data' is a List of Maps
        return List<Map<String, dynamic>>.from(response['data']);
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> fetchPropertyById(String id) async {
    try {
      final response = await THttpHelper.get('${APIConstants.getPropertyById}/$id');

      // Debug print to inspect the response structure
      print('API response: $response');

      if (response is List && response.isNotEmpty) {
        final propertyData = response.first; // Assuming the first element contains the required data

        if (propertyData is Map<String, dynamic>) {
          return propertyData;
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

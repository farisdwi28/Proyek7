import 'package:alfariz_property/navigation_menu.dart';
import 'package:alfariz_property/utils/constants/api_constants.dart';
import 'package:alfariz_property/utils/http/http_client.dart';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class AuthService {
  // Future<void> loginUser(Map<String, dynamic> credentials) async {
  //   try {
  //     final response = await THttpHelper.post(
  //         APIConstants.loginEndpoint, credentials,
  //         includeToken: false);
  //     print(
  //         'Login Response: $response'); // Tambahkan log untuk melihat response
  //     if (response.containsKey('token')) {
  //       await TLocalStorage().saveData('token', response['token']);
  //       Get.to(() => const NavigationMenu());
  //     } else {
  //       // Handle login failure
  //       Get.snackbar('Login Failed', 'Invalid credentials. Please try again.',
  //           snackPosition: SnackPosition.TOP);
  //     }
  //   } catch (e) {
  //     print('Login Error: $e'); // Tambahkan log untuk melihat error
  //     // Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.TOP);
  //   }
  // }

  Future<void> loginUser(Map<String, dynamic> credentials) async {
    try {
      final response = await THttpHelper.post(APIConstants.loginEndpoint, credentials, includeToken: false);
      print('Login Response: $response'); // Tambahkan log untuk melihat response
      if (response.containsKey('token')) {
        await TLocalStorage().saveData('token', response['token']);
        Get.to(() => const NavigationMenu());
      } else {
        // Handle login failure
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      print('Login Error: $e'); // Tambahkan log untuk melihat error
      throw Exception('Login failed');
    }
  }

  Future<Map<String, dynamic>> fetchUserData(String token) async {
    final response = await THttpHelper.get(APIConstants.getUserDataEndpoint,
        includeToken: true);

    if (response.containsKey('first_name') &&
        response.containsKey('last_name') &&
        response.containsKey('email')) {
      return response;
    } else if (response.containsKey('error')) {
      throw Exception('Failed to load user data: ${response['error']}');
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<Map<String, dynamic>> checkEmail(String email) async {
    try {
      final response = await THttpHelper.post(
          APIConstants.registerEndpoint, {'email': email, 'action': 'check'},
          includeToken: false);
      print(
          'Check Email Response: $response'); // Tambahkan log untuk melihat response
      return response;
    } catch (e) {
      print('Check Email Error: $e'); // Tambahkan log untuk melihat error
      return {'error': 'An error occurred: $e'};
    }
  }

  Future<void> registerUser(Map<String, dynamic> userDetails) async {
    try {
      print(
          'Register User Details: $userDetails'); // Tambahkan log untuk melihat data yang dikirim
      final response = await THttpHelper.post(
          APIConstants.registerEndpoint, userDetails,
          includeToken: false);
      print(
          'Register Response: $response'); // Tambahkan log untuk melihat response
      if (response.containsKey('token')) {
        await TLocalStorage().saveData('token', response['token']);
      } else if (response.containsKey('error')) {
        // Handle specific registration error
        Get.snackbar('Registration Failed', response['error'],
            snackPosition: SnackPosition.TOP);
      } else {
        // Handle general registration failure
        Get.snackbar(
            'Registration Failed', 'Unable to register. Please try again.',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      print('Register Error: $e'); // Tambahkan log untuk melihat error
      // Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.TOP);
    }
  }
}

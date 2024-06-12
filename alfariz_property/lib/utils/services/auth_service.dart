import 'dart:convert';
import 'dart:io';
import 'package:alfariz_property/navigation_menu.dart';
import 'package:alfariz_property/utils/constants/api_constants.dart';
import 'package:alfariz_property/utils/http/http_client.dart';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> loginUser(Map<String, dynamic> credentials) async {
    try {
      final response = await THttpHelper.post(
          APIConstants.loginEndpoint, credentials,
          includeToken: false);
      print(
          'Login Response: $response'); // Tambahkan log untuk melihat response
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

  Future<void> editProfile(Map<String, dynamic> userDetails) async {
    try {
      print('Sending request to ${APIConstants.updateUser}');
      print('User details: $userDetails');
      final response = await THttpHelper.put(
          APIConstants.updateUser, userDetails,
          includeToken: true);
      print('Edit Profile Response: $response');
      if (response.containsKey('message')) {
        Get.snackbar('Success', response['message'],
            snackPosition: SnackPosition.TOP);
      } else if (response.containsKey('error')) {
        Get.snackbar('Edit Profile Failed', response['error'],
            snackPosition: SnackPosition.TOP);
      } else {
        Get.snackbar(
            'Edit Profile Failed', 'Unable to edit profile. Please try again.',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      print('Edit Profile Error: $e');
      Get.snackbar('Error', 'An error occurred: $e',
          snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> uploadPhoto(File imageFile) async {
    try {
      final token = TLocalStorage().readData<String>('token');
      final request = http.MultipartRequest('POST', Uri.parse(APIConstants.uploadPhoto));
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath('photo', imageFile.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final data = jsonDecode(responseData);
        print('Photo uploaded successfully: $data');
      } else {
        print('Failed to upload photo: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading photo: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      final token = await TLocalStorage().readData<String>('token');
      final response = await http.delete(
        Uri.parse('${APIConstants.deleteUser}/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('User deleted successfully: $responseData');
      } else {
        print('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}

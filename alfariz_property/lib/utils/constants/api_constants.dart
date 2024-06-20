class APIConstants {
  static const String baseUrl = 'http://192.168.1.13:3000';
  static const String loginEndpoint = '$baseUrl/users/login';
  static const String registerEndpoint = '$baseUrl/users/register';
  static const String getUserDataEndpoint = '$baseUrl/users/getInfo';
  static const String updateUser = '$baseUrl/users/editProfile';
  static const String uploadPhoto = '$baseUrl/photos/photo';
  static const String deleteUser = '$baseUrl/users';
  static const String forgotPassword= '$baseUrl/users/resetPassword';
  /// Property
  static const String getAllProperty = '$baseUrl/property';
  static const String getPropertyById= '$baseUrl/property';
}

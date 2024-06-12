import 'dart:convert';
import 'dart:io';
import 'package:alfariz_property/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:alfariz_property/common/widgets/appbar/appbar.dart';
import 'package:alfariz_property/common/widgets/images/t_circular_images.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  Map<String, dynamic> _userData = {};
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final token = await TLocalStorage().readData<String>('token');
      if (token != null) {
        final userData = await _authService.fetchUserData(token);
        setState(() {
          _userData = userData;
        });
      } else {
        print('No token found');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload the image to the server
      await _authService.uploadPhoto(File(pickedFile.path));
      _fetchUserData(); // Refresh user data after uploading photo
    }
  }

  void _editProfile(String field, String value) async {
    try {
      final updatedData = {..._userData, field: value};
      await _authService.editProfile(updatedData);
      _fetchUserData(); // Refresh user data after editing profile
    } catch (e) {
      print('Error editing profile: $e');
    }
  }

  void _showEditDialog(String field, String currentValue) {
    TextEditingController _controller =
        TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter new $field'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _editProfile(field, _controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount() async {
    try {
      final userId = _userData['id']?.toString() ?? '';
      if (userId.isNotEmpty) {
        await _authService.deleteUser(userId);
        // Handle post-deletion logic, such as logging out the user
        Get.offAll(() => const LoginScreen());
      } else {
        print('User ID is null or empty');
      }
    } catch (e) {
      print('Error deleting account: $e');
    }
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteAccount();
                Navigator.of(context).pop();
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatarBase64 = _userData['avatar'] ?? '';

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    avatarBase64.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage:
                                MemoryImage(base64Decode(avatarBase64)),
                            radius: 24,
                          )
                        : const TCircularImage(
                            image: TImages.user, width: 80, height: 80),
                    TextButton(
                      onPressed: _pickImage,
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Tsizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: Tsizes.spaceBtwItems),
              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: Tsizes.spaceBtwItems),
              TProfileMenu(
                title: 'First Name',
                value: _userData['first_name'] ?? '',
                onPressed: () => _showEditDialog(
                    'first_name', _userData['first_name'] ?? ''),
              ),
              TProfileMenu(
                title: 'Last Name',
                value: _userData['last_name'] ?? '',
                onPressed: () =>
                    _showEditDialog('last_name', _userData['last_name'] ?? ''),
              ),
              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: Tsizes.spaceBtwItems),
              TProfileMenu(
                title: 'E-mail',
                value: _userData['email'] ?? '',
                onPressed: () => ()),
              TProfileMenu(
                title: 'Phone Number',
                value: _userData['phone'] ?? '',
                onPressed: () =>
                    _showEditDialog('phone', _userData['phone'] ?? ''),
              ),
              const Divider(),
              const SizedBox(height: Tsizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: _showDeleteDialog,
                  child: const Text('Delete Account',
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:alfariz_property/common/widgets/images/t_circular_images.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:alfariz_property/utils/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:alfariz_property/utils/services/auth_service.dart';

class TUserProfileTile extends StatefulWidget {
  const TUserProfileTile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TUserProfileTileState createState() => _TUserProfileTileState();
}

class _TUserProfileTileState extends State<TUserProfileTile> {
  late Future<Map<String, dynamic>> userData;

  @override
  void initState() {
    super.initState();
    final token = TLocalStorage().readData<String>('token') ?? '';
    userData = AuthService().fetchUserData(token);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No user data found');
        } else {
          final data = snapshot.data!;
          final firstName = data['first_name'] ?? 'First Name';
          final lastName = data['last_name'] ?? 'Last Name';
          final email = data['email'] ?? 'email@example.com';

          return ListTile(
            leading: const TCircularImage(image: TImages.user),
            title: Text('$firstName $lastName',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.light)),
            subtitle: Text(email,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: TColors.light)),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.edit, color: TColors.light)),
          );
        }
      },
    );
  }
}

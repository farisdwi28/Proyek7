import 'package:alfariz_property/common/widgets/images/t_circular_images.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
          image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text('John Doe',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.light)),
      subtitle: Text('johndoe@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.light)),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.edit, color: TColors.light)),
    );
  }
}

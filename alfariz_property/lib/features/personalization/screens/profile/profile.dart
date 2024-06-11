import 'package:alfariz_property/common/widgets/appbar/appbar.dart';
import 'package:alfariz_property/common/widgets/images/t_circular_images.dart';
import 'package:alfariz_property/common/widgets/texts/section_heading.dart';
import 'package:alfariz_property/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:alfariz_property/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';



class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: const TAppBar(
      showBackArrow: true,
      title: Text('Profile')
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
              const TCircularImage(image: TImages.user, width: 80, height: 80),
              TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
          
            ],
            ),
        ),
        const SizedBox(height: Tsizes.spaceBtwItems / 2),
        const Divider(),
        const SizedBox(height: Tsizes.spaceBtwItems),


        const TSectionHeading(title: 'Profile Information', showActionButton: false),
        const SizedBox(height: Tsizes.spaceBtwItems),


      TProfileMenu(title: 'Name', value: 'Coding With T', onPressed: () {}),
      TProfileMenu(title: 'username', value: 'Coding With T', onPressed: () {}),


      const TSectionHeading(title: 'Personal Information', showActionButton: false),
      const SizedBox(height: Tsizes.spaceBtwItems),

      TProfileMenu(title: 'E-mail', value: 'farisdwiramadhan28@gmail.com', onPressed: () {}),
      TProfileMenu(title: 'Address', value: 'Jl. aselole mana aja gg.gung, no.76', onPressed: () {}),
      TProfileMenu(title: 'Phone Number', value: '081234567890', onPressed: () {}),
      const Divider(),
      const SizedBox(height: Tsizes.spaceBtwItems),

      Center(
        child: TextButton(
          onPressed:() {} ,
          child: const Text('delete account', style: TextStyle(color: Colors.red)),
        ),
      )

      
          ],
        ),
          ),
    )
    );
  }
}
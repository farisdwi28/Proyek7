import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TNotificationIcon extends StatelessWidget {
  const TNotificationIcon({
    super.key, required this.onPressed,required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.notification,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.light , fontSizeFactor: 0.8)),
          ),
        )
        )
      ],
    );
  }
}

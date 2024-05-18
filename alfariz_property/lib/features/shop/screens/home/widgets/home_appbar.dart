import 'package:alfariz_property/common/widgets/appbar/appbar.dart';
import 'package:alfariz_property/common/widgets/chat.notification/chat_notification_icon.dart';
import 'package:alfariz_property/utils/constants/colors.dart';
import 'package:alfariz_property/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TText.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Text(TText.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.light)),
        ],
      ),
      actions: [
        TNotificationIcon(onPressed: () {  }, iconColor: TColors.light,)
      ],
    );
  }
}
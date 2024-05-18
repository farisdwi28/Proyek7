import 'package:alfariz_property/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:alfariz_property/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class THomeScategories extends StatelessWidget {
  const THomeScategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(image: TImages.land, title: 'Land', onTap: () {  },);
        },
      ),
    );
  }
}
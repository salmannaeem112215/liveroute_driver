import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/custom_menu_controller.dart';
import '../../../responsive.dart';
import '../../../configs/themes/ui_parameters.dart';
import './rotue_tile.dart';
import './custom_title.dart';

class RouteSection extends StatelessWidget {
  const RouteSection({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // routes
        CustomTitle(
          title: 'Routes',
          height: Responsive.screenWidth(context) - 2 * defaultPadding,
          seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
              MenuItems.route,
        ),

        kHalfHeightpace,
        SizedBox(
          height: height,
          child: ListView.separated(
            itemBuilder: (ctx, index) => RouteTile(
              type: 'M',
              name: '5',
              driver: 'Rana',
              bus: 'LEK-007',
              onTap: () async {},
              color: Colors.pink,
            ),
            separatorBuilder: (ctx, index) => kHeightSpace,
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}

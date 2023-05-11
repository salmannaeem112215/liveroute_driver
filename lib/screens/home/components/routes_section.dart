import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/custom_menu_controller.dart';
import '../../../responsive.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../services/route_services.dart';
import '../../../services/services.dart';
import '../../../widgets/future_list.dart';
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

        SizedBox(
          height: height,
          child: FutureList(
            getValues: RouteServices.getRoutes(),
            seprateBuilder: (ctx, index) => kHalfHeightpace,
            listTile: (route) => RouteTile(
              type: route['type'],
              name: route['name'],
              bus: route['bus'],
              driver: route['driver'],
              onTap: () async {
                if (kDebugMode) {
                  print(route);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

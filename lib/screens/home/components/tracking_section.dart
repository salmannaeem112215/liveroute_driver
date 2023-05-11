import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/custom_menu_controller.dart';
import '../../../responsive.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../services/message_data.dart';
import '../../../services/services.dart';
import '../../../services/tracking_services.dart';
import '../../../widgets/future_list.dart';
import './rotue_tile.dart';
import './custom_title.dart';

class TrackingSection extends StatelessWidget {
  const TrackingSection({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>>? res = Services.getRoutes();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          title: 'Trackings',
          height: Responsive.screenWidth(context) - 2 * defaultPadding,
          seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
              MenuItems.tracking,
        ),
        SizedBox(
          height: height,
          child: FutureList(
            getValues: TrackingServices.getTrackings(u1.userId),
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

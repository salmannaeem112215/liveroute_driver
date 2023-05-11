import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../screens/home/components/rotue_tile.dart';
import '../../../widgets/header.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../controllers/custom_menu_controller.dart';
import '../../../models/message/chat_collection.dart';
import '../../../services/message_data.dart';
import '../../../services/message_services.dart';
import '../../../services/route_services.dart';
import '../../../services/tracking_services.dart';
import '../../../widgets/future_list.dart';
import './chat_circle_tile.dart';
import './custom_title.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = u1.userId;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(title: 'Home'),

        // Tracking
        Padding(
          padding: kHaldHorizontalPadding,
          child: CustomTitle(
            title: 'Message',
            seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
                MenuItems.message,
          ),
        ),
        SizedBox(
          height: 60,
          child: Padding(
            padding: kHaldHorizontalPadding,
            child: FutureList(
              scrollDirection: Axis.horizontal,
              listTile: (chat) =>
                  ChatCircleTile(image: ChatCollection.getImage(chat, userId)),
              seprateBuilder: (ctx, index) => kHalfWidthSpace,
              getValues: MessageServices.getUserChats(userId),
            ),
          ),
        ),
        kHalfHeightpace,

        Padding(
          padding: kHaldHorizontalPadding,
          child: CustomTitle(
            title: 'Trackings',
            seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
                MenuItems.tracking,
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: kHaldHorizontalPadding,
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
        ),
        kHalfHeightpace,

        // Routes
        Padding(
          padding: kHaldHorizontalPadding,
          child: CustomTitle(
            title: 'Routes',
            seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
                MenuItems.route,
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: kHaldHorizontalPadding,
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
        ),
        kHeightSpace,
      ],
    );
  }
}

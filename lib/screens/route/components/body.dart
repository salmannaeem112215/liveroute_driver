import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../configs/themes/ui_parameters.dart';
import '../../../services/route_services.dart';
import '../../../widgets/future_list.dart';
import '../../../widgets/header.dart';
import '../../home/components/rotue_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Header(title: 'Routes'),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
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
      ],
    );
  }
}

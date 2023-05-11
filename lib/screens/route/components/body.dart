import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../configs/themes/ui_parameters.dart';
import '../../../responsive.dart';
import '../../../services/route_services.dart';
import '../../../widgets/future_list.dart';
import '../../home/components/rotue_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final avaliableHeight = Responsive.avaliableHeight(context);

    return SizedBox(
      height: avaliableHeight < 100 ? 100 : avaliableHeight,
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
    );
  }
}

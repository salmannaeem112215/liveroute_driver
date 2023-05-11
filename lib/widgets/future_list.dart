import 'package:flutter/material.dart';

import '../configs/themes/app_color.dart';

class FutureList extends StatelessWidget {
  const FutureList({
    super.key,
    required this.listTile,
    required this.getValues,
    this.scrollDirection = Axis.vertical,
    this.seprateBuilder,
  });

  final Widget Function(Map<String, dynamic>) listTile;
  final Widget Function(BuildContext ctx, int index)? seprateBuilder;
  final Future<List<Map<String, dynamic>>> getValues;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getValues,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: logoBlack,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final routes = snapshot.data!;
          final controller = ScrollController();
          return Scrollbar(
            controller: controller,
            child: ListView.separated(
              controller: controller,
              separatorBuilder: seprateBuilder != null
                  ? seprateBuilder!
                  : (ctx, index) => const SizedBox(),
              scrollDirection: scrollDirection,
              itemCount: routes.length,
              itemBuilder: (context, index) => listTile(
                routes[index],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('No data found'),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liveroute_driver/configs/themes/ui_parameters.dart';

import '../../../controllers/custom_menu_controller.dart';
import '../../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    this.color = Colors.black,
  });
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<CustomMenuController>();
    return SizedBox(
      height: 50,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                onPressed: menuController.controlMenu,
                icon: Icon(
                  Icons.menu,
                  color: color,
                ),
              ),
            if (Responsive.isDesktop(context)) kHalfWidthSpace,
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),

            // const Expanded(child: SearchFeild())
          ],
        ),
      ),
    );
  }
}

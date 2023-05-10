import 'package:flutter/material.dart';
import 'package:liveroute_driver/configs/themes/ui_parameters.dart';

import 'login_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 100,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 100 / 10,
        ),
        const Text(
          'LIVROUTE DRIVER',
          style: TextStyle(
            color: Colors.black,
            fontSize: 100 / 5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 50),
        const LoginForm(),
        const SizedBox(height: 50),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:liveroute_driver/configs/themes/custom_text_styles.dart';
import 'package:liveroute_driver/configs/themes/ui_parameters.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              label: kTextFormLabel('Email'),
            ),
            validator: emailValidator,
          ),
          kHeightSpace,
          TextFormField(
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              label: kTextFormLabel('Password'),
            ),
            validator: passwordValidator,
          ),
          const SizedBox(height: 30),
          loginButton(formKey),
        ],
      ),
    );
  }

  SizedBox loginButton(GlobalKey<FormState> formKey) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: Color(0xFF454545),
        ),
        onPressed: () => loginFunction(formKey),
        child: const Text('Login'),
      ),
    );
  }

  loginFunction(GlobalKey<FormState> form) {
    form.currentState!.validate();
  }

  String? emailValidator(String? val) {
    if (val == null || val == '') {
      return 'Please Enter Email';
    }
  }

  String? passwordValidator(String? val) {
    return 'sssss';
  }
}

class HalfBorderShape extends ShapeBorder {
  const HalfBorderShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection)!;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.topLeft.dx, rect.topLeft.dy);
    path.lineTo(rect.topRight.dx, rect.topRight.dy);
    path.lineTo(rect.bottomRight.dx, rect.bottomRight.dy * 0.5);
    path.lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy * 0.5);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return HalfBorderShape();
  }
}

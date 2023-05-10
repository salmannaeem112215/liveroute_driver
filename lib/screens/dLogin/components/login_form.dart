import 'package:flutter/material.dart';
import 'package:liveroute_driver/configs/themes/custom_text_styles.dart';
import 'package:liveroute_driver/configs/themes/ui_parameters.dart';

import '../../../configs/constants.dart';

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
          kHalfHeightpace,
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
    } else if (isEmailValid(val) == false) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    } else {
      List<String> errors = [];
      if (password.length < 8) {
        errors.add('Required 8 characters long');
      }
      if (!password.contains(RegExp(r'[A-Z]'))) {
        errors.add('Required one uppercase letter');
      }
      if (!password.contains(RegExp(r'[a-z]'))) {
        errors.add('Required one lowercase letter');
      }
      if (!password.contains(RegExp(r'[0-9]'))) {
        errors.add('Required one digit');
      }
      if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        errors.add('Required one speacial character');
      }

      if (errors.isEmpty) {
        return null;
      } else {
        String error = '';
        for (int i = 0; i < errors.length; i++) {
          error += errors[i];
          if (i != errors.length - 1) error += '\n';
        }
        return error;
      }
    }
  }

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
    return regex.hasMatch(email);
  }
}

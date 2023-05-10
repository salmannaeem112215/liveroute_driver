import 'package:flutter/material.dart';
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
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: emailValidator,
          ),
          kHeightSpace,
          TextFormField(
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
              labelText: 'Password',
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
            padding: const EdgeInsets.symmetric(vertical: 25),
            backgroundColor: Colors.black),
        onPressed: () => loginFunction(formKey),
        child: const Text('Login'),
      ),
    );
  }

  loginFunction(GlobalKey<FormState> form) {
    form.currentState!.validate();
  }

  String? emailValidator(String? val) {
    return 'sssss';
  }

  String? passwordValidator(String? val) {
    return 'sssss';
  }
}

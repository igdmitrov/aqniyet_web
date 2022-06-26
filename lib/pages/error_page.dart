import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/logo.dart';

class ErrorPage extends StatelessWidget {
  final String errorCode;
  final String errorMessage;
  const ErrorPage(
      {Key? key, required this.errorCode, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          const Logo(),
          const SizedBox(height: 30),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30),
          const Footer(),
        ],
      ),
    );
  }
}

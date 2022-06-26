import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/logo.dart';

class MainPage extends StatelessWidget {
  static String routeName = '/';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: const [
          Logo(),
          SizedBox(height: 30),
          Footer(),
        ],
      ),
    );
  }
}

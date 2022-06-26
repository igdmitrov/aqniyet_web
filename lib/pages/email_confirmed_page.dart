import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/footer.dart';
import '../widgets/logo.dart';

class EmailConfirmedPage extends StatelessWidget {
  const EmailConfirmedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context) as AppLocalizations;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          const Logo(),
          const SizedBox(height: 30),
          Text(
            appLocalization.email_confirmed,
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

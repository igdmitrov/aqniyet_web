import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/constants.dart';
import '../widgets/confirm_password_input.dart';
import '../widgets/footer.dart';
import '../widgets/form_input_divider.dart';
import '../widgets/logo.dart';
import '../widgets/password_input.dart';

class PasswordRecoveryPage extends StatefulWidget {
  final String accessToken;
  const PasswordRecoveryPage({Key? key, required this.accessToken})
      : super(key: key);

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  bool success = false;
  String? errorMsg;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _resetPassword(AppLocalizations appLocalization) async {
    setState(() {
      _isLoading = true;
    });

    final isValid =
        _form.currentState == null ? false : _form.currentState!.validate();

    if (isValid) {
      final response = await supabase.auth.api.updateUser(widget.accessToken,
          UserAttributes(password: _passwordController.text));
      final error = response.error;
      if (error != null) {
        setState(() {
          errorMsg = error.message;
        });
      } else {
        setState(() {
          errorMsg = null;
          success = true;
        });
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context) as AppLocalizations;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
        children: [
          Form(
            key: _form,
            child: Column(
              children: [
                const Logo(),
                const FormInputDivider(),
                Text(
                  appLocalization.reset_password,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (success == false)
                  PasswordInput(
                    controller: _passwordController,
                    isLoading: _isLoading,
                  ),
                const FormInputDivider(),
                if (success == false)
                  ConfirmPasswordInput(
                    confirmController: _confirmPasswordController,
                    passwordController: _passwordController,
                    isLoading: _isLoading,
                    password: _passwordController.text,
                  ),
                const FormInputDivider(),
                if (success == false)
                  ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () => _resetPassword(appLocalization),
                    child: Text(_isLoading
                        ? appLocalization.loading
                        : appLocalization.save),
                  ),
                const FormInputDivider(),
                if (errorMsg != null)
                  Text(
                    errorMsg as String,
                    style: const TextStyle(color: Colors.red),
                  ),
                if (success)
                  Text(
                    appLocalization.password_changed,
                    style: const TextStyle(fontSize: 18, color: Colors.indigo),
                  ),
                const FormInputDivider(),
                const FormInputDivider(),
                const FormInputDivider(),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'pages/email_confirmed_page.dart';
import 'pages/error_page.dart';
import 'pages/main_page.dart';
import 'pages/password_recovery_page.dart';
import 'pages/privacy_page.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ekafrwzpvnxinsngbpiu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVrYWZyd3pwdm54aW5zbmdicGl1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTE1ODMwNjgsImV4cCI6MTk2NzE1OTA2OH0.y0hW774bZKHBFhYDaK_87cmNNNvb1O14tDb769ED5Jg',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: MainPage.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == null) {
          return MaterialPageRoute(
            builder: (_) => const MainPage(),
          );
        }
        final String url = settings.name!;

        if (url == PrivacyPage.routeName) {
          return MaterialPageRoute(
            builder: (_) => const PrivacyPage(),
          );
        }

        if (url.contains('error_code')) {
          final errorCode = getParameterFromUrl('error_code', url);
          final errorMessage = getParameterFromUrl('error_description', url);
          return MaterialPageRoute(
            builder: (_) =>
                ErrorPage(errorCode: errorCode, errorMessage: errorMessage),
          );
        }

        if (url.contains('type')) {
          final type = getParameterFromUrl('type', url);
          final accessToken = getParameterFromUrl('access_token', url);

          if (type == 'email_change') {
            return MaterialPageRoute(
              builder: (_) => const EmailConfirmedPage(),
            );
          }

          if (type == 'recovery') {
            return MaterialPageRoute(
              builder: (_) => PasswordRecoveryPage(accessToken: accessToken),
            );
          }
        }

        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      },
    );
  }
}

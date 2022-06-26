import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const appName = 'AqNiyet';
const footerText = 'DEVELOPED BY IGOR DMITROV';

final supabase = Supabase.instance.client;

String getParameterFromUrl(String key, String url) {
  final length = url.length;
  int foundPosition = url.indexOf(key);

  if (foundPosition > 0) {
    foundPosition = url.indexOf("&$key") + 1;
  }

  final startPosition = foundPosition + key.length + 1;
  final nextParameter = url.indexOf('&', startPosition);

  if (nextParameter < 0) {
    return url.substring(startPosition, length);
  } else {
    return url.substring(startPosition, nextParameter);
  }
}

MultiValidator passwordValidator(AppLocalizations appLocalizations) {
  const minLengthPassword = 8;
  return MultiValidator([
    RequiredValidator(errorText: appLocalizations.password_required),
    MinLengthValidator(minLengthPassword,
        errorText: appLocalizations.password_length_error(minLengthPassword))
  ]);
}

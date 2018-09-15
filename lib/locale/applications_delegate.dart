import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization/locale/app_localizations.dart';

/*
Outer Wrapper which allows us to access all the information in our application.
 */
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  /*
  We put in the supported language's codes in our application
  And we check that the locale that we are passing contains one of these strings
  If so, it returns "true", and than we can grab/fetch the messages that we have created for
  that locale.
  If not so, it return "false" and leave if along
   */
  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'ja'].contains(locale.languageCode);
  }

  /*
  Its a load wrapper which calls the load method of the Applocalizations class.
   */
  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  /*
  Asks wether of not the application should reload everything,
  In this case we are passing false,
  since we don't want everything to reload again and again.
   */
  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

/*
1. we can run following command to generate the .arb file
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/{file containing AppLocalizations class}

2. Now we create one .arb file for each language we support, 3 in this case.
And we add the translated text into them.

3. Now to generate the corresponding dart files by running following command (in this case):
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading {{path to first .arb file} {path to second .arb file} ......... so on until all the .arb files are covered} lib/{file containing AppLocalizations class}

eg. flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/intl_en.arb lib/l10n/intl_es.arb lib/l10n/intl_ja.arb lib/l10n/intl_messages.arb lib/locale/app_localizations.dart
(In this case)

 */

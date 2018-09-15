import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization/locale/localizations.dart';

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
we can run following command to generate the .arb file
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/{file containing AppLocalizations class}
 */

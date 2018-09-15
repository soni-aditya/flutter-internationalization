import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  //loads up the strings we need based on the current locale of the application
  static Future<AppLocalizations> load(Locale locale) {
    //Get the actual locale name
    //We first check for the country code, if its empty than we just put locale name as the string
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    //We format the locale using Intl
    //This will format it in a standard format
    final String localeName = Intl.canonicalizedLocale(name);
    //loads our new set locale and returns the new Applocalization after doing so.
    //it also sets up the Intl defaultLocale property,which tells our app
    //this is the locale that we are currently in.
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /*
  Creating actual content that we want to translate in our application
   */
  String get title {
    return Intl.message(
      'Weather Application',
      name: 'title',
      desc: 'The title of the Application.',
    );
  }

  String get buttonText {
    return Intl.message(
      'Get the Weather',
      name: 'buttonText',
      desc: 'The text in the Weather button.',
    );
  }
}

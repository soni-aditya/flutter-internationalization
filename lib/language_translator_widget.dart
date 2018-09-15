import 'package:flutter/material.dart';
import 'package:flutter_internationalization/locale/app_localizations.dart';

class LanguageTranslator extends StatefulWidget {
  Function() refresh;

  LanguageTranslator(this.refresh);

  @override
  _LanguageTranslatorState createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  Locale locale;

  @override
  Widget build(BuildContext context) {
    //Get the current set locale,
    // which we can use to manipualte the locale throughout the application
    locale = Localizations.localeOf(context);
    //eg. change the font size according to the set language.
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Translator'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _makeInkwellForLanguage('English', 'en'),
            _makeInkwellForLanguage('Spanish', 'es'),
            _makeInkwellForLanguage('Japanese', 'ja'),
          ],
        ),
      ),
    );
  }

  _makeInkwellForLanguage(String languageName, String languageCode) {
    Locale newLocale = Locale(languageCode, "");
    return InkWell(
      onTap: () async {
        await AppLocalizations.load(newLocale);
        Navigator.pop(context);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(languageName.toUpperCase()),
        ),
      ),
    );
  }
}

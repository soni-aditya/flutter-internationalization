import 'package:flutter/material.dart';

class LanguageTranslator extends StatefulWidget {
  @override
  _LanguageTranslatorState createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  @override
  Widget build(BuildContext context) {
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
    return InkWell(
      onTap: () {},
      child: Center(
        child: Text(languageName.toUpperCase()),
      ),
    );
  }
}

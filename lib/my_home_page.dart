import 'package:flutter/material.dart';
import 'package:flutter_internationalization/language_translator_widget.dart';
import 'package:flutter_internationalization/locale/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  Locale locale;

  @override
  Widget build(BuildContext context) {
    //Get the current set locale,
    // which we can use to manipualte the locale throughout the application
    locale = Localizations.localeOf(context);
    //eg. change the font size according to the set language.
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Title'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.track_changes),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return LanguageTranslator(_refresh);
                    },
                  ),
                );
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).title,
            style: TextStyle(
              fontSize: locale.languageCode.contains("en") ? 20.0 : 15.0,
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context).buttonText),
          )
        ],
      ),
    );
  }

  _refresh() {
    setState(() {});
  }
}

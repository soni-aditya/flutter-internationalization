import 'package:flutter/material.dart';
import 'package:flutter_internationalization/locale/app_localizations.dart';
import 'package:flutter_internationalization/locale/applications_delegate.dart';
import 'package:flutter_internationalization/my_home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations
            .delegate, //Default -> Does localization for material app
        GlobalWidgetsLocalizations
            .delegate //Default -> Does localization for widgets
      ],
      //Locale('languageCode','countryCode')
      supportedLocales: [
        Locale("en", ""),
        Locale("es", ""),
        Locale("ja", ""),
        Locale("ar", ""),
      ],
      //Dynamic Builder for the title property
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).title,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

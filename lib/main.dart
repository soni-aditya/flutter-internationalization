import 'package:flutter/material.dart';
import 'package:flutter_internationalization/locale/app_localizations.dart';
import 'package:flutter_internationalization/locale/applications_delegate.dart';
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
}

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newzin/views/SplashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en_US',
      supportedLocales: ['en_US', 'ar']);
  runApp(LocalizedApp(delegate, MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Color(0xff002030),
            brightness: brightness ==  Brightness.light ? Brightness.light : Brightness.dark,
            scaffoldBackgroundColor:brightness ==Brightness.dark ? Color(0xff002030) : Color(0xfff9f9f9)
        ),
        themedWidgetBuilder: (context,themeData) =>  MaterialApp(
          theme: themeData,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
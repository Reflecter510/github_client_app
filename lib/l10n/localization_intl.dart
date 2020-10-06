import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

class GmLocalizations {
  String get login => Intl.message('Login');

  String get language => Intl.message('language');

  String get home => Intl.message('home');

  String get auto => Intl.message('auto');

  String get theme => Intl.message('theme');

  get userNameOrPasswordWrong => Intl.message('UserName Or Password Wrong');

  String get noDescription => Intl.message('No Description');

  String get logout => Intl.message('logout');

  String get logoutTip => Intl.message('logout Tip');

  String get cancel => Intl.message('cancel');

  String get yes => Intl.message('yes');

  get userName => Intl.message('userName');

  get userNameOrEmail => Intl.message('userName Or Email');

  get userNameRequired => Intl.message('userName Required');

  get password => Intl.message('password');

  get passwordRequired => Intl.message('password Required');

  static Future<GmLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new GmLocalizations();
    });
  }

  static GmLocalizations of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title {
    return Intl.message(
      'Github Client',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    //3
    return  GmLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}
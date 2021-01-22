import 'dart:convert';

class LanguageModel
{
  final String languageHead;
  final String languageBody;
  final String b1title;
  final String b2title;
  final String b3title;
  final String b1body;
  final String b2body;
  final String b3body;
  final String skip;
  final String phoneAuthMessage;
  final String phoneNumber;
  final String sendCode;
  final String loginFacebook;
  final String completeProfile;
  final String seeProfile;
  final String home;
  final String categories;
  final String favourites;
  final String settings;
  final String darkMode;
  final String changeLanguage;
  final String aboutUs;
  final String rateApp;
  final String terms;
  final String contactUs;
  final String logout;
  final String editProfile;
  final String notifications;
  final String notificationTitle;
  final String notificationDate;

  LanguageModel({
    this.languageHead,
    this.languageBody,
    this.b1title,
    this.b2title,
    this.b3title,
    this.b1body,
    this.b2body,
    this.b3body,
    this.skip,
    this.phoneAuthMessage,
    this.phoneNumber,
    this.sendCode,
    this.loginFacebook,
    this.completeProfile,
    this.seeProfile,
    this.home,
    this.categories,
    this.favourites,
    this.settings,
    this.darkMode,
    this.changeLanguage,
    this.aboutUs,
    this.rateApp,
    this.terms,
    this.contactUs,
    this.logout,
    this.editProfile,
    this.notifications,
    this.notificationTitle,
    this.notificationDate,
  });

  factory LanguageModel.fromJson(data)
  {
    Map<String, dynamic> json = jsonDecode(data);

    return new LanguageModel(
      languageHead: json['languageHead'] as String,
      languageBody: json['languageBody'] as String,
      b1title: json['b1title'] as String,
      b2title: json['b2title'] as String,
      b3title: json['b3title'] as String,
      b1body: json['b1body'] as String,
      b2body: json['b2body'] as String,
      b3body: json['b3body'] as String,
      skip: json['skip'] as String,
      phoneAuthMessage: json['phoneAuthMessage'] as String,
      phoneNumber: json['phoneNumber'] as String,
      sendCode: json['sendCode'] as String,
      loginFacebook: json['loginFacebook'] as String,
      completeProfile: json['completeProfile'] as String,
      seeProfile: json['seeProfile'] as String,
      home: json['home'] as String,
      categories: json['categories'] as String,
      favourites: json['favourites'] as String,
      settings: json['settings'] as String,
      darkMode: json['darkMode'] as String,
      changeLanguage: json['changeLanguage'] as String,
      aboutUs: json['aboutUs'] as String,
      rateApp: json['rateApp'] as String,
      terms: json['terms'] as String,
      contactUs: json['contactUs'] as String,
      logout: json['logout'] as String,
      editProfile: json['editProfile'] as String,
      notifications: json['notifications'] as String,
      notificationTitle: json['notificationTitle'] as String,
      notificationDate: json['notificationDate'] as String,
    );
  }
}
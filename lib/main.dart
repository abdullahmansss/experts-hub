import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:softagi/layout/home_layout.dart';
import 'package:softagi/modules/authentication/authentication_screen.dart';
import 'package:softagi/modules/select_language/select_language_screen.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/cubit/states.dart';
import 'package:softagi/shared/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await init();

  String appLanguage = await getAppLanguage();

  String translation = await rootBundle
      .loadString('assets/translations/${appLanguage ?? 'ar'}.json');

  bool appThemeMode = await getThemeMode();

  final deviceToken = await FirebaseMessaging().getToken();

  FirebaseMessaging().subscribeToTopic('experts');

  print(deviceToken.toString());

  var user = FirebaseAuth.instance.currentUser;

  runApp(
    MyApp(
      translation: translation,
      isDark: appThemeMode,
      code: appLanguage ?? 'ar',
      widget: user != null ? HomeLayout() : SelectLanguageScreen(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String translation;
  final String code;
  final bool isDark;
  final Widget widget;

  MyApp({
    this.translation,
    this.code,
    this.isDark,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getLanguage(
              translation: this.translation,
              code: this.code,
            )
            ..setAppThemeMode(
              dark: isDark ?? false,
            )
            ..getHomeData(),
        ),
      ],
      child: Builder(
        builder: (context) {
          setFCM(context);

          return BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                navigatorObservers: [StatusBarTextRouteObserver(context)],
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: AppCubit.get(context).appFontFamily,
                  brightness:
                      isAppDark(context) ? Brightness.dark : Brightness.light,
                  appBarTheme: AppBarTheme(
                    color: Colors.transparent,
                    elevation: 0.0,
                    brightness:
                        isAppDark(context) ? Brightness.dark : Brightness.light,
                    iconTheme: IconThemeData(
                      color: isAppDark(context) ? Colors.white : Colors.black,
                    ),
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: Directionality(
                  textDirection: appDirection(context),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: widget,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

void setFCM(context) {
  FirebaseMessaging().configure(
    onMessage: (msg) {
      AppCubit.get(context).refreshHomeData();
      return null;
    },
  );
}

class StatusBarTextRouteObserver extends NavigatorObserver {
  BuildContext context;

  StatusBarTextRouteObserver(this.context) {
    setStatusBarTextColor();
  }

  setStatusBarTextColor() {
    statusBarOverrider();
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    setStatusBarTextColor();
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    setStatusBarTextColor();
  }
}

statusBarOverrider() async {
  await Future.delayed(const Duration(milliseconds: 1000));
  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
}

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softagi/shared/localization/language_model.dart';
import 'package:softagi/modules/notifications/notifications_screen.dart';
import 'package:softagi/modules/on_board/on_board_screen.dart';
import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/di/di.dart';
import 'package:softagi/shared/styles/icon_broken.dart';
import 'package:softagi/shared/network/local/cache_helper.dart';
import 'package:softagi/shared/styles/styles.dart';

class CurrentLanguages {
  String code;
  String title;
  String image;

  CurrentLanguages({
    this.title,
    this.code,
    this.image,
  });
}

Color mainColor = HexColor('1084FE');

var languagesList = [
  CurrentLanguages(
    code: 'en',
    title: 'English',
    image: 'assets/images/usa.jpg',
  ),
  CurrentLanguages(
    code: 'ar',
    title: 'العربية',
    image: 'assets/images/egypt.png',
  ),
];

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

AppBar DefaultAppBar({
  Widget title,
  String titleText,
  bool leading = false,
  bool notifications = false,
  bool search = false,
  bool theme = false,
  Widget leadingIcon,
  List<Widget> actions,
  @required BuildContext context,
}) =>
    AppBar(
      titleSpacing: 20.0,
      centerTitle: false,
      leading: leadingIcon != null
          ? leadingIcon
          : leading
              ? leadingButton(context)
              : null,
      title: titleText != null ? Text(
        titleText,
        style: black18().copyWith(
          color: isAppDark(context) ? Colors.white : Colors.black,
        ),
      ) : title,
      actions: actions ??
          [
            if (search) searchButton(context),
            if (notifications) notificationsButton(context),
            if (theme) themeButton(context),
          ],
    );

Widget notificationsButton(context) => IconButton(
      icon: Icon(
        IconBroken.Notification,
        color: greyDarkColor(context),
      ),
      onPressed: () {
        navigateTo(
          context,
          NotificationsScreen(),
        );
      },
    );

Widget themeButton(context) => IconButton(
      onPressed: () {
        AppCubit.get(context).changeAppThemeMode();
      },
      icon: Icon(
        Icons.brightness_medium,
        color: mainColor,
      ),
    );

Widget searchButton(context) => IconButton(
      icon: Icon(
        IconBroken.Search,
        color: greyDarkColor(context),
      ),
      onPressed: () {
        navigateTo(
          context,
          NotificationsScreen(),
        );
      },
    );

Widget leadingButton(context, {bool color =false}) => IconButton(
      icon: Icon(
        appDirection(context) == TextDirection.ltr
            ? IconBroken.Arrow___Left_2
            : IconBroken.Arrow___Right_2,
        color: color ? Colors.white : null,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

Widget defaultTextField({
  @required String hint,
  @required String validate,
  @required TextInputType type,
  @required BuildContext context,
  Function onSubmit,
  @required TextEditingController textEditingController,
}) => TextFormField(
  controller: textEditingController,
  style: black14(),
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  validator: (value)
  {
    if (value.isEmpty)
    {
      return validate;
    }
    return null;
  },
  decoration: InputDecoration(
    hintText: hint,
    hintStyle: grey12(),
    border: InputBorder.none,
  ),
);

Widget defaultButton({
  @required Function function,
  @required String text,
}) =>
    Container(
      width: double.infinity,
      height: 40.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(
          3.0,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 10,
        //     blurRadius: 15,
        //   ),
        // ],
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget buttonWithIcon({
  @required Function function,
  Color backGround,
  String colorHex,
  @required String icon,
  @required String text,
}) =>
    Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: colorHex == null ? backGround : HexColor(colorHex),
        borderRadius: BorderRadius.circular(
          3.0,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: SvgPicture.asset(
                icon,
                height: 15.0,
                color: Colors.white,
              ),
            ),
            Container(
              height: double.infinity,
              width: 1.0,
              color: Colors.white,
            ),
            Expanded(
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildLanguageItem(
        {CurrentLanguages model, context, bool fromSettings = false}) =>
    InkWell(
      onTap: () {
        AppCubit.get(context)
            .changeAppDirection(
          code: model.code,
          fromSettings: fromSettings,
        )
            .then((value) {
          if (fromSettings) {
            Navigator.pop(context);
          } else {
            navigateAndFinish(
              context,
              OnBoardScreen(),
            );
          }
        });
      },
      borderRadius: BorderRadius.circular(
        10.0,
      ),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(
                3.0,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  model.image,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            model.title,
            style: black16(),
          ),
          Spacer(),
          if (getCurrentAppLanguage(context) == model.code && fromSettings)
            Icon(
              appDirection(context) == TextDirection.rtl
                  ? IconBroken.Arrow___Left_Circle
                  : IconBroken.Arrow___Right_Circle,
              color: mainColor,
            ),
        ],
      ),
    );

LanguageModel languageModel(context) => AppCubit.get(context).languageModel;

TextDirection appDirection(context) => AppCubit.get(context).textDirection;

bool isAppDark(context) => AppCubit.get(context).isDark;

Future<bool> getThemeMode() async => await di<CacheHelper>().get('themeMode');

Future<String> getAppLanguage() async =>
    await di<CacheHelper>().get('appLanguage');

String getCurrentAppLanguage(context) =>
    AppCubit.get(context).currentAppLanguage;

Color greyDarkColor(context) => isAppDark(context) ? Colors.grey : null;

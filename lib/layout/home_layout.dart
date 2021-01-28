import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi/modules/categories/categories_screen.dart';
import 'package:softagi/modules/favourites/favourites_screen.dart';
import 'package:softagi/modules/home/home_screen.dart';
import 'package:softagi/modules/settings/settings_screen.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/cubit/states.dart';
import 'package:softagi/shared/styles/icon_broken.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var widgets = [
    HomeScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: appDirection(context),
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                currentIndex = index;

                setState(() {});
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: mainColor,
              iconSize: 20.0,
              elevation: 5.0,
              currentIndex: currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: languageModel(context).home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Category,
                  ),
                  label: languageModel(context).categories,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Heart,
                  ),
                  label: languageModel(context).favourites,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Setting,
                  ),
                  label: languageModel(context).settings,
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: widgets[currentIndex],
                ),
                if (isAppDark(context))
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black12,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

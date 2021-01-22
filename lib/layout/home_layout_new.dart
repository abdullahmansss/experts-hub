import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class HomeScreenNew extends StatefulWidget {
  @override
  _HomeScreenNewState createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  var widgets = [
    'Home',
    'Categories',
    'Favourites',
    'Settings',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;

          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mainColor,
        iconSize: 20.0,
        backgroundColor: Colors.white,
        elevation: 5.0,
        currentIndex: currentIndex,
        // selectedLabelStyle: TextStyle(
        //   fontSize: 12.0,
        // ),
        // unselectedLabelStyle: TextStyle(
        //   fontSize: 12.0,
        // ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              IconBroken.Home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconBroken.Category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconBroken.Heart,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconBroken.Setting,
            ),
            label: 'Settings',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          bottom: 20.0,
          end: 20.0,
          start: 20.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: grey14(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Abdullah Mansour',
                        style: black18Bold(),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(
                      3.0,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://scontent.fcai20-2.fna.fbcdn.net/v/t1.0-9/81727508_2965855293434298_4340058684466921472_o.jpg?_nc_cat=102&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGoWzSlyw4XnrDUnkSm5T2Oe4ucBJq_mnB7i5wEmr-acDI3y91mts0Q3aucvvWPaPf1Kc3x5iuI8fVWEks7k17P&_nc_ohc=6iwiJA2s3qsAX9ttcpp&_nc_ht=scontent.fcai20-2.fna&oh=17da9303f4e3d377d96fefb227a9d0dd&oe=602B003D'),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 5,
                    //     blurRadius: 15,
                    //   ),
                    // ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: ()
              {},
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 5,
                  //     blurRadius: 15,
                  //   ),
                  // ],
                ),
                padding: EdgeInsets.all(
                  10.0,
                ),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 50.0,
                      lineWidth: 2.0,
                      percent: 0.7,
                      center: Text(
                        '70%',
                        style: grey12Bold().copyWith(
                          color: mainColor,
                        ),
                      ),
                      progressColor: mainColor,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Complete your profile',
                      style: grey16Bold().copyWith(
                        color: mainColor,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      IconBroken.Arrow___Right_Circle,
                      color: mainColor,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

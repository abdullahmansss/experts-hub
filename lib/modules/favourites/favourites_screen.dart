import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:softagi/shared/components/constants.dart';

import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class FavouritesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text(
          languageModel(context).favourites,
          style: black18().copyWith(
            color: isAppDark(context) ? Colors.white : Colors.black,
          ),
        ),
        notifications: true,
        context: context,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 20.0,
                end: 20.0,
                start: 20.0,
                top: 20.0,
              ),
              child: Column(
                children:
                [
                  // GestureDetector(
                  //   onTap: ()
                  //   {},
                  //   child: Container(
                  //     width: double.infinity,
                  //     clipBehavior: Clip.antiAliasWithSaveLayer,
                  //     decoration: BoxDecoration(
                  //       color: mainColor.withOpacity(.2),
                  //       borderRadius: BorderRadius.circular(
                  //         15.0,
                  //       ),
                  //     ),
                  //     padding: EdgeInsets.all(
                  //       10.0,
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         CircularPercentIndicator(
                  //           radius: 50.0,
                  //           lineWidth: 2.0,
                  //           percent: 0.7,
                  //           center: Text(
                  //             '70%',
                  //             style: grey12Bold().copyWith(
                  //               color: mainColor,
                  //             ),
                  //           ),
                  //           progressColor: mainColor,
                  //         ),
                  //         SizedBox(
                  //           width: 20.0,
                  //         ),
                  //         Text(
                  //           languageModel(context).completeProfile,
                  //           style: grey16Bold().copyWith(
                  //             color: mainColor,
                  //           ),
                  //         ),
                  //         Spacer(),
                  //         Icon(
                  //           appDirection(context) == TextDirection.ltr ? IconBroken.Arrow___Right_Circle : IconBroken.Arrow___Left_Circle,
                  //           color: mainColor,
                  //           size: 40.0,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

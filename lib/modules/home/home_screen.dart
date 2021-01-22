import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:softagi/shared/components/constants.dart';

import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/cubit/states.dart';
import 'package:softagi/shared/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://scontent.fcai20-2.fna.fbcdn.net/v/t1.0-9/81727508_2965855293434298_4340058684466921472_o.jpg?_nc_cat=102&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGoWzSlyw4XnrDUnkSm5T2Oe4ucBJq_mnB7i5wEmr-acDI3y91mts0Q3aucvvWPaPf1Kc3x5iuI8fVWEks7k17P&_nc_ohc=6iwiJA2s3qsAX9ttcpp&_nc_ht=scontent.fcai20-2.fna&oh=17da9303f4e3d377d96fefb227a9d0dd&oe=602B003D'),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abdullah Mansour',
                        style: black14().copyWith(
                          color:
                              isAppDark(context) ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        languageModel(context).seeProfile,
                        style: grey12(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            search: true,
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
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: mainColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
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
                                languageModel(context).completeProfile,
                                style: grey16Bold().copyWith(
                                  color: mainColor,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                appDirection(context) == TextDirection.ltr
                                    ? IconBroken.Arrow___Right_Circle
                                    : IconBroken.Arrow___Left_Circle,
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
              ),
            ],
          ),
        );
      },
    );
  }
}

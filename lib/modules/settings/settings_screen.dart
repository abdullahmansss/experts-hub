import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:softagi/modules/host_profile/host_profile_screen.dart';
import 'package:softagi/modules/host_profile/host_profile_screen2.dart';
import 'package:softagi/shared/components/constants.dart';

import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/cubit/states.dart';
import 'package:softagi/shared/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class SettingsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            titleText: languageModel(context).settings,
            context: context,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(
                      10.0,
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
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Abdullah Mansour',
                  style: black14Bold().copyWith(
                    color: isAppDark(context) ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                GestureDetector(
                  onTap: (){
                    navigateTo(
                      context,
                      HostProfile2Screen(),
                    );
                  },
                  child: Text(
                    languageModel(context).seeProfile,
                    style: grey12().copyWith(
                      color: mainColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                // Container(
                //   padding: EdgeInsets.all(5.0),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(
                //       5.0,
                //     ),
                //   ),
                //   child: Row(
                //     children: [
                //       Container(
                //         width: 40.0,
                //         height: 40.0,
                //         decoration: BoxDecoration(
                //           color: HexColor('FF72B4').withOpacity(.3,),
                //           borderRadius: BorderRadius.circular(
                //             5.0,
                //           ),
                //         ),
                //         child: Icon(
                //           IconBroken.Notification,
                //           color: HexColor('FF72B4'),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 20.0,
                //       ),
                //       Text(
                //         'Notifications',
                //         style: black14Bold(),
                //       ),
                //       Spacer(),
                //       Icon(
                //         appDirection(context) == TextDirection.ltr ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        buildSettingItem(
                          context: context,
                          title: languageModel(context).editProfile,
                          function: () {},
                          colorCode: 'FD6757',
                          icon: IconBroken.Edit_Square,
                        ),
                        buildSettingItem(
                          context: context,
                          title: languageModel(context).aboutUs,
                          function: () {},
                          colorCode: 'FF72B4',
                          icon: IconBroken.Info_Square,
                        ),
                        InkWell(
                          onTap: ()
                          {
                            AppCubit.get(context).changeAppThemeMode();
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: HexColor('1084FE').withOpacity(
                                    .3,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.brightness_medium,
                                  color: HexColor('1084FE'),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                languageModel(context).darkMode,
                                style: black14Bold(),
                              ),
                              Spacer(),
                              CupertinoSwitch(
                                activeColor: mainColor,
                                value: isAppDark(context),
                                onChanged: (value)
                                {
                                  AppCubit.get(context).changeAppThemeMode();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        buildSettingItem(
                          context: context,
                          title: languageModel(context).changeLanguage,
                          function: () {
                            displayBottomSheet(context);
                          },
                          colorCode: 'FC96C6',
                          icon: IconBroken.Paper,
                        ),
                        buildSettingItem(
                          context: context,
                          title: languageModel(context).contactUs,
                          function: () {},
                          colorCode: '67D3D0',
                          icon: IconBroken.Calling,
                        ),
                        buildSettingItem(
                          context: context,
                          title: languageModel(context).rateApp,
                          function: () {},
                          colorCode: '01A2F3',
                          icon: IconBroken.Star,
                        ),
                        buildSettingItem(
                          context: context,
                          title: languageModel(context).terms,
                          function: () {},
                          colorCode: '8055EE',
                          icon: IconBroken.Shield_Done,
                        ),
                        buildSettingItem(
                          context: context,
                          title: languageModel(context).logout,
                          function: () {},
                          colorCode: 'BB85C3',
                          icon: IconBroken.Logout,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void displayBottomSheet(BuildContext context)
  {
    showModalBottomSheet(
        context: context,
        builder: (ctx)
        {
          return Directionality(
            textDirection: appDirection(context),
            child: Padding(
              padding: const EdgeInsets.all(20.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    languageModel(context).languageHead,
                    style: black18Bold(),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    languageModel(context).languageBody,
                    style: grey14(),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildLanguageItem(
                      context: context,
                      model: languagesList[index],
                      fromSettings: true,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.0,
                    ),
                    itemCount: languagesList.length,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget buildSettingItem({
    @required Function function,
    @required String colorCode,
    @required String title,
    @required IconData icon,
    @required context,
  }) =>
      Column(
        children: [
          InkWell(
            onTap: function,
            child: Row(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: HexColor(colorCode).withOpacity(
                      .3,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: HexColor(colorCode),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  title,
                  style: black14Bold().copyWith(
                    color: title == languageModel(context).logout ? mainColor : null,
                  ),
                ),
                Spacer(),
                Icon(
                  appDirection(context) == TextDirection.ltr
                      ? IconBroken.Arrow___Right_2
                      : IconBroken.Arrow___Left_2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
}
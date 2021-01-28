import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi/modules/host_profile/host_profile_screen2.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/cubit/states.dart';
import 'package:softagi/shared/di/di.dart';
import 'package:softagi/shared/styles/icon_broken.dart';
import 'package:softagi/shared/network/remote/dio_helper.dart';
import 'package:softagi/shared/styles/styles.dart';

class HomeScreen extends StatelessWidget
{
  var linkText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Map homeData = AppCubit.get(context).homeData;

        return Scaffold(
          appBar: DefaultAppBar(
            title: GestureDetector(
              onTap: () {
                navigateTo(
                  context,
                  HostProfile2Screen(),
                );
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage(
                      'assets/images/home2.jpg',
                    ),
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
                          style: black14Bold().copyWith(
                            color: isAppDark(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
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
            ),
            search: true,
            notifications: true,
            context: context,
          ),
          body: ConditionalBuilder(
            condition: state is! AppStateLoading,
            builder: (context) => RefreshIndicator(
              onRefresh: () {
                return AppCubit.get(context).refreshHomeData();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () {},
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
                      //           appDirection(context) == TextDirection.ltr
                      //               ? IconBroken.Arrow___Right_Circle
                      //               : IconBroken.Arrow___Left_Circle,
                      //           color: mainColor,
                      //           size: 40.0,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    homeData['image'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   height: 150.0,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(
                            //       5.0,
                            //     ),
                            //     color: Colors.grey.withOpacity(
                            //       .2,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    homeData['add_header'],
                                    style: black16Bold(),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    homeData['add_body'],
                                    style: black14(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          top: 5.0,
                          right: 10.0,
                          left: 10.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: AssetImage(
                                    'assets/images/home2.jpg',
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: linkText,
                                    style: black14(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'What is on your mind ...',
                                      hintStyle: grey12(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5.0,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 1.0,
                                color: isAppDark(context)
                                    ? Colors.black12
                                    : Colors.grey[200],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      print('like clicked');
                                      sendNotification(linkText.text);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconBroken.Camera,
                                          size: 16.0,
                                          color: mainColor,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Image',
                                          style: grey12(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      print('like clicked');
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconBroken.User1,
                                          size: 16.0,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Tags',
                                          style: grey12(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      print('share clicked');
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconBroken.Paper_Plus,
                                          size: 16.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Document',
                                          style: grey12(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 15.0,
                      // ),
                      // Container(
                      //   height: 160.0,
                      //   child: ListView.separated(
                      //     physics: BouncingScrollPhysics(),
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index)
                      //     {
                      //       return Stack(
                      //       alignment: AlignmentDirectional.topStart,
                      //       children: [
                      //         Container(
                      //           width: 105.0,
                      //           height: 160.0,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(
                      //               5.0,
                      //             ),
                      //             image: DecorationImage(
                      //               image: NetworkImage(
                      //                 'https://image.freepik.com/free-photo/creative-wallpaper-with-different-cubes_23-2148811495.jpg',
                      //               ),
                      //               fit: BoxFit.cover,
                      //             ),
                      //             color: Colors.red,
                      //           ),
                      //         ),
                      //         Container(
                      //           width: 105.0,
                      //           height: 160.0,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(
                      //               5.0,
                      //             ),
                      //             color: Colors.black.withOpacity(.3,),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(5.0),
                      //           child: CircleAvatar(
                      //             radius: 20.0,
                      //             backgroundImage: AssetImage(
                      //               'assets/images/home2.jpg',
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //     },
                      //     separatorBuilder: (context, index) => SizedBox(
                      //       width: 10.0,
                      //     ),
                      //     itemCount: 5,
                      //   ),
                      // ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildHomeItem(context),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15.0,
                        ),
                        itemCount: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  void sendNotification(String image)
  {
    FirebaseFirestore.instance
        .collection('home-sections')
        .doc('home_image')
        .update({
      'image': image,
    }).then((value) {
      print('success');

      var model = {
        "to": "/topics/experts",
        "notification": {
          "title": "you have recieved a message from abdullah mansour",
          "body": "testing body from post man",
          "sound": "default"
        },
        "android": {
          "priority": "HIGH",
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default",
            "default_sound": true,
            "default_vibrate_timings": true,
            "default_light_settings": true
          }
        }
      };

      di<DioHelper>()
          .postData('fcm/send', data: jsonEncode(model))
          .then((value) {
        print(value.toString());
        print('success 2');
        linkText.text = '';
      }).catchError((error) {
        print(error.toString());
        print('error');
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

  // Future<Null> refreshData()
  // {
  //   AppCubit.get(context).getRealTimeData();
  // }

  Widget buildHomeItem(context) => InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.only(
            top: 10.0,
            right: 10.0,
            left: 10.0,
          ),
          child: Column(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print('profile clicked');
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage(
                          'assets/images/home2.jpg',
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Abdullah Mansour',
                                  style: black14Bold(),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  size: 16.0,
                                  color: mainColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Icon(
                                //   IconBroken.Time_Circle,
                                //   size: 15.0,
                                //   color: Colors.grey,
                                // ),
                                // SizedBox(
                                //   width: 5.0,
                                // ),
                                Text(
                                  languageModel(context).notificationDate,
                                  style: grey12(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40.0,
                        child: IconButton(
                          onPressed: () {
                            print('more clicked');
                          },
                          alignment: AlignmentDirectional.centerEnd,
                          padding: EdgeInsets.all(
                            0.0,
                          ),
                          icon: Icon(
                            IconBroken.More_Circle,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: isAppDark(context) ? Colors.black12 : Colors.grey[200],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print('text clicked');
                  },
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    style: black14().copyWith(
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print('agile clicked');
                        },
                        child: Text(
                          '#software_development',
                          style: black14Bold().copyWith(
                            color: mainColor,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print('agile clicked');
                        },
                        child: Text(
                          '#mobile_development',
                          style: black14Bold().copyWith(
                            color: mainColor,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print('agile clicked');
                        },
                        child: Text(
                          '#flutter_development',
                          style: black14Bold().copyWith(
                            color: mainColor,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print('agile clicked');
                        },
                        child: Text(
                          '#IT',
                          style: black14Bold().copyWith(
                            color: mainColor,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print('agile clicked');
                        },
                        child: Text(
                          '#agile',
                          style: black14Bold().copyWith(
                            color: mainColor,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                child: InkWell(
                  onTap: () {
                    print('image clicked');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/home2.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 35.0,
                child: FlatButton(
                  onPressed: () {
                    print('meta clicked');
                  },
                  padding: EdgeInsets.all(
                    0.0,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '1200',
                        style: grey12(),
                      ),
                      Spacer(),
                      Icon(
                        IconBroken.Chat,
                        color: Colors.amber,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '521 comments',
                        style: grey12(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: isAppDark(context) ? Colors.black12 : Colors.grey[200],
              ),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage: AssetImage(
                              'assets/images/home2.jpg',
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'Write a comment ...',
                            style: grey12(),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(
                        0.0,
                      ),
                      onPressed: () {
                        print('comment clicked');
                      },
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      print('like clicked');
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 16.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Like',
                          style: grey12(),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      print('share clicked');
                    },
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Upload,
                          size: 16.0,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Share',
                          style: grey12(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
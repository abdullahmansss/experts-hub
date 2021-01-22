import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class HostProfileScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appDirection(context),
      child: Scaffold(
        appBar: DefaultAppBar(
          leading: true,
          context: context,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180.0,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              10.0,
                            ),
                            topLeft: Radius.circular(
                              10.0,
                            ),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://img.jakpost.net/c/2019/03/02/2019_03_02_66706_1551461528._large.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: (){},
                          customBorder: CircleBorder(),
                          child: Container(
                            width: 140.0,
                            height: 140.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://scontent.fcai20-2.fna.fbcdn.net/v/t1.0-9/81727508_2965855293434298_4340058684466921472_o.jpg?_nc_cat=102&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGoWzSlyw4XnrDUnkSm5T2Oe4ucBJq_mnB7i5wEmr-acDI3y91mts0Q3aucvvWPaPf1Kc3x5iuI8fVWEks7k17P&_nc_ohc=6iwiJA2s3qsAX9ttcpp&_nc_ht=scontent.fcai20-2.fna&oh=17da9303f4e3d377d96fefb227a9d0dd&oe=602B003D'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Abdullah Mansour',
                  style: black18Bold().copyWith(
                    color: isAppDark(context) ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'IT Entrepreneur',
                  style: grey14(),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(.3,),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          image: DecorationImage(
                            image: NetworkImage('https://media.wired.com/photos/5be4cd03db23f3775e466767/125:94/w_2375,h_1786,c_limit/books-521812297.jpg'),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Courses',
                        style: black14Bold(),
                      ),
                      Spacer(),
                      Text(
                        'see more',
                        style: grey14(),
                      ),
                      Icon(
                        appDirection(context) == TextDirection.ltr ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: HexColor('FF72B4').withOpacity(.3,),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.0,
                          ),
                          image: DecorationImage(
                            image: NetworkImage('https://media.wired.com/photos/5be4cd03db23f3775e466767/125:94/w_2375,h_1786,c_limit/books-521812297.jpg'),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Courses',
                        style: black14Bold(),
                      ),
                      Spacer(),
                      Icon(
                        appDirection(context) == TextDirection.ltr ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: HexColor('FF72B4').withOpacity(.3,),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            image: DecorationImage(
                              image: NetworkImage('https://media.wired.com/photos/5be4cd03db23f3775e466767/125:94/w_2375,h_1786,c_limit/books-521812297.jpg'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Courses',
                        style: black14Bold(),
                      ),
                      Spacer(),
                      Icon(
                        appDirection(context) == TextDirection.ltr ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: HexColor('FF72B4').withOpacity(.3,),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            image: DecorationImage(
                              image: NetworkImage('https://media.wired.com/photos/5be4cd03db23f3775e466767/125:94/w_2375,h_1786,c_limit/books-521812297.jpg'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Courses',
                        style: black14Bold(),
                      ),
                      Spacer(),
                      Icon(
                        appDirection(context) == TextDirection.ltr ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: HexColor('FF72B4').withOpacity(.3,),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            image: DecorationImage(
                              image: NetworkImage('https://media.wired.com/photos/5be4cd03db23f3775e466767/125:94/w_2375,h_1786,c_limit/books-521812297.jpg'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Courses',
                        style: black14Bold(),
                      ),
                      Spacer(),
                      Icon(
                        appDirection(context) == TextDirection.ltr ? IconBroken.Arrow___Right_2 : IconBroken.Arrow___Left_2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Padding(
  // padding: const EdgeInsets.all(8.0),
  // child: FloatingActionButton(
  // onPressed: () {},
  // mini: true,
  // backgroundColor: mainColor,
  // child: Icon(
  // IconBroken.Camera,
  // ),
  // ),
  // )
}
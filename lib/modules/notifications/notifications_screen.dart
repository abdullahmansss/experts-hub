import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class NotificationsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Directionality(
      textDirection: appDirection(context),
      child: Scaffold(
        appBar: DefaultAppBar(
          titleText: languageModel(context).notifications,
          leading: true,
          context: context,
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildNotificationItem(
              context: context,
              type: index%2==1 ? 'add' : 'follow',
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 15.0,
            ),
            itemCount: 20,
          ),
        ),
      ),
    );
  }

  Widget buildNotificationItem({
    @required Function function,
    @required String type,
    @required String title,
    @required String date,
    @required BuildContext context,
  })
  {
    Widget icon;

    switch(type)
    {
      case 'follow':
        icon = Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: HexColor('FD6757').withOpacity(
              .3,
            ),
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Icon(
            IconBroken.Plus,
            color: HexColor('FD6757'),
          ),
        );
        break;
      case 'add':
        icon = Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: HexColor('67D3D0').withOpacity(
              .3,
            ),
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Icon(
            IconBroken.Add_User,
            color: HexColor('67D3D0'),
          ),
        );
        break;
    }

    return InkWell(
      onTap: ()
      {

      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          icon,
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageModel(context).notificationTitle,
                  style: black14Bold(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Icon(
                      IconBroken.Time_Circle,
                      size: 15.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      languageModel(context).notificationDate,
                      style: grey12(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: isAppDark(context) ? Colors.black12 : Colors.grey[200],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget demo()=> Column(
  //   children:
  //   [
  //     InkWell(
  //       onTap: ()
  //       {
  //
  //       },
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children:
  //         [
  //           Container(
  //             child: Stack(
  //               children: [
  //                 Container(
  //                   width: 55.0,
  //                   height: 55.0,
  //                   decoration: BoxDecoration(
  //                     color: mainColor,
  //                     borderRadius: BorderRadius.circular(
  //                       5.0,
  //                     ),
  //                     image: DecorationImage(
  //                       fit: BoxFit.cover,
  //                       image: NetworkImage(
  //                           'https://scontent.fcai20-2.fna.fbcdn.net/v/t1.0-9/81727508_2965855293434298_4340058684466921472_o.jpg?_nc_cat=102&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGoWzSlyw4XnrDUnkSm5T2Oe4ucBJq_mnB7i5wEmr-acDI3y91mts0Q3aucvvWPaPf1Kc3x5iuI8fVWEks7k17P&_nc_ohc=6iwiJA2s3qsAX9ttcpp&_nc_ht=scontent.fcai20-2.fna&oh=17da9303f4e3d377d96fefb227a9d0dd&oe=602B003D'),
  //                     ),
  //                     // boxShadow: [
  //                     //   BoxShadow(
  //                     //     color: Colors.grey.withOpacity(0.5),
  //                     //     spreadRadius: 5,
  //                     //     blurRadius: 15,
  //                     //   ),
  //                     // ],
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: Alignment.bottomRight,
  //                   child: Container(
  //                     width: 20.0,
  //                     height: 20.0,
  //                     decoration: BoxDecoration(
  //                       color: HexColor('67D3D0'),
  //                       borderRadius: BorderRadius.circular(
  //                         5.0,
  //                       ),
  //                     ),
  //                     child: Icon(
  //                       IconBroken.Plus,
  //                       size: 12.0,
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             width: 60.0,
  //             height: 60.0,
  //           ),
  //           SizedBox(
  //             width: 20.0,
  //           ),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   languageModel(context).notificationTitle,
  //                   style: black14Bold(),
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //                 SizedBox(
  //                   height: 3.0,
  //                 ),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children:
  //                   [
  //                     Icon(
  //                       IconBroken.Time_Circle,
  //                       size: 15.0,
  //                       color: Colors.grey,
  //                     ),
  //                     SizedBox(
  //                       width: 5.0,
  //                     ),
  //                     Text(
  //                       languageModel(context).notificationDate,
  //                       style: grey12(),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 15.0,
  //                 ),
  //                 Container(
  //                   width: double.infinity,
  //                   height: 1.0,
  //                   color: isAppDark(context) ? Colors.black12 : Colors.grey[200],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     SizedBox(
  //       height: 15.0,
  //     ),
  //   ],
  // );
}

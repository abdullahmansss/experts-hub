import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/styles/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class HostProfile2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: appDirection(context),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: mainColor,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://media.istockphoto.com/photos/education-concept-with-old-book-in-library-picture-id899906832?k=6&m=899906832&s=612x612&w=0&h=BClbVwVn82IPStSxEhzTzL4kCe52bBEAGW-869z2VUo='),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300.0,
                    color: Colors.black54,
                    padding: EdgeInsets.only(top: 30.0,),
                    alignment: AlignmentDirectional.topStart,
                    child: leadingButton(context, color: true,),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://scontent.fcai20-2.fna.fbcdn.net/v/t1.0-9/81727508_2965855293434298_4340058684466921472_o.jpg?_nc_cat=102&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGoWzSlyw4XnrDUnkSm5T2Oe4ucBJq_mnB7i5wEmr-acDI3y91mts0Q3aucvvWPaPf1Kc3x5iuI8fVWEks7k17P&_nc_ohc=6iwiJA2s3qsAX9ttcpp&_nc_ht=scontent.fcai20-2.fna&oh=17da9303f4e3d377d96fefb227a9d0dd&oe=602B003D'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Abdullah Mansour',
                        style: black18Bold().copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'IT Entrepreneur',
                        style: grey12().copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
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

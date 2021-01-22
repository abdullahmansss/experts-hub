import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:softagi/layout/home_layout.dart';
import 'package:softagi/layout/home_layout_new.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class AuthenticationScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: DefaultAppBar(
        theme: true,
        context: context,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              'assets/images/auth.png',
            ),
            height: 200.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    languageModel(context).phoneAuthMessage,
                    style: grey14(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Row(
                      children:
                      [
                        Container(
                          height: 25.0,
                          width: 35.0,
                          padding: EdgeInsets.all(
                            10.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              3.0,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/egypt.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: TextFormField(
                            style: black14(),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: languageModel(context).phoneNumber,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[200],
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        3.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: () {
                      navigateAndFinish(
                        context,
                        HomeLayout(),
                      );
                    },
                    text: languageModel(context).sendCode,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  buttonWithIcon(
                    function: () {},
                    icon: 'assets/images/facebook.svg',
                    colorHex: '4267b2',
                    text: languageModel(context).loginFacebook,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
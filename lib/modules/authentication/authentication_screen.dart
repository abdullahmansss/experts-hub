import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi/layout/home_layout.dart';
import 'package:softagi/layout/home_layout_new.dart';
import 'package:softagi/modules/authentication/cubit/cubit.dart';
import 'package:softagi/modules/authentication/cubit/states.dart';
import 'package:softagi/shared/components/constants.dart';
import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/styles/icon_broken.dart';
import 'package:softagi/shared/styles/styles.dart';

class AuthenticationScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationCubit(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
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
                    height: 150.0,
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
                          if(!AuthenticationCubit.get(context).isCodeSent)
                            Container(
                            child: Row(
                              children: [
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
                                  child: defaultTextField(
                                    hint: languageModel(context).phoneNumber,
                                    type: TextInputType.number,
                                    context: context,
                                    validate: 'enter a valid phone number',
                                    onSubmit: (value)
                                    {
                                      if(formKey.currentState.validate())
                                      {
                                        AuthenticationCubit.get(context).sendCode(
                                          number: phoneController.text,
                                        );
                                      }
                                    },
                                    textEditingController: phoneController,
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
                          if(AuthenticationCubit.get(context).isCodeSent)
                            Container(
                            child: defaultTextField(
                              hint: languageModel(context).verificationCode,
                              type: TextInputType.number,
                              context: context,
                              validate: 'enter a valid verification code',
                              onSubmit: (value)
                              {
                                if(formKey.currentState.validate())
                                {
                                  AuthenticationCubit.get(context).phoneAuthentication(
                                    code: codeController.text,
                                    context: context,
                                  );
                                }
                              },
                              textEditingController: codeController,
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
                          if (state is! AuthenticationStateLoading)
                          defaultButton(
                            function: ()
                            {
                              if(formKey.currentState.validate())
                              {
                                if(AuthenticationCubit.get(context).isCodeSent)
                                {
                                  AuthenticationCubit.get(context).phoneAuthentication(
                                    code: codeController.text,
                                    context: context,
                                  );
                                } else
                                  {
                                    AuthenticationCubit.get(context).sendCode(
                                      number: phoneController.text,
                                    );
                                  }
                              }
                            },
                            text: AuthenticationCubit.get(context).isCodeSent ? languageModel(context).submit : languageModel(context).sendCode,
                          ),
                          if (state is AuthenticationStateLoading)
                            CircularProgressIndicator(),
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
            ),
          );
        },
      ),
    );
  }
}

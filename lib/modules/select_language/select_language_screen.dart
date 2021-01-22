import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softagi/shared/components/constants.dart';

import 'package:softagi/shared/cubit/cubit.dart';
import 'package:softagi/shared/styles/styles.dart';

class SelectLanguageScreen extends StatelessWidget
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 20.0,
              start: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsetsDirectional.only(
                    end: 20.0,
                    start: 20.0,
                  ),
                  itemBuilder: (context, index) => buildLanguageItem(
                    context: context,
                    model: languagesList[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount: languagesList.length,
                ),
                Image(
                  image: AssetImage(
                    'assets/images/paper.png',
                  ),
                  color: Colors.grey.withOpacity(
                    .2,
                  ),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
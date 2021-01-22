import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:softagi/modules/authentication/authentication_screen.dart';
import 'package:softagi/modules/select_language/select_language_screen.dart';
import 'package:softagi/shared/components/constants.dart';

import 'package:softagi/shared/cubit/cubit.dart';

class BoardModel
{
  final String image;
  final String title;
  final String body;

  BoardModel({this.image, this.title, this.body});
}

class OnBoardScreen extends StatefulWidget
{
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
{
  List<BoardModel> list;

  @override
  void initState()
  {
    super.initState();

    list =
    [
      BoardModel(
        image: 'assets/images/on_board_1.png',
        title: languageModel(context).b1title,
        body: languageModel(context).b1body,
      ),
      BoardModel(
        image: 'assets/images/on_board_1.png',
        title: languageModel(context).b2title,
        body: languageModel(context).b2body,
      ),
      BoardModel(
        image: 'assets/images/on_board_1.png',
        title: languageModel(context).b3title,
        body: languageModel(context).b3body,
      ),
    ];
  }

  var isLast = false;
  final controller = PageController();

  void submit()
  {
    navigateAndFinish(
      context,
      AuthenticationScreen(),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Directionality(
      textDirection: appDirection(context),
      child: Scaffold(
        appBar: DefaultAppBar(
          leadingIcon: IconButton(
            onPressed: ()
            {
              AppCubit.get(context).changeAppThemeMode();
            },
            icon: Icon(
              Icons.brightness_medium,
              color: mainColor,
            ),
          ),
          context: context,
          actions:
          [
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: ()
              {
                submit();
              },
              child: Text(
                languageModel(context).skip,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (i) {
                      if (i == (list.length - 1) && !isLast)
                        setState(() => isLast = true);
                      else if (isLast) setState(() => isLast = false);
                    },
                    controller: controller,
                    itemCount: list.length,
                    itemBuilder: (ctx, i) => Padding(
                      padding: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Image(
                              image: AssetImage(
                                list[i].image,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            list[i].title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w800,
                              color: mainColor,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            list[i].body,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SmoothPageIndicator(
                      controller: controller,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: mainColor,
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5.0,
                      ),
                      count: list.length,
                    ),
                    FloatingActionButton(
                      backgroundColor: mainColor,
                      onPressed: () {
                        if (isLast) {
                          submit();
                        } else
                          controller.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

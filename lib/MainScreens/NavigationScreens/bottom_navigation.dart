import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pbl/MainScreens/NavigationScreens/search_screen.dart';

import '../../constants.dart';
import '../home_page.dart';
import 'course_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final PageController _myPage = PageController(initialPage: 0);
  var curr_page = 0;

  _onPageViewChange(int page) {
    setState(() {});
    curr_page = page;
  }

  Color selected = Colors.indigo;
  Color not_selected = Colors.black;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight,
              child: PageView(
                controller: _myPage,
                physics: NeverScrollableScrollPhysics(),
                children: const <Widget>[
                  HomePage(),
                  SearchScreen(),
                  CoursesScreen(),
                ],
                onPageChanged: _onPageViewChange,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                    depth: 8,
                    lightSource: LightSource.bottomLeft,
                    color: Colors.white),
                child: Container(
                  // margin: EdgeInsets.all(16),
                  width: deviceWidth,
                  height: deviceHeight * 0.078,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      // bottomLeft: Radius.circular(32),
                      // bottomRight: Radius.circular(32),
                    ),
                    child: Container(
                      width: deviceWidth,
                      height: deviceHeight * 0.078,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          // bottomLeft: Radius.circular(32),
                          // bottomRight: Radius.circular(32),
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // Color.fromRGBO(229, 12, 23, 0),
                              // Colors.white,
                              kPrimaryColor,
                              kPrimaryColor
                            ]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _myPage.jumpToPage(0);
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      // Container(
                                      //   height: 22,
                                      //   width: 22,
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.only(
                                      //       topLeft: Radius.circular(6),
                                      //       topRight: Radius.circular(6),
                                      //       bottomLeft: Radius.circular(6),
                                      //       bottomRight: Radius.circular(6),
                                      //     ),
                                      //     color: Colors.transparent,
                                      //     image: DecorationImage(
                                      //         image: AssetImage(
                                      //             'assets/images/Image1.png'),
                                      //         fit: BoxFit.fitWidth),
                                      //   ),
                                      // ),
                                      Icon(
                                        Icons.home,
                                        color: curr_page == 0
                                            ? selected
                                            : not_selected,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Home',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: curr_page == 0
                                                ? selected
                                                : not_selected,
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: curr_page == 0
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _myPage.jumpToPage(1);
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: curr_page == 1
                                            ? selected
                                            : not_selected,
                                        size: 30,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Search',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: curr_page == 1
                                                ? selected
                                                : not_selected,
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: curr_page == 1
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _myPage.jumpToPage(2);
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.book_sharp,
                                        color: curr_page == 2
                                            ? selected
                                            : not_selected,
                                        size: 25,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Categories',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: curr_page == 2
                                                ? selected
                                                : not_selected,
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: curr_page == 2
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

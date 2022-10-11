import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pbl/model/course_tile.dart';

import '../constants.dart';

class CategoryCourse extends StatefulWidget {
  const CategoryCourse({Key? key}) : super(key: key);

  @override
  _CategoryCourseState createState() => _CategoryCourseState();
}

class _CategoryCourseState extends State<CategoryCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(.8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 35),
                    Container(
                      height: 50,
                      child: Stack(
                        children: [
                          Center(
                              child: Text(
                            'Learn CP',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          Positioned(
                            left: 20,
                            child: Hero(
                              tag: 'back',
                              child: Container(
                                height: 40,
                                width: 40,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    primary: kPrimaryColor,
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: SvgPicture.asset(
                                    "assets/icons/Back ICon.svg",
                                    height: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CourseTile(
                        photo: 'assets/images/Ellipse137.png',
                        name: 'Anthony Jones',
                        expertise: 'Music',
                        stars: '4.5',
                        price: '132'),
                    CourseTile(
                        photo: 'assets/images/Ellipse111.png',
                        name: 'Chris Taylor',
                        expertise: 'Music',
                        stars: '4.9',
                        price: '620'),
                    CourseTile(
                        photo: 'assets/images/Rectangle15.png',
                        name: 'Betty Davis',
                        expertise: 'Music',
                        stars: '3.5',
                        price: '189'),
                    CourseTile(
                        photo: 'assets/images/Rectangle69.png',
                        name: 'Anthony Jones',
                        expertise: 'Music',
                        stars: '4.5',
                        price: '132'),
                    CourseTile(
                        photo: 'assets/images/Rectangle14.png',
                        name: 'Chris Taylor',
                        expertise: 'Music',
                        stars: '4.9',
                        price: '620'),
                    CourseTile(
                        photo: 'assets/images/Rectangle12.png',
                        name: 'Betty Davis',
                        expertise: 'Music',
                        stars: '3.5',
                        price: '189'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

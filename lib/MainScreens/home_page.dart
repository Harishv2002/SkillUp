// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_full_image_screen/custom_full_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:pbl/model/card1.dart';
import 'package:pbl/model/card2.dart';

import '../constants.dart';
import 'category_course_page.dart';
import 'home_model/icn_btn_with_counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//Home, all Courses(Search), Fav, Chat, TopRight Notification

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController = new ScrollController();

  List<String> imgList = [
    'https://media.istockphoto.com/photos/young-man-studying-stock-photo-picture-id1286909296?b=1&k=20&m=1286909296&s=170667a&w=0&h=JjzVdeXTU8IhJq4NAFd5S8NQsHAkdhJQ1DJkEvyx1u8=',
    'https://images.unsplash.com/photo-1524069290683-0457abfe42c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3R1ZHklMjBpbmRpYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://media.istockphoto.com/photos/preparation-for-exam-stock-image-picture-id1025675048?b=1&k=20&m=1025675048&s=170667a&w=0&h=2G9cYzJCkdhMMeEv63buHjs4B6xlhEhV-mk8x71VkPM='
  ];

  final List<String> imgList2 = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  double offset = 0.0;

  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: _scrollViewController,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      width: deviceWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Welcome to one to one discussion!!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Here\'s a solution to all the problems',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(height: 25),
                          Container(
                            height: deviceWidth * .7,
                            width: deviceWidth * .9,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Lottie.asset(
                                'assets/images/79983-online-marketing-or-teaching.json'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                            items: imgList
                                .map((item) => Container(
                                      child: Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: ImageCachedFullscreen(
                                          imageBorderRadius: 10,
                                          imageUrl: item,
                                          imageWidth:
                                              MediaQuery.of(context).size.width,
                                          imageHeight: 320,
                                          imageDetailsHeight:
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          imageDetailsWidth:
                                              MediaQuery.of(context).size.width,
                                          // iconBackButtonColor: kGreenShadeColor,
                                          // hideBackButtonDetails: false,
                                          backgroundColorDetails:
                                              Color.fromRGBO(0, 0, 0, 0),
                                          imageDetailsFit: BoxFit.fitWidth,
                                          imageFit: BoxFit.cover,
                                          withHeroAnimation: false,
                                          placeholderDetails:
                                              CircularProgressIndicator(
                                                  color: Colors.white),
                                          placeholder:
                                              CircularProgressIndicator(
                                                  color: Colors.white),
                                          errorWidget: item == ''
                                              ? CircularProgressIndicator(
                                                  color: Colors.white)
                                              : Center(
                                                  child: Text(
                                                    'Unable to Load',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 32),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                                autoPlay: imgList.length <= 1 ? false : true,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                aspectRatio: 1.5,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                          imgList.length <= 1
                              ? Container()
                              : Positioned(
                                  bottom: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: imgList.map(
                                      (image) {
                                        int index = imgList.indexOf(image);
                                        return Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _current == index
                                                  ? kPrimaryColor
                                                  : Colors.white),
                                        );
                                      },
                                    ).toList(), // this was the part the I had to add
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best Tutors',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.black,
                                size: 16,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: deviceWidth,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card1(
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/test-1fdb6.appspot.com/o/images%2Fimg-profile.jpg?alt=media&token=632ec060-3b58-4965-9a3d-67784b4d9afd'),
                              Card1(
                                  img:
                                      'https://randomuser.me/api/portraits/women/32.jpg'),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card1(
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/test-1fdb6.appspot.com/o/images%2Fimg-0Hi1jDK1S4cLpwpuY66hC?alt=media&token=69b46e7a-f13a-45b3-9837-5ad21df8bdba'),
                              Card1(
                                  img:
                                      'https://firebasestorage.googleapis.com/v0/b/test-1fdb6.appspot.com/o/images%2Fimg-user-13.jpg?alt=media&token=54e67e0b-1f68-48ef-b44b-d79592aa4b74'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(int index) => Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoryCourse()));
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget appBar() {
    return Container(
      height: _showAppbar == true ? 110 : 110,
      child: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
            depth: 8,
            lightSource: LightSource.topLeft,
            color: Colors.white),
        child: Container(
          height: _showAppbar == true ? 215 : 110,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  // Color.fromRGBO(229, 12, 23, 0),
                  // Colors.white,
                  kPrimaryColor,
                  kPrimaryColor
                ]),
          ),
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            ZoomDrawer.of(context)!.toggle();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          child: Stack(
                            children: [
                              // // The text border
                              Text(
                                'SkillUP',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 5
                                    ..color = Colors.white,
                                ),
                              ),
                              // The text inside
                              Text(
                                'SkillUP',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            child: IconBtnWithCounter(
                              svgSrc: "assets/icons/Cart Icon.svg",
                              press: () {},
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 45,
                            height: 45,
                            child: IconBtnWithCounter(
                              svgSrc: "assets/icons/Bell.svg",
                              numOfitem: 3,
                              press: () {},
                            ),
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
    );
  }
}

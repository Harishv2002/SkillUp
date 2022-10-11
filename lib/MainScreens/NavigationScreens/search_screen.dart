import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pbl/model/search_recommendation.dart';
import 'package:pbl/model/searchfield.dart';

import '../../constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommended',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          SearchRecommendationModel(text: 'Caligraphy'),
                          SearchRecommendationModel(text: 'German'),
                          SearchRecommendationModel(text: 'English'),
                        ],
                      ),
                      Row(
                        children: [
                          SearchRecommendationModel(text: 'Painting'),
                          SearchRecommendationModel(text: 'Dance'),
                          SearchRecommendationModel(text: 'Yoga'),
                          SearchRecommendationModel(text: 'French'),
                        ],
                      ),
                      Row(
                        children: [
                          SearchRecommendationModel(text: 'Shlokas'),
                          SearchRecommendationModel(text: 'Music'),
                          SearchRecommendationModel(text: 'Chess'),
                        ],
                      ),
                      Row(
                        children: [
                          SearchRecommendationModel(text: 'Acting'),
                          SearchRecommendationModel(text: 'Dance'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      height: 170,
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
          height: 170,
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
                  kPrimaryColor.withOpacity(.7),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Search Courses/Tutors',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SearchField(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

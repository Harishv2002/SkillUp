import 'package:flutter/material.dart';

import '../constants.dart';
class SearchRecommendationModel extends StatefulWidget {
  const SearchRecommendationModel({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  _SearchRecommendationModelState createState() => _SearchRecommendationModelState();
}

class _SearchRecommendationModelState extends State<SearchRecommendationModel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor.withOpacity(.4),
          border: Border.all(
            color: Colors.black,
            width: 1.2,
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

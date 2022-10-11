import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pbl/MainScreens/home_model/icn_btn_with_counter.dart';

class LessonModel extends StatefulWidget {
  const LessonModel({Key? key}) : super(key: key);

  @override
  _LessonModelState createState() => _LessonModelState();
}

class _LessonModelState extends State<LessonModel> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: deviceWidth * .85,
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(.8)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/1432343177.svg',
                  height: 40,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          width: deviceWidth * .5,
                          child: Text(
                            'Construction of thr major scale on the Single String',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text('15 min'),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Container(
              width: 50,
              height: 50,
              child: IconBtnWithCounter(
                svgSrc: "assets/icons/Lock.svg",
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

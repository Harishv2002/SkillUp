import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pbl/MainScreens/course_detail_page.dart';

class CourseTile extends StatefulWidget {
  const CourseTile(
      {Key? key,
      required this.photo,
      required this.name,
      required this.expertise,
      required this.stars,
      required this.price})
      : super(key: key);

  final String photo, name, expertise, stars, price;

  @override
  _CourseTileState createState() => _CourseTileState();
}

class _CourseTileState extends State<CourseTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CourseDetailPage(
                  stars: widget.stars,
                  name: widget.name,
                  price: widget.price,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: MediaQuery.of(context).size.width * .9,
        height: 170,
        child: Neumorphic(
          style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              depth: 8,
              lightSource: LightSource.topLeft,
              color: Colors.white),
          child: Container(
            padding: EdgeInsets.only(right: 8),
            width: MediaQuery.of(context).size.width * .85,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                SizedBox(width: 10),
                Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment(
                              -2.735211000005005e-16, 1.123778223991394),
                          end: Alignment(
                              -1.123778223991394, 6.881157358895517e-17),
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0),
                            Color.fromRGBO(0, 0, 0, 1)
                          ]),
                      image: DecorationImage(
                          image: AssetImage('${widget.photo}'),
                          fit: BoxFit.cover),
                    )),
                SizedBox(width: 10),
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width * .85 - 130,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${widget.name}',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Expertise : ',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '${widget.expertise}',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Neumorphic(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(20)),
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: Colors.transparent),
                                child: Container(
                                  width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${widget.stars}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        '⭐',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Neumorphic(
                                style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(20)),
                                    depth: 8,
                                    lightSource: LightSource.topLeft,
                                    color: Colors.transparent),
                                child: Container(
                                  width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\$',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        '${widget.price}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

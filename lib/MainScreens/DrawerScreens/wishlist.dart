import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../constants.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: InkWell(
        onTap: () {
          ZoomDrawer.of(context)!.toggle();
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(.8),
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Wishlists Screen',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

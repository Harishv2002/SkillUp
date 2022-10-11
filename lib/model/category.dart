import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryModel extends StatefulWidget {
  const CategoryModel(
      {Key? key,
      required this.category,
      required this.icon,
      required this.selected})
      : super(key: key);

  final String category, icon;
  final bool selected;

  @override
  State<CategoryModel> createState() => _CategoryModelState();
}

class _CategoryModelState extends State<CategoryModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: widget.selected == true ? 10 : 8,
                sigmaX: widget.selected == true ? 10 : 8,
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: widget.selected == true
                      ? Colors.white.withOpacity(.6)
                      : Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: Colors.black,
                      width: 0.08,
                      style: BorderStyle.solid),
                ),
                child: Image.asset("assets/images/${widget.icon}.png"),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${widget.category}',
            style: TextStyle(
              fontSize: 15,
              color: widget.selected == true ? Colors.white : Colors.black,
              fontWeight:
                  widget.selected == true ? FontWeight.w900 : FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

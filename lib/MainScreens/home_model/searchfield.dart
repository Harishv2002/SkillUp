import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchFieldContainer extends StatelessWidget {
  const SearchFieldContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Text(
              'Search Product',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

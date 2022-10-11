import 'package:flutter/material.dart';
import 'package:pbl/MainScreens/DrawerScreens/drawer_model/menu_item.dart';

class MenuItems {
  static const navigation = MenuItem('Home', Icons.home);
  static const profile = MenuItem('Profile', Icons.account_circle);
  static const add = MenuItem('Become Tutor', Icons.add_circle_outline);
  static const wishlist = MenuItem('Wishlist', Icons.star);
  static const orders = MenuItem('My Courses', Icons.shopping_cart);
  static const settings = MenuItem('Settings', Icons.settings);
  static const logout = MenuItem('Logout', Icons.logout);
  static const customerSupport =
  MenuItem('Customer Support', Icons.support_agent);

  static const all = <MenuItem>[
    navigation,
    profile,
    wishlist,
    add,
    orders,
    settings,
    customerSupport,
    logout
  ];
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen(
      {Key? key, required this.currenItem, required this.onSelectedItem})
      : super(key: key);

  final MenuItem currenItem;
  final ValueChanged<MenuItem> onSelectedItem;

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Color(0xff2e3144),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Container(
              margin: EdgeInsets.only(left: 18),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_circle,
                color: Colors.grey.withOpacity(.8),
                size: 90,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 18),
              width: 150,
              child: Text(
                'Yash Sonawane',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) =>
      ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: widget.currenItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            widget.onSelectedItem(item);
          },
        ),
      );
}

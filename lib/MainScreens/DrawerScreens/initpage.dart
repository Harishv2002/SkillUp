import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pbl/MainScreens/DrawerScreens/drawer_screen.dart';
import 'package:pbl/MainScreens/DrawerScreens/profile.dart';
import 'package:pbl/MainScreens/DrawerScreens/become_a_tutor.dart';
import 'package:pbl/MainScreens/DrawerScreens/settings.dart';
import 'package:pbl/MainScreens/DrawerScreens/wishlist.dart';
import 'package:pbl/MainScreens/NavigationScreens/bottom_navigation.dart';

import 'customer_support.dart';
import 'drawer_model/menu_item.dart';
import 'logout.dart';
import 'my_orderes_screen.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  MenuItem currentItem = MenuItems.navigation;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.fastOutSlowIn,
      menuBackgroundColor: Color(0xff2e3144),
      borderRadius: 40,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.blueAccent,
      menuScreen: Builder(
        builder: (context) => DrawerScreen(
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
          currenItem: currentItem,
        ),
      ),
      mainScreen: getScreen(),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.navigation:
        return Navigation();
      case MenuItems.profile:
        return ProfileScreen();
      case MenuItems.wishlist:
        return WishlistScreen();
      case MenuItems.add:
        return BecomeTutorScreen();
      case MenuItems.orders:
        return MyOrders();
      case MenuItems.settings:
        return SettingsScreen();
      case MenuItems.customerSupport:
        return CustomerSupport();
      default:
        return Logout();
    }
  }
}

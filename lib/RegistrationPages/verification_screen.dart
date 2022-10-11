import 'package:flutter/material.dart';
import 'package:pbl/RegistrationPages/login_page.dart';
import 'package:pbl/RegistrationPages/registration_page.dart';

import '../constants.dart';

class MainRegistration extends StatefulWidget {
  const MainRegistration({Key? key}) : super(key: key);

  @override
  _MainRegistrationState createState() => _MainRegistrationState();
}

class _MainRegistrationState extends State<MainRegistration> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  width: 414,
                  height: deviceHeight * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/login_image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 414,
                  height: 40,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: TabBar(
                    isScrollable: false,
                    labelColor: black,
                    indicatorColor: black,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Lato',
                              fontSize: 18,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Regsiter',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Lato',
                              fontSize: 18,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(children: [
                    LoginPage(),
                    RegistrationPage(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

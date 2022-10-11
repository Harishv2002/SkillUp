import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pbl/MainScreens/DrawerScreens/initpage.dart';
import 'package:pbl/model/button1.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: deviceHeight * 0.05),
              TextField(
                textAlign: TextAlign.center,
                controller: email,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Email",
                ),
              ),
              SizedBox(height: deviceHeight * 0.015),
              TextField(
                obscureText: true, //For hidden text for password
                textAlign: TextAlign.center,
                controller: password,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Password",
                ),
              ),
              SizedBox(height: deviceHeight * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ForgotPass(),
                      //   ),
                      // );
                    },
                    child: Text(
                      'Forgot password?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Lato',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: deviceHeight * 0.05),
              InkWell(
                onTap: () {
                  if (email.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Enter Email",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  } else if (password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Enter PassWord",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  } else {
                    // setState(() {
                    //   showSpinner = true;
                    // });
                    // AuthenticationHelper()
                    //     .signIn(email: email.text, password: password.text)
                    //     .then(
                    //   (result) {
                    //     if (result == null) {
                    //       Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => GetUserData(),
                    //         ),
                    //       );
                    //     } else {
                    //       setState(() {
                    //         showSpinner = false;
                    //       });
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //           content: Text(
                    //             result,
                    //             style: TextStyle(fontSize: 16),
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     ;
                    //   },
                    // );
                    Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InitPage(),
                                ),
                              );
                  }
                },
                child: Button1(
                  name: 'LOGIN',
                  width: deviceWidth * 0.9,
                ),
              ),
              SizedBox(height: deviceHeight * 0.05),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const [
              //     Text(
              //       'OR',
              //       textAlign: TextAlign.left,
              //       style: TextStyle(
              //           color: Color.fromRGBO(0, 0, 0, 1),
              //           fontFamily: 'Lato',
              //           fontSize: 18,
              //           letterSpacing:
              //               0 /*percentages not used in flutter. defaulting to zero*/,
              //           fontWeight: FontWeight.bold,
              //           height: 1),
              //     )
              //   ],
              // ),
              SizedBox(height: deviceHeight * 0.08),
              // // Padding(
              // //   padding: const EdgeInsets.symmetric(horizontal: 20),
              // //   child: Row(
              // //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // //     children: const [
              // //       IconButton1(icons: 'assets/images/fb_icon.png'),
              // //       IconButton1(icons: 'assets/images/google_icon.png'),
              // //     ],
              // //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

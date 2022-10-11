import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pbl/model/button1.dart';

import '../constants.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showSpinner = false;
  bool flag = true;

  var array = <Map>[];

  // Future getData(String username) async {
  // final QuerySnapshot result =
  //     await FirebaseFirestore.instance.collection('Users').get();
  // final List<DocumentSnapshot> documents = result.docs;

  // Iterate through all the Documents
  //   documents.forEach((data) {
  //     bool docStatus = data.exists;
  //     if (docStatus == true) {
  //       array.add(data['Info']);
  //       if (data['Info']['Username'] == username) {
  //         flag = false;
  //         print("Username already present ${flag}");
  //       }
  //     }
  //     // print(array);
  //     UserDetails.array = array.cast<Map<String, Object>>();
  //   });
  // }

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
                controller: fullName,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Full Name",
                ),
              ),
              SizedBox(height: deviceHeight * 0.015),
              TextField(
                controller: userName,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "UserName",
                ),
              ),
              SizedBox(height: deviceHeight * 0.015),
              TextField(
                controller: email,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Email",
                ),
              ),
              SizedBox(height: deviceHeight * 0.015),
              TextField(
                controller: password,
                obscureText: true, //For hidden text for password
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: "Password",
                ),
              ),
              SizedBox(height: deviceHeight * 0.05),
              InkWell(
                onTap: () async {
                  if (fullName.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Enter Full Name",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  } else if (userName.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Enter User Name",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  } else if (email.text.isEmpty) {
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
                    // flag = true;
                    // setState(() {
                    //   showSpinner = true;
                    // });
                    // await getData(userName.text).then((value) {
                    //   // print(flag);
                    //   if (flag == true) {
                    //     AuthenticationHelper()
                    //         .signUp(email: email.text, password: password.text)
                    //         .then(
                    //       (result) {
                    //         if (result == null) {
                    //           Navigator.pushReplacement(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => StoreRegisterData(
                    //                 name: fullName.text,
                    //                 username: userName.text,
                    //               ),
                    //             ),
                    //           );
                    //         } else {
                    //           setState(() {
                    //             showSpinner = false;
                    //           });
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //             SnackBar(
                    //               content: Text(
                    //                 result,
                    //                 style: TextStyle(fontSize: 16),
                    //               ),
                    //             ),
                    //           );
                    //         }
                    //       },
                    //     );
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text(
                    //           "Username ${userName.text} already Exists",
                    //           style: TextStyle(fontSize: 16),
                    //         ),
                    //       ),
                    //     );
                    //     print("Error");
                    //     setState(() {
                    //       showSpinner = false;
                    //     });
                    //   }
                    // });
                  }
                },
                child: Button1(
                  name: 'REGISTER',
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
              SizedBox(height: deviceHeight * 0.06),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: const [
              //       IconButton1(icons: 'assets/images/fb_icon.png'),
              //       IconButton1(icons: 'assets/images/google_icon.png'),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

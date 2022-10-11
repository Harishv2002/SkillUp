import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pbl/model/button1.dart';
import '../../constants.dart';

class BecomeTutorScreen extends StatefulWidget {
  const BecomeTutorScreen({Key? key}) : super(key: key);

  @override
  _BecomeTutorScreenState createState() => _BecomeTutorScreenState();
}

class _BecomeTutorScreenState extends State<BecomeTutorScreen> {
  TextEditingController tagLine = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController location = TextEditingController();
  bool showSpinner = false;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  var _date, d12;
  String imageUrl = "";
  String bgimageUrl = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.black.withOpacity(.7),
              onPrimary: Colors.white,
              surface: pink.withOpacity(.7),
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date = DateTime.fromMicrosecondsSinceEpoch(
            selectedDate.microsecondsSinceEpoch);
        dob.text = DateFormat('dd/MM/yyyy').format(_date); // 12/31/2000,
        // UserDetails.dob = dob.text;
      });
  }

  //Photos
  late File _pickedImage;
  var isPicked = false;

  void _pickImage() async {
    ImagePicker imagePicker = new ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );
    // await _cropImage1(pickedImageFile!.path);
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
      isPicked = true;
    });
  }

  late File _pickedImage2;
  var isPicked2 = false;

  void _pickImage2() async {
    ImagePicker imagePicker = new ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage2 = File(pickedImageFile!.path);
      isPicked2 = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // fullName.text = UserDetails.name!;
    // tagLine.text = UserDetails.tagLine!;
    // profession.text = UserDetails.profession!;
    // dob.text = UserDetails.dob!;
    // location.text = UserDetails.location!;
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: deviceWidth,
                height: 70,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.pink,
                      onTap: () {
                        ZoomDrawer.of(context)!.toggle();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * .23,
                    ),
                    Text(
                      'Become A Tutor',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: 'Lato',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: deviceHeight * 0.30,
                          width: deviceWidth,
                          child: Stack(
                            children: [
                              Container(
                                width: deviceWidth,
                                height: deviceHeight * 0.25,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(196, 196, 196, 1),
                                  // image: DecorationImage(
                                  //     image: AssetImage(
                                  //         'assets/images/Rectangle10 (1).png'),
                                  //     fit: BoxFit.fitWidth),
                                  image: DecorationImage(
                                    image: isPicked2
                                        ? FileImage(_pickedImage2)
                                            as ImageProvider
                                        : CachedNetworkImageProvider(
                                            "https://media-exp1.licdn.com/dms/image/C4E16AQHyFwArhlaMCw/profile-displaybackgroundimage-shrink_350_1400/0/1631037950013?e=2147483647&v=beta&t=qKGzZYhX7PUa1OuqS0rHg0xV4kmInMNfLpzXAYcOhdw"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 125,
                                        height: 122,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(196, 196, 196, 1),
                                          image: DecorationImage(
                                            image: isPicked
                                                ? FileImage(_pickedImage)
                                                    as ImageProvider
                                                : CachedNetworkImageProvider(
                                                    "https://www.pngall.com/wp-content/uploads/5/Profile-Transparent.png"),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(125, 122)),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: -15,
                                        child: InkWell(
                                          onTap: () {
                                            _pickImage();
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 16, bottom: 10),
                                            width: 35,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(125, 122)),
                                            ),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    _pickImage2();
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 16, bottom: 60),
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(125, 122)),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: deviceHeight * 0.01),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                              SizedBox(height: deviceHeight * 0.01),
                              TextField(
                                controller: fullName..text,
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: "Full Name",
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.02),
                              Text(
                                'TagLine',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                              SizedBox(height: deviceHeight * 0.01),
                              TextField(
                                controller: tagLine..text,
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: "TagLine",
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.02),
                              Text(
                                'Profession',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                              SizedBox(height: deviceHeight * 0.01),
                              TextField(
                                controller: profession..text,
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: "Profession",
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.02),
                              Text(
                                'DOB',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Lato',
                                    fontSize: 18,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                              SizedBox(height: deviceHeight * 0.01),
                              InkWell(
                                onTap: () async {
                                  _selectDate(context);
                                },
                                child: Container(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "04-04-22",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(Icons.calendar_today)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.02),
                              // CSCPicker(
                              //   onCountryChanged: (value) {
                              //     setState(() {
                              //       // countryValue = value;
                              //     });
                              //   },
                              //   onStateChanged: (value) {
                              //     setState(() {
                              //       // stateValue = value;
                              //     });
                              //   },
                              //   onCityChanged: (value) {
                              //     setState(() {
                              //       // stateValue = value;
                              //     });
                              //   },
                              // ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Location',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Lato',
                                      fontSize: 18,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.01),
                              TextField(
                                controller: location..text,
                                textAlign: TextAlign.left,
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: "Location",
                                ),
                              ),
                              SizedBox(height: deviceHeight * 0.03),
                              InkWell(
                                onTap: () async {
                                  // setState(() {
                                  //   showSpinner = true;
                                  // });
                                  // UserDetails.name = fullName.text;
                                  // UserDetails.tagLine = tagLine.text;
                                  // UserDetails.profession = profession.text;
                                  // UserDetails.dob = dob.text;
                                  // UserDetails.location = location.text;
                                  //
                                  // if (isPicked) {
                                  //   var time = DateTime.now()
                                  //       .millisecondsSinceEpoch
                                  //       .toString();
                                  //   firebase_storage.Reference ref =
                                  //   firebase_storage
                                  //       .FirebaseStorage.instance
                                  //       .ref()
                                  //       .child('UserProfileImage')
                                  //       .child('$time');
                                  //
                                  //   await ref.putFile(_pickedImage);
                                  //   imageUrl = await ref.getDownloadURL();
                                  // }
                                  //
                                  // if (isPicked2) {
                                  //   var time = DateTime.now()
                                  //       .millisecondsSinceEpoch
                                  //       .toString();
                                  //   firebase_storage.Reference ref =
                                  //   firebase_storage
                                  //       .FirebaseStorage.instance
                                  //       .ref()
                                  //       .child('UserBgImage')
                                  //       .child('$time');
                                  //
                                  //   await ref.putFile(_pickedImage2);
                                  //   bgimageUrl = await ref.getDownloadURL();
                                  // }
                                  //
                                  // UserDetails.profilePhotoUrl = imageUrl;
                                  // UserDetails.bgPhotoUrl = bgimageUrl;
                                  //
                                  // await AuthenticationHelper()
                                  //     .updateUserDetails(
                                  //     fullName.text,
                                  //     tagLine.text,
                                  //     profession.text,
                                  //     dob.text,
                                  //     location.text,
                                  //     imageUrl,
                                  //     bgimageUrl)
                                  //     .then(
                                  //       (value) => {
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(
                                  //       SnackBar(
                                  //         content: Text(
                                  //           "User Details Updated",
                                  //           style:
                                  //           TextStyle(fontSize: 16),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Navigator.pushAndRemoveUntil(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               HomePage(),
                                  //         ),
                                  //             (route) => false),
                                  //   },
                                  // );
                                },
                                child: Button1(
                                  name: 'UPDATE',
                                  width: deviceWidth * 0.9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

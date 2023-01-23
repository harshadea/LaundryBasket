import 'package:anywash/home/bottom.dart';
import 'package:anywash/login_password/login.dart';
import 'package:anywash/utils/reusableTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/custombutton.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController emailTextController = TextEditingController();
    TextEditingController nameTextController = TextEditingController();
    TextEditingController phoneTextController = TextEditingController();
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Row(
              children: [
                SizedBox(
                  height: height / 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                              color: const Color(0xfff1f5f6), width: 2),
                          color: Colors.transparent,
                        ),
                        height: height / 19,
                        width: width / 8,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: notifire.getdarkscolor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              "image/login.png",
              height: height / 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomStrings.signup,
                        style: TextStyle(
                            fontFamily: 'Gilroy Bold',
                            color: notifire.getdarkscolor,
                            fontSize: height / 25),
                      ),
                    ],
                  ),
                ],
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const Text(
                   'Email Address',
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                 ),
                const SizedBox(height: 10),
                 reusableTextField("Enter Your Email Address",
                     Icons.email_outlined, false, emailTextController),
                 const SizedBox(height: 15),
                 const Text(
                   'Full Name',
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                 ),
                 const SizedBox(height: 15),
                 reusableTextField("Enter Your Full Name",
                     Icons.person, false, nameTextController),
                 const SizedBox(height: 15),
                 const Text(
                   'Mobile',
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                 ),
                 const SizedBox(height: 15),
                 reusableTextField("Enter Your Email Address",
                     Icons.phone, false, phoneTextController),
                 const SizedBox(height: 15),
               ],
             ),
           ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.by,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: Colors.grey,
                        fontSize: height / 60),
                  ),
                  Text(
                    CustomStrings.tc,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: notifire.getprocolor,
                        fontSize: height / 60),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.and,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: Colors.grey,
                        fontSize: height / 60),
                  ),
                  Text(
                    CustomStrings.pri,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: notifire.getprocolor,
                        fontSize: height / 60),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                  onTap: () {
                    Get.to(
                      const Bottom(),
                    );
                  },
                  child: Custombutton.button(
                      notifire.getprocolor, CustomStrings.continues, width)),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CustomStrings.use,
                  style: TextStyle(
                      fontFamily: 'Gilroy Medium',
                      color: Colors.grey,
                      fontSize: height / 50),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Login(),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      CustomStrings.login,
                      style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: notifire.getprocolor,
                          fontSize: height / 50),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

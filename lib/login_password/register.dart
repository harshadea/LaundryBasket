import 'package:anywash/login_password/login.dart';
import 'package:anywash/utils/color.dart';
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
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height / 20),
            Row(
              children: [
                SizedBox(height: height / 20),
                SizedBox(width: width / 20),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Card(
                      elevation: 5,
                        child: SizedBox(
                          height: 33,
                            width: 33,
                            child: Icon(Icons.arrow_back_ios_outlined)))),
              ],
            ),
            Center(
              child: Image.asset("image/login.png", height: height / 4),
            ),
            const SizedBox(height: 22),
            Center(
              child: Text(CustomStrings.signup,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: height / 25)),
            ),
            SizedBox(height: height / 30),
            const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text('Your Name',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Card(
                  elevation: 5,
                  color: colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your Name',
                            prefixIcon: Icon(Icons.person, color: colors.green),
                            fillColor: colors.grey)),
                  )),
            ),
            SizedBox(height: height / 44),
            const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text('Email Address',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Card(
                  elevation: 5,
                  color: colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.email_outlined, color: colors.green),
                            hintText: 'Email',
                            fillColor: colors.grey)),
                  )),
            ),
            SizedBox(height: height / 44),
            const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text('Mobile',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Card(
                  elevation: 5,
                  color: colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mobile',
                            prefixText: '+91',
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: colors.green,
                            ),
                            fillColor: colors.grey)),
                  )),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CustomStrings.by,
                    style: TextStyle(fontSize: height / 60),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CustomStrings.tc,
                    style:
                        TextStyle(color: colors.green, fontSize: height / 60),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    CustomStrings.and,
                    style: TextStyle(
                        fontSize: height / 60),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    CustomStrings.pri,
                    style:
                        TextStyle(color: colors.green, fontSize: height / 60),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                  onTap: () {
                    Get.to(
                      const Login(),
                    );
                  },
                  child: Custombutton.button(
                      Colors.green.shade500, CustomStrings.register, width)),
            ),
            SizedBox(
              height: height / 66,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CustomStrings.use,
                  style: TextStyle(fontSize: height / 50),
                ),
                const SizedBox(width: 5),
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
                      style:
                          TextStyle(color: colors.green, fontSize: height / 50),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33)
          ],
        ),
      ),
    );
  }
}

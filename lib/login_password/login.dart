import 'package:anywash/login_password/forgot.dart';
import 'package:anywash/login_password/otp.dart';
import 'package:anywash/login_password/register.dart';
import 'package:anywash/utils/reusableTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/custombutton.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

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

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 13,
            ),
            Image.asset("image/login.png", height: height / 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomStrings.login,
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
            SizedBox(
              height: height / 30,
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
                  const SizedBox(height: 15),
                  reusableTextField("Enter Your Email Address",
                      Icons.email_outlined, false, emailTextController),
                  const SizedBox(height: 15),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 15),
                  reusableTextField("Password",
                      Icons.lock_open, false, passwordTextController),

                ],
              ),
            ),
            SizedBox(height: height / 60),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Forgot(),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      CustomStrings.forgot,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: notifire.getprocolor,
                          fontSize: height / 50),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Otp();
                      },
                    ),
                  );
                },
                child: Custombutton.button(
                    notifire.getprocolor, CustomStrings.login, width),
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Text(
              "OR",
              style: TextStyle(
                  fontFamily: 'Gilroy Medium',
                  color: Colors.grey,
                  fontSize: height / 50),
            ),
            SizedBox(
              height: height / 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  // child: MaterialButton(
                  //   onPressed: () {
                  //     // _googleSignIn.signIn();
                  //   },
                  child: SvgPicture.asset(
                    'image/icons8-google (2).svg',
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      'image/icons8-apple-logo.svg',
                    )),
                const SizedBox(width: 15),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      'image/icons8-twitter.svg',
                    )),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CustomStrings.newto,
                  style: TextStyle(
                      fontFamily: 'Gilroy Medium',
                      color: Colors.grey,
                      fontSize: height / 50),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Register(),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      CustomStrings.register,
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

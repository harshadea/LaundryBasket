import 'package:anywash/home/bottom.dart';
import 'package:anywash/login_password/register.dart';
import 'package:anywash/utils/color.dart';
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
          children: [
            SizedBox(
              height: height / 13,
            ),
            Image.asset(
              "image/login.png",
              height: height / 4,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        CustomStrings.login,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: height / 25),
                      )
                    ])),
            SizedBox(height: height / 30),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                    elevation: 5,
                    color: colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email / Mobile',
                              fillColor: colors.grey)),
                    ))),
            SizedBox(height: height / 15),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 15),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Bottom();
                            // return const Otp();
                          },
                        ),
                      );
                    },
                    child: Custombutton.button(
                        Colors.green.shade500, CustomStrings.login, width))),
            SizedBox(height: height / 55),
            Text("Or Sign in with Social Account",
                style: TextStyle(color: colors.grey, fontSize: height / 60)),
            SizedBox(height: height / 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    // child: MaterialButton(
                    //   onPressed: () {
                    //     // _googleSignIn.signIn();
                    //   },
                    child: SvgPicture.asset(
                      'image/icons8-google (2).svg',
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                      'image/icons8-apple-logo.svg',
                    )),),
                const SizedBox(width: 15),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child:  SvgPicture.asset(
                      'image/icons8-twitter.svg',
                    ))),
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
                      fontSize: height / 50),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const Register(),
                    );
                  },
                  child: Text(
                    CustomStrings.register,
                    style: TextStyle(
                        fontFamily: 'Gilroy Medium',
                        color: colors.green,
                        fontSize: height / 50),
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

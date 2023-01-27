import 'package:anywash/home/constants/home_header.dart';
import 'package:anywash/home/home_controller/home_controller.dart';
import 'package:anywash/utils/color.dart';
import 'package:anywash/utils/string.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../view/categories.dart';
import '../view/popular.dart';
import '../view/recommended.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ColorNotifire notifire;
  final PageController _pageController = PageController(initialPage: 0);

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

  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height / 22),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: HomeHeader(),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 28),
            child: Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 1,
                  child: SizedBox(
                    height: height / 18,
                    width: width / 1.35,
                    child: const Center(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: colors.green,
                            size: 33,
                          ),
                          hintText: "Laundry Shop",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                Card(
                  elevation: 1,
                  child: Container(
                    height: height / 18,
                    width: width / 8,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(width / 30),
                        child: Image.asset(
                          "image/filter.png",
                          color: colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'Got delivered',
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: height / 50,),
                        ),
                        SizedBox(width: width / 20),
                        const Text('everything you need',
                            style: TextStyle(color: colors.grey,fontSize: 15)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 5,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlayCurve: Curves.decelerate,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 1000),
                                aspectRatio: 2,
                                viewportFraction: 1),
                            items: controller.banners.map((item) {
                              return Image.asset(item, fit: BoxFit.contain);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Row(children: [
                        Text(
                          CustomStrings.allcat,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height / 50,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Get.to(
                                const Categories(),
                              );
                            },
                            child: Center(
                                child: Text(CustomStrings.view,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 50,
                                    ))))
                      ])),
                  SizedBox(
                    height: height / 50,
                  ),
                   SizedBox(width: width / 5),
                  Row(children: [
                    games("image/cleans1.png", CustomStrings.cleaning,
                        height / 18),
                    SizedBox(width: width / 45),
                    games("image/cleans2.png", CustomStrings.plumbing,
                        height / 18),
                    SizedBox(width: width / 45),
                    games("image/cleans3.png", CustomStrings.laundrys,
                        height / 18),
                    SizedBox(width: width / 45),
                  ]),
                   SizedBox(height: height / 45),
                  Row(children: [
                    games("image/cleans4.png", CustomStrings.carwash,
                        height / 16),
                    SizedBox(width: width / 40),
                    games("image/cleans5.png", CustomStrings.starching,
                        height / 16),
                    SizedBox(width: width / 40),
                    games("image/cleans1.png", CustomStrings.laundrys,
                        height / 16),
                    SizedBox(width: width / 40)
                  ]),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Text(
                          'OFFERS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 22, 5),
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 5.5,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlayCurve: Curves.decelerate,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 1000),
                                aspectRatio: 2,
                                viewportFraction: 1),
                            items: controller.banners.map((item) {
                              return Image.asset(item, fit: BoxFit.contain);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    CustomStrings.recommended,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: height / 50,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 200,
                              ),
                              Text(
                                CustomStrings.based,
                                style: TextStyle(
                                  fontSize: height / 66,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            Get.to(
                              const Recommended(),
                            );
                          },
                          child: SizedBox(
                              height: height / 20,
                              child: Center(
                                  child: Text(CustomStrings.view,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: height / 50))))),
                      SizedBox(width: width / 20),
                    ],
                  ),
                  SizedBox(height: height / 30),
                  recommended("image/wash1.png", CustomStrings.cl),
                  SizedBox(height: height / 30),
                  recommended("image/wash2.png", CustomStrings.cpl),
                  SizedBox(height: height / 30),
                  recommended("image/wash3.png", CustomStrings.sl),
                  SizedBox(height: height / 80),
                  recommended("image/wash4.png", CustomStrings.cc),
                  SizedBox(height: height / 80),
                  recommended("image/wash5.png", CustomStrings.cpl),
                  SizedBox(height: height / 30),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlayCurve: Curves.decelerate,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1000),
                              aspectRatio: 2,
                              viewportFraction: 1),
                          items: controller.banners.map((item) {
                            return Image.asset(item, fit: BoxFit.contain);
                          }).toList())),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Row(
                      children: [
                        Text(CustomStrings.popular,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height / 50)),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Get.to(const Popular());
                            },
                            child: Container(
                                height: height / 20,
                                color: Colors.transparent,
                                child: Center(
                                    child: Text(CustomStrings.view,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 50)))))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          events("image/wash4.png", const Color(0xfff5f3ff),
                              CustomStrings.rebel),
                          SizedBox(
                            width: width / 30,
                          ),
                          events("image/wash5.png", const Color(0xffecf8fd),
                              CustomStrings.laughing),
                          SizedBox(
                            width: width / 30,
                          ),
                          events("image/wash6.png", const Color(0xffeef5ee),
                              CustomStrings.silly),
                          SizedBox(
                            width: width / 30,
                          ),
                          events("image/wash4.png", const Color(0xfff5f3ff),
                              CustomStrings.hearts),
                          SizedBox(
                            width: width / 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget recommended(img, name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const Details(),
            ),
          );
        },
        child: Container(
          height: height / 8,
          width: width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: const Offset(4, 4)),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(width / 20),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 25),
                child: Container(
                  width: width / 5,
                  height: height / 11,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(width / 20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: width / 25,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getdarkscolor,
                      fontSize: height / 50,
                    ),
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "image/location.png",
                        height: height / 45,
                        color: Colors.grey,
                      ),
                      Text(
                        CustomStrings.location,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "image/time.png",
                        height: height / 50,
                        color: Colors.grey,
                      ),
                      Text(
                        CustomStrings.time,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                      Icon(
                        Icons.star,
                        color: const Color(0xfffdc500),
                        size: height / 50,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget events(img, clr, name) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: const Details()),
            );
          },
          child: Card(
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            color: notifire.getprimerycolor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 6,
                    width: width / 2,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 40),
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkscolor,
                        fontSize: height / 45,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height / 120),
                  Row(
                    children: [
                      Image.asset(
                        "image/location.png",
                        height: height / 45,
                        color: Colors.grey,
                      ),
                      Text(
                        CustomStrings.location,
                        style: TextStyle(
                            fontFamily: 'Gilroy Medium',
                            color: Colors.grey,
                            fontSize: height / 60),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 100),
                  Row(
                    children: [
                      Image.asset(
                        "image/time.png",
                        height: height / 50,
                        color: Colors.grey,
                      ),
                      Text(
                        CustomStrings.time,
                        style: TextStyle(
                            fontFamily: 'Gilroy Medium',
                            color: Colors.grey,
                            fontSize: height / 60),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget games(img, name, siz) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GestureDetector(
            onTap: () {
              Get.to(
                const Recommended(),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(2, 2)),
                    ]),
                height: height / 7.5,
                width: width / 3.8,
                child: Column(
                  children: [
                    SizedBox(height: height / 100),
                    Image.asset(
                      img,
                      height: siz,
                    ),
                    SizedBox(height: height / 50),
                    Center(
                      child: Text(
                        name,
                        style: TextStyle(
                            color: notifire.getdarkscolor, fontSize: height / 50),
                      ),
                    ),
                    SizedBox(height: height / 100),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

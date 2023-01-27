import 'package:anywash/profile/address.dart';
import 'package:anywash/profile/notification.dart';
import 'package:anywash/utils/media.dart';
import 'package:anywash/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const SizedBox(width: 10),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),
        height: height / 22,
        width: width / 10,
        child: Padding(
          padding: EdgeInsets.all(width / 60),
          child: Image.asset("image/loc.png", color: Colors.green.shade400),
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.to(const AddressUpdates());
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height / 22,
                width: width / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Home',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
      const Spacer(),
      const SizedBox(width: 10),
      GestureDetector(
          onTap: () {
            Get.to(const Notifications(CustomStrings.notification));
          },
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey.shade400,
                  //       blurRadius: 3,
                  //       spreadRadius: 1,
                  //       offset: const Offset(4, 4))
                  // ],
                ),
                height: height / 22,
                width: width / 10,
                child: Padding(
                    padding: EdgeInsets.all(width / 50),
                    child: Icon(Icons.notifications_none,
                        color: Colors.green.shade400))),
          )),
      SizedBox(width: width / 20)
    ]);
  }
}

import 'package:anywash/login_password/login.dart';
import 'package:anywash/order/order.dart';
import 'package:anywash/profile/address.dart';
import 'package:anywash/utils/color.dart';
import 'package:anywash/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 44),
          const Center(
              child: Text('My Account',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const SizedBox(height: 15),
          Stack(
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: AssetImage('image/dp.png'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green.shade400,
                    ),
                    child:
                        const Icon(Icons.edit, size: 15, color: colors.white),
                  ))
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'test',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Text(
            '9876543210',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 5),
          const Text('test123@gmail.com', style: TextStyle(fontSize: 15)),
          const SizedBox(height: 10),
          Container(
            width: width / 1.1,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  width: width / 1.1,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.green.shade400,
                                  size: 22,
                                ),
                              )),
                          const SizedBox(width: 20),
                          const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                'Saved Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(),
                          IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 18),
                              onPressed: () {
                                Get.to(() => const AddressUpdates());
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.green.shade400,
                                  size: 22,
                                ),
                              )),
                          const SizedBox(width: 20),
                          const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                'My Orders',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(),
                          IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 18),
                              onPressed: () {
                                Get.to(() => const Order());
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.telegram,
                                  color: Colors.green.shade400,
                                  size: 33,
                                ),
                              )),
                          const SizedBox(width: 20),
                          const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                'Support',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(),
                          IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 18),
                              onPressed: () {})
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.green.shade400,
                                  size: 22,
                                ),
                              )),
                          const SizedBox(width: 20),
                          const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(),
                          IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 18),
                              onPressed: () {})
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.terminal_sharp,
                                  color: Colors.green.shade400,
                                  size: 22,
                                ),
                              )),
                          const SizedBox(width: 20),
                          const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(),
                          IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 18),
                              onPressed: () {})
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.green.shade400,
                                  size: 22,
                                ),
                              )),
                          const SizedBox(width: 20),
                          const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                'Sign Out',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                          const Spacer(),
                          IconButton(
                              icon: const Icon(Icons.arrow_forward_ios,
                                  size: 18),
                              onPressed: () {
                                Get.to(() => const Login());
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

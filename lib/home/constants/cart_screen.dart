import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const  SizedBox(height: 55),
            Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child:const SizedBox(
                  height: 33,
                  width: 166,
                  child:  Center(
                    child: Text('Cart Screen',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardTest extends StatelessWidget {
  const CardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300,
          child: Card(
            color: Colors.amber,
            elevation: 10,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.all(Radius.circular(20)),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            margin: EdgeInsets.all(32),
            child: Padding(padding: EdgeInsets.all(8.0), child: Text('data')),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'first_screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => FirstScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0672CB),
      body: Column(
        children: [
          // logo here

          SizedBox(
            height: 200,
          ),
          Container(
            // color: Colors.red,
            height: 200,
            width: 200,
            child: Image.asset('assets/second_img.png'),
          ),

          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // color: Colors.red,
              height: 150,
              width: 150,
              child: Image.asset('assets/SyngyMaxmim.png'),
            ),
          ),
        ],
      ),
    );
  }
}

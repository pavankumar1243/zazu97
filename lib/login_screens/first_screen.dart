import 'package:flutter/material.dart';
import 'package:zazu99/login_screens/user_merchant_select.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17, bottom: 25),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.94,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserMerchantSelect()),
                );
              },
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFF0672CB),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.59,
            height: MediaQuery.of(context).size.height * 0.195,
            child: Image.asset('assets/Logo3(1).png'),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0, right: 17),
            child: Container(
              width: MediaQuery.of(context).size.width * 7,
              height: MediaQuery.of(context).size.height * 0.43,
              child: Image.asset('assets/onboardingpage2.png'),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Center(
                child: Text(
              "Lorem ipsum dolor sit amet, consectetuer ",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zazu99/login_screens/user_login.dart';

class UserMerchantSelect extends StatefulWidget {
  const UserMerchantSelect({Key? key}) : super(key: key);

  @override
  State<UserMerchantSelect> createState() => _UserMerchantSelectState();
}

class _UserMerchantSelectState extends State<UserMerchantSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 100),
            Container(
              // color: Colors.blue,
              width: MediaQuery.of(context).size.width * 8,
              height: MediaQuery.of(context).size.height * 0.13,
              child: Image.asset('assets/roundlogo3.png'),
            ),
            // SizedBox(height: 15,),
            SizedBox(height: 60),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserLogIn()),//UserLogIn
                );
              },
              child: Container(
                // color: Colors.blue,
                width: MediaQuery.of(context).size.width * 8,
                height: MediaQuery.of(context).size.height * 0.23,
                child: Image.asset('assets/User.png'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Home(sortedReportList: [])),
                // );
              },
              child: Container(
                // color: Colors.blue,
                width: MediaQuery.of(context).size.width * 8,
                height: MediaQuery.of(context).size.height * 0.23,
                child: Image.asset('assets/merchant.png'),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

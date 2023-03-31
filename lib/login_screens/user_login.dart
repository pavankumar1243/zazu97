import 'dart:ui';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zazu99/login_screens/user_otp.dart';
import 'package:zazu99/login_screens/user_register.dart';

class UserLogIn extends StatefulWidget {
  const UserLogIn({Key? key}) : super(key: key);

  @override
  State<UserLogIn> createState() => _UserLogInState();
}

class _UserLogInState extends State<UserLogIn> {
  bool isButtonActive = false;
  bool isButtonEnabled = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset('assets/SyngyMaxmim.png'),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 35),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                alignment: Alignment.center,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_sharp,
                      size: 20, color: Color(0xFF0672CB)),
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10,
                    ),
                    BoxShadow(color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.13,
            child: Image.asset(
              'assets/roundlogo3.png',
            ),
          ),
          SizedBox(height: 25),
          Container(
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0672CB)),
            ),
          ),
          SizedBox(height: 18),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 17),
              child: Container(
                child: Text(
                  "Mobile Number",
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 1.0, right: 17, left: 17, top: 8),
            child: IntlPhoneField(
              disableLengthCheck: false,
              decoration: InputDecoration(
                hintText: 'Enter your mobile number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
              controller: controller,
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.94,
            child: ElevatedButton(
              onPressed: isButtonActive
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserOtp()),
                );
              }
                  : null,
              child: Text(
                'Login with OTP',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: isButtonActive ? Colors.white : Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  isButtonActive ? Colors.blue : Color(0x32595980), // use ternary operator to set background color
                ),
               ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 2,
                    margin: EdgeInsets.all(15),
                    // margin: CustomPaddings.horizontal(),
                  ),
                ),
                Text(
                  "Let’s Sign in with",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 2,
                    margin: EdgeInsets.all(15),
                    // margin: CustomPaddings.horizontal(),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                    child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF0672CB)),
                  ),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 46,
                          width: 25,
                          child: Image.asset("assets/glogo.png"),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'GOOGLE',
                          style:
                              TextStyle(color: Color(0xFF1F2937), fontSize: 12),
                        )
                      ]),
                )),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                    child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1, color: Color(0xFF0672CB)),
                  ),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 46,
                          width: 25,
                          child: Image.asset("assets/flogo.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'FACEBOOK',
                          style:
                              TextStyle(color: Color(0xFF1F2937), fontSize: 12),
                        )
                      ]),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0672CB)),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Want to create new account?",
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => User_register()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0672CB)),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

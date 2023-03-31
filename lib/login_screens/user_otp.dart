import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../chips/chips_page.dart';
import '../maps_screen/current_other_location.dart';

class UserOtp extends StatefulWidget {
  UserOtp({Key? key}) : super(key: key);

  @override
  _UserOtpState createState() => _UserOtpState();
}

class _UserOtpState extends State<UserOtp> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  late final String otpPinInputCustom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
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
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0672CB)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Container(
                child: Row(children: [
                  FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        "OTP Sent to +91 XXXXXXXXXX",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0672CB)),
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/otpicon.png"),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            child: Text(
              "Auto Detecting OTP",
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            // fit: BoxFit.cover,
            child: OtpPinField(
                key: _otpPinFieldController,
                onSubmit: (text) {
                  print('Entered pin is $text');
                },
                onChange: (text) {
                  print('Enter on change pin is $text');

                  /// return the entered pin
                },

                /// to decorate your Otp_Pin_Field
                otpPinFieldStyle: const OtpPinFieldStyle(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                  // border color for inactive/unfocused Otp_Pin_Field
                  defaultFieldBorderColor: Color(0xFF999999),
                  // border color for active/focused Otp_Pin_Field
                  activeFieldBorderColor: Color(0xFF999999),

                  /// Background Color for inactive/unfocused Otp_Pin_Field
                  // defaultFieldBackgroundColor: Colors.white,
                  // activeFieldBackgroundColor: Colors.white,
                  /// Background Color for active/focused Otp_Pin_Field
                ),
                maxLength: 6,
                showCursor: true,

                /// bool to show cursor in pin field or not
                cursorColor: Colors.indigo,
                otpPinInputCustom: "*",

                /// to choose cursor color
                fieldWidth: 48,
                middleChild: Column(
                  children: [
                    SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          _otpPinFieldController.currentState
                              ?.clearOtp(); // clear controller
                        },
                        child: Text("clear OTP")),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChipsScreen())),
                        child: Text("Next Class")),
                    SizedBox(height: 30),
                  ],
                ),
                cursorWidth: 3,
                otpPinFieldDecoration:
                    OtpPinFieldDecoration.defaultPinBoxDecoration),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
                  },
                  child: Text(
                    "Resend",
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0672CB)),
                  )),
              SizedBox(
                width: 5,
              ),
              Container(
                child: Text(
                  "OTP in 00:56",
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.94,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationSelectionPage()),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 19,fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFF0672CB),
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zazu99/Pages/Actual_Pages/Account%20Page/EditProfilePage.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with AutomaticKeepAliveClientMixin<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {},
          // onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          width: MediaQuery.of(context).size.width * 5,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Container(
                width: MediaQuery.of(context).size.width * 0.60,
                padding: new EdgeInsets.only(right: 13.0),
                child: new Text(
                  'Account',
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17),
          child: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child:  SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                       //   radius: ,
                          backgroundImage: AssetImage("assets/dp1.png"),
                          backgroundColor: Colors.transparent,
                        ),
                        Positioned(
                            bottom: 10,
                            right: -1,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Color(0xFFF5F6F9),
                              child: Icon(Icons.camera_alt, color: Colors.blue,size: 15,),
                              shape: CircleBorder(),
                            )
                        ),
                      ],
                    ),
                  )
                ),
                Text(
                  "John Raymonds",
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xFF0672CB),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Edit Profile",
                        style:
                            TextStyle(color: Color(0xFF0672CB), fontSize: 17),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Color(0xFF0672CB),
                      )),
                ),
                SizedBox(
                  height: 27,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        "Register as a Merchant",
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Color(0xFFCCCCCC),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        "Feedback",
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Color(0xFFCCCCCC),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        "Help Center",
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Color(0xFFCCCCCC),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        "FAQ’s",
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Color(0xFFCCCCCC),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        "Privacy Policy",
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Color(0xFFCCCCCC),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text(
                        "Log out",
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Color(0xFFCCCCCC),
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

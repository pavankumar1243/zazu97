import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _edit_profile_pageState();
}

class _edit_profile_pageState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
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
                  'Edit Profile',
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
        child: Column(
          children: [
            SizedBox(height: 25),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 18.0, right: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("First Name", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w600),),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text("Last Name", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w600),),
                        ),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'First name',
                              //prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Last name',
                              //prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Mobile Number", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w600),))),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  hintText: "Enter Your Mobile Number",
                  // labelText: 'Enter your mobile number',
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
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w600),))),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  //prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),


            //Country
            SizedBox(height: 7,),
            Padding(
                padding: const EdgeInsets.only(left: 17.0,top: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Country", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w600),))),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'India',
                  suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                  //prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),


            //City
            SizedBox(height: 7,),
            Padding(
                padding: const EdgeInsets.only(left: 17.0,top: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("City", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w600),))),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Hyderabad',
                  suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                  //prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),


            //Pincode
            SizedBox(height: 7,),
            Padding(
                padding: const EdgeInsets.only(left: 17.0,top: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Pincode", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w600),))),
            SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Pincode',
                  //prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.94,
                      height: 50,
                      child: OutlinedButton(
                       onPressed: (){
                         Navigator.pop(context);
                       },
                        child: Text(
                          "Cancel",
                          style:
                          TextStyle(color: Color(0xFF0672CB), fontSize: 19),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: Color(0xFF0672CB),
                          )),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.94,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.info(
                              message: 'Profile details are saved successfully.',
                            ),
                            dismissType: DismissType.onTap,
                            dismissDirection: [DismissDirection.endToStart],

                          );
                          Navigator.pop(context);
                        },
                        child: Text(
                          ('Save'),
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xFF0672CB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

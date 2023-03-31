import 'package:flutter/material.dart';
import '../../maps_screen/map_page.dart';
import '../widgets/address_search.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({Key? key}) : super(key: key);

  @override
  State<LocationSelect> createState() => _location_selectState();
}

class _location_selectState extends State<LocationSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: 53,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              children: <Widget>[
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddresSearch()));
                  },
                  child: Container(
                    height: 20,
                    child: Center(
                        child: Text(
                      "Search Your location/society/apartment",
                      style: TextStyle(color: Colors.black38),
                    )),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapPage()),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 25),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    child: Image.asset("assets/location.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      "Use current location",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Color(0xFFF5F5F5),
            height: 5,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "powered by Google",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

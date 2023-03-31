import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import '../chips/chips_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
// on below line we have specified camera position
//   static final CameraPosition _kGoogle = const CameraPosition(
//     target: LatLng(20.42796133580664, 80.885749655962),
//     zoom: 14.4746,
//
//   );
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "";
  CameraPosition? cameraPosition;

// on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    // Marker(
    //     markerId: MarkerId('1'),
    //     position: LatLng(20.42796133580664, 75.885749655962),
    //     infoWindow: InfoWindow(
    //       title: 'My Position',
    //     )
    // ),
  ];

// created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "Choose Your location",
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: Stack(
        children: [
          GoogleMap(
            // on below line setting camera position
            // initialCameraPosition: _kGoogle,
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            // on below line we are setting markers on the map
            markers: Set<Marker>.of(_markers),
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onCameraMove: (CameraPosition cameraPositiona) {
              cameraPosition = cameraPositiona; //when map is dragging
            },
            onCameraIdle: () async {
              //when map drag stops
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
              setState(() {
                //get place name from lat and lang
                location = placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.street.toString() +
                    ", \n" +
                    placemarks.first.locality.toString() +
                    ", " +
                    placemarks.first.subLocality.toString();
              });
            },
          ),
          GestureDetector(
            onTap: () async {
              getUserCurrentLocation().then((value) async {
                print(value.latitude.toString() +
                    " " +
                    value.longitude.toString());

                // marker added for current users location
                // _markers.add(
                //   Marker(
                //     markerId: MarkerId("2"),
                //     position: LatLng(value.latitude, value.longitude),
                //     infoWindow: InfoWindow(
                //       title: 'My Current Location',
                //     ),
                //   ),
                // );

                // specified current users location
                CameraPosition cameraPosition = new CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                  zoom: 14,
                );

                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.my_location,
                          color: Colors.red,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Use Current Location",
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            //picker image on google map
            child: Image.asset(
              "assets/picker.png",
              width: 30,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22,

              width: MediaQuery.of(context).size.width,

              // height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0)),
                color: Colors.white,
              ),

              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(0),
                      // width: MediaQuery.of(context).size.width - 40,
                      width: MediaQuery.of(context).size.width - 0,
                      child: ListTile(
                        // leading: Image.asset("assets/picker.png", width: 17,),
                        title: SizedBox(
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 25),
                              child: Image.asset(
                                "assets/picker.png",
                                width: 17,
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 5, top: 25),
                                  child: Text(
                                    location,
                                    style: TextStyle(fontSize: 18),
                                  )),
                            ),
                          ],
                        )),
                        dense: true,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChipsScreen()),
                          );
                        },
                        child: Text(
                          'Confirm Location',
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
          )
        ],
      ),
    );
  }
}

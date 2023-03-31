import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'merchant_detailscreen.dart';

class MerchantSearch extends StatefulWidget {
  final String selectedArray;
  MerchantSearch({required this.selectedArray});


  @override
  State<MerchantSearch> createState() => _merchant_search_resultsState();
}

class _merchant_search_resultsState extends State<MerchantSearch> {
  bool showWidget = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      widget.selectedArray,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              Flexible(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),

                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/kmrange.png")),
                        Flexible(
                          child: SizedBox(
                              width: 25,
                              child: Text("2 Km", style: TextStyle(fontSize: 10,),)),
                        ),
                        Flexible(child: Icon(Icons.arrow_drop_down, size: 30,),),
                      ],
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      showWidget = !showWidget;
                    });
                  },
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
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Recommended", ),
                      decoration: BoxDecoration(// Change this to the desired color
                        border: Border.all(
                          color: Colors.black38,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white10,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text("Offers", ),
                      decoration: BoxDecoration(// Change this to the desired color
                        border: Border.all(
                          color: Colors.black38,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white10,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text("Ratings", ),

                      decoration: BoxDecoration(// Change this to the desired color
                        border: Border.all(
                          color: Colors.black38,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white10,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0,),
                child: Align(
                  alignment: Alignment.centerLeft,
                 child:  Text("16 Results", style: TextStyle(fontSize: 22,
                     color: Colors.black, fontWeight: FontWeight.w500),),),
              ),
              merchant(),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              merchant(),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),

              SizedBox(height: 25,)

            ],
          ),
        ),
      ),
    );
  }
  merchant(){
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),),
              height: 170,
              child: Image.asset("assets/merchantimg.png",fit: BoxFit.fitWidth,),
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  padding: new EdgeInsets.only(right: 13.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MerchantDetails()),
                      );
                    },
                    child: new Text(
                        'The Glamour Lounge',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23, color: Color(0xFF0672CB))
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/mapimg.png"),
                  ),
                ),
              ],
            ),
          ),

          Container(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/map.png",scale: 1.5,),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          padding:  EdgeInsets.only(right: 13.0,left: 10),
                          child: Text(
                            'Phase No, Neeha’s, 1st Floor, Plot No.33,',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Text("..., Hyderabad-505006.",style: TextStyle(fontSize: 17,color: Colors.black, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/phonecall.png",scale: 1.5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("07337359025",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            ),
          ),

          Container(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/clock.png",scale: 1.5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Closed",style: TextStyle(fontSize: 18,color: Colors.red, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 4),
                    child: VerticalDivider(
                      width: 20,
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Text("9 am - 10 pm",style: TextStyle(fontSize: 11),),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 4),                          child: VerticalDivider(
                    width: 20,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  ),
                  Text("All day",style: TextStyle(fontSize: 11),),

                ],
              ),
            ),
          ),
          Container(
              height: 37,
              child: fivestar1()),
        ],
      ),
    );
  }

}

class fivestar1 extends StatefulWidget {
  const fivestar1({Key? key}) : super(key: key);
  @override
  _fivestar1State createState() => _fivestar1State();
}
class _fivestar1State extends State {
  double? _rating;
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Row(
              children: [
                Container(
                  color: Colors.white,
                  // padding: const EdgeInsets.symmetric(vertical: 200),
                  child: RatingBar.builder(
                    initialRating: _rating ?? 0.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 23,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => Icon(
                      _selectedIcon ?? Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      _rating = rating;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 5,),
                Text("4.4 (280)", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

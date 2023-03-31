import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../widgets/like_button.dart';
import '../Home_Page/Merchant Search/merchant_detailscreen.dart';

class favorites_page extends StatefulWidget {
  @override
  _favorites_pageState createState() => _favorites_pageState();
}

class _favorites_pageState extends State<favorites_page>
    with AutomaticKeepAliveClientMixin<favorites_page> {
  bool showWidget = false;

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
                  'Favourites',
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 23.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "6 Results",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
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
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  merchant() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              height: 170,
              child: Image.asset(
                "assets/merchantimg.png",
                fit: BoxFit.fitWidth,
              ),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MerchantDetails()),
                      );
                    },
                    child: new Text('The Glamour Lounge',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 23,
                            color: Color(0xFF0672CB))),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: Colors.black54,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.only(right: 13.0),
                            child: Text(
                              'Phase No, Neeha’s, 1st Floor, Plot No.33,',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Text(
                          "..., Hyderabad-505006.",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6, left: 5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone,
                    size: 25,
                    color: Colors.black54,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "07337359025",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 6, left: 5),
            child: Container(
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 25,
                      color: Colors.black54,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        "Closed",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 4),
                      child: VerticalDivider(
                        width: 20,
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "9 am - 10 pm",
                      style: TextStyle(fontSize: 11),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 4),
                      child: VerticalDivider(
                        width: 20,
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "All day",
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(height: 37, child: favorite_page_5star()),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 10.0, top: 10),
          //   child: Container(
          //     color: Colors.grey,
          //     height: 37,
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class favorite_page_5star extends StatefulWidget {
  const favorite_page_5star({Key? key}) : super(key: key);
  @override
  _favorite_page_5starState createState() => _favorite_page_5starState();
}

class _favorite_page_5starState extends State {
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
                Text(
                  "4.4 (280)",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                SizedBox(
                  width: 9,
                ),
                LikeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

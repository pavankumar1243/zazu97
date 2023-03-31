import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zazu99/widgets/feed_back_popup.dart';
import '../../../../widgets/ad_popup.dart';
import '../../../../widgets/fivestar.dart';
import '../../../../widgets/like_button.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../widgets/rating_in_merchant.dart';


class MerchantDetails extends StatefulWidget {
  const MerchantDetails({Key? key}) : super(key: key);
  @override
  State<MerchantDetails> createState() => _MerchantDetailsState();
}

class _MerchantDetailsState extends State<MerchantDetails> {
  bool showWidget = false;
  List img = [
    Image.asset(
      "assets/merchantimg.png",
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      "assets/merchantimg.png",
      fit: BoxFit.fitWidth,

    ),
    Image.asset(
      "assets/merchantimg.png",
      fit: BoxFit.fitWidth,

    ),
    Image.asset(
      "assets/merchantimg.png",
      fit: BoxFit.fitWidth,

    ),
  ];

  int currentIndex = 0;
  final _focusNode = FocusNode();
  String descText =
      "Description Line 1\nDescription Line 2\nDescription Line 3\nDescription "
      "Line 4\nDescription Line 5\nDescription Line 6\n"
      "Description Line 7\nDescription Line 8";
  bool descTextShowFlag = false;
  String dropdownvalue = 'Item 1';

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }


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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Container(
                width: MediaQuery.of(context).size.width * 0.60,
                padding: new EdgeInsets.only(right: 13.0),
                child: new Text(
                  'The Glamour Lounge',
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
                              child: Text(
                                "2 Km",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              )),
                        ),
                        Flexible(
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height:150,
                width: double.infinity,
                child: CarouselSlider(
                  items: [
                    for (int i = 0; i < img.length; i++) img[i],
                  ],
                  options: CarouselOptions(
                      viewportFraction: 0.8,
                    //  enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      autoPlay: true),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < img.length; i++)
                    Container(
                      height: 8,
                      width: 8,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: currentIndex == i
                            ? Color(0xFF0672CB)
                            : Color(0xFFCCCCCC),
                        shape: BoxShape.circle,
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.grey,
                        //       spreadRadius: 1,
                        //       blurRadius: 3,
                        //       offset: Offset(2, 2))
                        // ]
                      ),
                    ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: new Text('The Glamour Lounge',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                        color: Color(0xFF0672CB))),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6, top: 6),
                child: Container(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/kmrange.png")),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            "2Km",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: SizedBox(
                            height: 18,
                            child: VerticalDivider(
                              width: 20,
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 160,
                          child: fivestar(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 4),
                          child: SizedBox(
                            height: 18,
                            child: VerticalDivider(
                              width: 10,
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                        ),
                        LikeButton(),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Uri phoneno = Uri.parse('tel:+9154134826');
                        if (await launchUrl(phoneno)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      },
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/phonesym.png"),
                      ),
                    ),
                    GestureDetector(
                      onTap: _launchURLAppfb,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/fbsym.png"),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/whatsappsym.png"),
                    ),
                    GestureDetector(
                      onTap: _launchURLAppyt,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/ytsym.png"),
                      ),
                    ),
                    GestureDetector(
                      onTap: _launchURLAppgmap,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset("assets/mapsym.png"),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: GestureDetector(
                          onTap: sharepressed,
                          child: Image.asset("assets/sharesym.png")),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
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
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Container(
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

                        Text("9 am - 10 pm  - ",style: TextStyle(fontSize: 11),),
                        Text("All day",style: TextStyle(fontSize: 11),),

                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
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
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          "assets/gstpic.png",scale: 1.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          "GSTIN: 36SRLPS05958313UK",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: new Text('Deals',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        color: Color(0xFF0672CB))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: SizedBox(
                  child: Image.asset("assets/ads99.png"),
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: new Text('Photos (5)',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        color: Color(0xFF0672CB))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width * 0.99,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      // SizedBox(width: 13,),
                      Padding(
                        // Following padding to give space around the icon and text
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              // {
                              //   Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => const birthdays()),
                              //   );
                              // },
                              child: Container(
                                child: Container(
                                  height: 200,
                                  width: 110,
                                  child: Image.asset("assets/mp1.png"),
                                ),
                                height: 110,
                                width: 110,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Padding(
                        // Following padding to give space around the icon and text
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              // {
                              //   Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => const birthdays()),
                              //   );
                              // },
                              child: Container(
                                child: Container(
                                  height: 200,
                                  width: 110,
                                  child: Image.asset("assets/mp1.png"),
                                ),
                                height: 110,
                                width: 110,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Padding(
                        // Following padding to give space around the icon and text
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              // {
                              //   Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => const birthdays()),
                              //   );
                              // },
                              child: Container(
                                child: Container(
                                  height: 200,
                                  width: 110,
                                  child: Image.asset("assets/mp1.png"),
                                ),
                                height: 110,
                                width: 110,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Padding(
                        // Following padding to give space around the icon and text
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: Container(
                                  height: 200,
                                  width: 110,
                                  child: Image.asset("assets/mp1.png"),
                                ),
                                height: 110,
                                width: 110,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Padding(
                        // Following padding to give space around the icon and text
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                child: Container(
                                  height: 200,
                                  width: 110,
                                  child: Image.asset("assets/mp1.png"),
                                ),
                                height: 110,
                                width: 110,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: new Text('Services',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        color: Color(0xFF0672CB))),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "•" +
                            "  Hair-cutting, colouring and styling\n"
                                "•" +
                            "  Waxing other forms of hair \n"
                                "•" +
                            "  Nail treatments\n"
                                "•" +
                            "  Facials and skin care treatments\n"
                                "•" +
                            "  Tanning\n"
                                "•" +
                            "  Massages\n"
                                "•" +
                            "  Complementary Care\n"
                                "•" +
                            "  Salon Equipment\n"
                                "•" +
                            "  Hair Removal \n"
                                "•" +
                            "  Shaving Accessories\n"
                                "•" +
                            "  Steamer & Massager Equipment\n"
                                "•" +
                            "  Beauty Therapy Machine\n",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: descTextShowFlag ? 12 : 6,
                        textAlign: TextAlign.start),
                    SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          descTextShowFlag = !descTextShowFlag;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          descTextShowFlag
                              ? Text(
                            "Show Less...",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          )
                              : Text("Show More...",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 11),
                child: Container(
                  height: 160,
                  // width: MediaQuery
                  //     .of(context)
                  //     .size
                  //     .width * 0.80,
                  color: Color(0xFFFFFDD1),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:15,right: 5),
                              child: SizedBox(
                                height: 40,
                                width: 62,
                                child: Image.asset("assets/announcements.png"),
                              ),
                            ),
                            Text(
                              "ANNOUNCEMENT",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Text(
                            "We are opening a new branch in KPHP. We are opening a"
                                " new branch in KPHP. We are opening a new branch in KPHP.",
                            style: TextStyle(
                                fontSize: 16.5, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdPopUp()),
                  );
                },
                child: Text("Ad Pop up"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FeedBack();
                      },
                    );
                  },
                  child: Text("Feedback Pop up")),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: new Text('Rate Merchant',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Color(0xFF0672CB))),
                ),
              ),
              RatingMerchant(),
            ],
          ),
        ),
      ),
    );
  }

  _launchURLBrowser() async {
    var url = Uri.parse("https://www.youtube.com/watch?v=gU7ZxYN03fU");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLAppfb() async {
    var url = Uri.parse("https://www.facebook.com/zuck/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLAppgmap() async {
    var url = Uri.parse("https://goo.gl/maps/mHXi63rDp79GVPQA9");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLAppyt() async {
    var url = Uri.parse("https://www.youtube.com/watch?v=gU7ZxYN03fU");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void sharepressed() {
    Share.share('check out my website Store');
  }
}

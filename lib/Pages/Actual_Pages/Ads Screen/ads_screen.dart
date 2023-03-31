import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../widgets/like_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../widgets/report_an_issue_popup.dart';

class AdsScreen extends StatefulWidget {
  @override
  _ads_screenState createState() => _ads_screenState();
}

class _ads_screenState extends State<AdsScreen>
    with AutomaticKeepAliveClientMixin<AdsScreen> {
  @override
  bool showWidget = false;

  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   // width: MediaQuery.of(context).size.width * 0.44,
              //   child: Text(
              //     "Narsingi-Puppalaguda Main Ro...",
              //     overflow: TextOverflow.ellipsis,
              //     style: TextStyle(fontSize: 15, color: Colors.black),
              //   ),
              // ),
              new Container(
                width: MediaQuery.of(context).size.width * 0.60,
                padding: new EdgeInsets.only(right: 13.0),
                child: new Text(
                  'Ads / Promotions',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for "Beauty"',
                  prefixIcon: Icon(Icons.search),
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(15),  // Added this
                ),
              ),
              SizedBox(height: 20,),
              promoshare(),
              promoshare(),
              promoshare(),
              promoshare(),
              SizedBox(height: 20,),
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.94,
                child: OutlinedButton(
                  //  onPressed: _isButtonDisabled ? null : _submitFeedback,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReportAnIssuePopUp();
                      },
                    );
                  },
                  child: Text(
                    'Report an issue',
                    style: TextStyle(fontSize: 19),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.blue),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  void sharepressed() {
    // String message= "Check ou this Saloon";
    // Share.share(message);
    Share.share('check out my website Store');
    // Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
    // Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
  }

  Column promoshare() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          child: Image.asset(
            "assets/promotions1.png",scale: 1.5,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: sharepressed,
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/promoshare.png"),
                      Text(
                        "14",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/promolike.png",scale: 1.5,),
                    Text(
                      "14",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              LikeButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    width: 60,
                    child: Image.asset("assets/promoreport.png",scale: 1.5,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  @override
  bool get wantKeepAlive => true;
}

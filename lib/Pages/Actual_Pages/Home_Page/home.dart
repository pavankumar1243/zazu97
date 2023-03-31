import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:zazu99/Pages/Actual_Pages/Home_Page/Merchant%20Search/search.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  List<String> sortedReportList;

  Home({required this.sortedReportList});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool Visibled = false;
  bool isShowAll = false;
  bool isVisible = false;
  String _myVariable = "2 kms";

  List img = [
    Image.asset(
      "assets/main_ad.png",
      fit: BoxFit.fill,
    ),
    Image.asset(
      "assets/main_ad.png",
      fit: BoxFit.fill,
    ),
    Image.asset(
      "assets/main_ad.png",
      fit: BoxFit.fill,
    ),
    Image.asset(
      "assets/main_ad.png",
      fit: BoxFit.fill,
    ),
  ];
  List<String> items1 = [
    "Beauty Parlours",
    "Beauty Services",
    "Bridal Makeup",
    "Bridegroom Makeup",
    "Men Saloons",
    "Women Saloons",
    "Message Centers",
    "Spa & Rehabitation"
  ];

  List<String> items2 = [
    "Car",
    "Bike",
    "Auto",
  ];
  List<String> items3 = [
    "Hair salons",
    "Aesthetic clinics",
    "Massage centres",
    "Skin care centers",
    "Makeup studios",
    "Body care centres",
    "Beauty supply stores",
    "Day Spas"
  ];

  List<String> combinedList = [];
  @override
  void initState() {
    super.initState();
    combinedList = [
      ...items1,
      ...items2,
      ...items3,
    ];
  }

  List<String> _searchResult = [];

  TextEditingController _searchController = TextEditingController();

  void _onSearchTextChanged(String text) {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    combinedList.forEach((item) {
      if (item.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(item);
      }
    });
    setState(() {});
  }

  bool showWidget = false;
  var status = [false, false, false, false, false];

  var results = [
    '1 Km',
    '2 Kms',
    '3 Kms',
    '4 Kms',
    '5 Kms',
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          PhosphorIcons.map_pin,
          color: Color(0xFF0672CB),
          size: 32.0,
        ),
        title: Container(
          width: MediaQuery.of(context).size.width * 5,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: new Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  padding: new EdgeInsets.only(right: 13.0),
                  child: new Text(
                    'Narsingi-Puppalaguda Main Ro',
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                    ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset("assets/kmrange.png")),
                      Flexible(
                        child: SizedBox(
                            width: 50,
                            child: Text(
                              _myVariable == null ? "2km" : _myVariable,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )),
                      ),
                      SizedBox(
                        width: 20,
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return radioPopUp();
                          });
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: GestureDetector(
              onTap: () {},
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchTextChanged,
                decoration: InputDecoration(
                  hintText: 'Search for "Beauty"',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: _searchResult.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.black12,
                        width: 2.0,
                      ),
                    ),
                    height: 50,
                    child: Center(child: search())),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                // width: MediaQuery.of(context).size.width*0.5,
                child: CarouselSlider(
                  items: [
                    for (int i = 0; i < img.length; i++) img[i],
                  ],
                  options: CarouselOptions(
                      height: 170,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
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
                      ),
                    ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
            child: Text(
              "Selected Services",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: isShowAll ? (widget.sortedReportList.length) : 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (index == 7) {
                        isShowAll = true;
                      } else if (index ==
                          (widget.sortedReportList.length - 1)) {
                        isShowAll = false;
                      }
                    },
                  );
                },
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blueGrey,
                          height: 50,
                          width: 50,
                        ),
                        check(index),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
              child: Container(
                child: Image.asset("assets/mini_ad1.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Trending Services",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                trendBox(
                  "Salon",
                ),
                trendBox("Electrical"),
                trendBox("AC Repair"),
                trendBox("Hair & Skin"),
                trendBox("TV Installing"),
              ],
            ),
          ),
          Container(
            // height: 200,
            child: Stack(
              children: [
                Container(
                  child: Image.asset('assets/mechantapply.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Want to become a Merchant?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '•  Earn more revenue',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '•  Refer and get 1@ per order',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          ElevatedButton(
                            child: Text("Apply"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget check(int index) {
    if (index == 7) {
      return isShowAll
          ? Text(
              widget.sortedReportList[index],
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            )
          : Text(
              "more",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            );
    } else {
      print(index);
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 3, left: 2, right: 2),
          child: Text(
            widget.sortedReportList[index],
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ),
      );
    }
  }

  Widget trendBox(String text) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          color: Colors.blueGrey,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 2, right: 2),
          child: Text(text,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }

  Widget search() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount:
          _searchResult.length > 0 ? _searchResult.length : combinedList.length,
      itemBuilder: (BuildContext context, int index) {
        final String item = _searchResult.length > 0
            ? _searchResult[index]
            : "No results found";
        return ListTile(
          title: Row(
            children: [
              Text(item),
            ],
          ),
          onTap: () {
            setState(() {
              //    selectedIndex = 0;
            });
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchScreen(
                  selectedItem: item,
                  combinedList: combinedList,
                ),
              ),
            );
          },
        );
      },
    );
  }

  radioPopUp() {
    int? selectedRadio = 0;
    bool isButtonEnabled = false;
    String _selectedText = '';
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Distance",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 25,
                    ),
                  )
                ],
              ),
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RadioListTile(
                      title: Text(
                        "1 km",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                          isButtonEnabled = true;
                          _selectedText = '1 km';
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                    RadioListTile(
                      title: Text(
                        "2 kms",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                          isButtonEnabled = true;
                          _selectedText = '2 kms';
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                    RadioListTile(
                      title: Text(
                        "3 kms",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      value: 3,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                          isButtonEnabled = true;
                          _selectedText = '3 kms';
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                    RadioListTile(
                      title: Text(
                        "4 kms",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      value: 4,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                          isButtonEnabled = true;
                          _selectedText = '4 kms';
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                    RadioListTile(
                      title: Text(
                        "5 kms",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      value: 5,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                          isButtonEnabled = true;
                          _selectedText = '5 kms';
                        });
                      },
                      contentPadding:
                          EdgeInsets.zero, // Remove padding around the tile
                      dense: true, // Decrease the height of the tile
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          OutlinedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            onPressed: Navigator.of(context).pop,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 2.0, color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Flexible(
                            child: OutlinedButton(
                              onPressed: isButtonEnabled
                                  ? () {
                                      setState(() {
                                        _myVariable =
                                            _selectedText; // Set the variable to a value
                                      });
                                      Navigator.pop(
                                        context,
                                      );
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: isButtonEnabled
                                        ? Colors.white
                                        : Colors.blue,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: isButtonEnabled
                                    ? Colors.blue
                                    : Colors.white,
                                side:
                                    BorderSide(width: 2.0, color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])
            ],
          ),
        );
      },
    );
  }
}

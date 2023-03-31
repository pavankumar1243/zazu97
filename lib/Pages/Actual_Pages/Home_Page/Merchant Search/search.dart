import 'package:flutter/material.dart';
import 'merchant_search_results.dart';

class SearchScreen extends StatefulWidget {

  final String selectedItem;
  final List<String> combinedList;

  SearchScreen({required this.selectedItem, required this.combinedList});

  @override
  State<SearchScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SearchScreen> {
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

  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<String> selectedArray = [];

    if (items1.contains(widget.selectedItem)) {
      selectedArray = items1;
    } else if (items2.contains(widget.selectedItem)) {
      selectedArray = items2;
    } else if (items3.contains(widget.selectedItem)) {
      selectedArray = items3;
    }

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
                  _getAppBarTitle(),
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
                  //    showWidget = !showWidget;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      // appBar: AppBar(
      //   title: Text(_getAppBarTitle()),
      // ),
      body: ListView.builder(
        itemCount: selectedArray.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MerchantSearch(
                      selectedArray: selectedArray[index]                    ),
                )
              );
            },
            child: ListTile(
              title: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,color: Colors.black,),
                      SizedBox(width: 20,),
                      Text(selectedArray[index],style: TextStyle(
                        fontSize: 20,
                        color: Colors.black

                      ),),
                    ],
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                ],
              ),

            ),
          );
        },
      ),
    );
  }

  String _getAppBarTitle() {
    if (widget.selectedItem.isEmpty) {
      return 'Beauty';
    }

    else if (widget.selectedItem == "Beauty Parlours" ||
        widget.selectedItem == "Beauty Services" ||
        widget.selectedItem ==  "Bridal Makeup" ||
        widget.selectedItem == "Bridegroom Makeup" ||
        widget.selectedItem == "Men Saloons" ||
        widget.selectedItem == "Women Saloons" ||
        widget.selectedItem == "Message Centers" ||
        widget.selectedItem == "Spa & Rehabitation") {
      return 'Beauty';

    } else if (widget.selectedItem.toLowerCase() == 'Bike' ||
        widget.selectedItem == "Car" ||
        widget.selectedItem == "Auto"
    ) {
      return 'Automobile';
    } else {
      return '${widget.selectedItem}';
    }
  }
}
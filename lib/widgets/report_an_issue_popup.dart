import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ReportAnIssuePopUp extends StatefulWidget {

  @override
  _ReportAnIssuePopUpState createState() => _ReportAnIssuePopUpState();

}

class _ReportAnIssuePopUpState extends State {
  TextEditingController _textController = TextEditingController();
  bool isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }
  void _onTextChanged() {
    setState(() {
      isButtonEnabled = _textController.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.99,
      child: AlertDialog(
        // title: const Text('Report an Issue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 0, top: 17, bottom: 10),
              child: Center(
                child: Text(
                  "Report an issue",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.close,
                size: 25,
                color: Colors.black,
              ),
            )
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.99,
          child: SingleChildScrollView(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "Merchant Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    border: Border.all(
                      width: 1,
                      color: Color(0xFFCCCCCC),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                      child: Text(
                        "Super Delicious Food",
                        style:
                            TextStyle(color: Color(0xFF444444), fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0,top: 10,),
                  child: Text(
                    "Issue Type",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFCCCCCC),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 17),
                      child: DropdownButton(
                        value: "Error",
                        items: [
                          //add items in the dropdown
                          DropdownMenuItem(
                            child: Text("Error"),
                            value: "Error",
                          ),
                          DropdownMenuItem(
                              child: Text("Abuse 2"), value: "Abuse 2"),
                          DropdownMenuItem(
                            child: Text("Abuse 3"),
                            value: "Abuse 3",
                          )
                        ],
                        onChanged: (value) {
                          //get value when changed
                          print("You have selected $value");
                        },

                        icon: Padding(
                            //Icon at tail, arrow bottom is default icon
                            padding: EdgeInsets.only(left: 20),
                            child: Image.asset(
                              'assets/arrow-down-sign-to-navigate.png',
                              width: 20,
                              height: 20,
                              color: Colors.black45,
                            )),
                        iconEnabledColor: Colors.black, //Icon color
                        style: TextStyle(
                          //te
                          color: Colors.black, //Font color
                          fontSize: 16, //font size on dropdown button
                        ),

                        dropdownColor: Colors.white, //dropdown background color
                        underline: Container(), //remove underline
                        isExpanded: true, //make true to make width 100%
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0,top: 10),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your Description here',
                  ),
                  maxLines: 7,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15,bottom: 20,right: 15),
            child: Row(
              children: [
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
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
               Spacer(),
                OutlinedButton(
                  onPressed: isButtonEnabled
                      ? () {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.info(
                        message: 'Thank you for providing'
                            ' your inputs and will resolve it at the earliest.',
                      ),
                      dismissType: DismissType.onTap,
                      dismissDirection: [DismissDirection.startToEnd],
                    );
                    Navigator.pop(
                      context,
                    );
                  }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Text(
                      'Submit',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

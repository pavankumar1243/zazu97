import 'package:flutter/material.dart';
import 'package:zazu99/widgets/report_an_issue_popup.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../Pages/Actual_Pages/Home_Page/Merchant Search/merchant_detailscreen.dart';



class RatingMerchant extends StatefulWidget {
  const RatingMerchant({Key? key}) : super(key: key);
  @override
  _RatingMerchantState createState() => _RatingMerchantState();
}

class _RatingMerchantState extends State {

  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MerchantDetails()),
    );
  }


  int _stars = 0;
  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        size: 35,
        color: _stars >= starCount ? Colors.amber : Colors.grey,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }
  TextEditingController _textController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isButtonEnabled = _textController.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
return    Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildStar(1),
        _buildStar(2),
        _buildStar(3),
        _buildStar(4),
        _buildStar(5),
      ],
    ),
    if (_stars == 1 || _stars == 2)
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Please describe your issue",
              style: TextStyle(fontSize: 15),
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
          Padding(
            padding: const EdgeInsets.only(
                top: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Text(
                      'Clear',
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
                  onPressed: _isButtonEnabled
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
                  }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        color: _isButtonEnabled
                            ? Colors.white
                            : Colors.blue,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: _isButtonEnabled
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
    SizedBox(
      height: 10,
    ),
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
  ],
);
  }
}

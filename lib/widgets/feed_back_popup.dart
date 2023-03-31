import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State {
  double _ratings = 0;
  bool _isContentVisible = false;
  bool showWidget = false;

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
            return AlertDialog(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Feedback',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
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
                  Text(
                    'How satisfied are you after using the application?',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatefulBuilder(
                    builder: (BuildContext context,
                        StateSetter setState) {
                      return Column(children: [
                        RatingBar.builder(
                          initialRating: _ratings ?? 0.0,
                          minRating: 1,
                          allowHalfRating: false,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 40,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _ratings = rating;
                              if (rating == 1 || rating == 2) {
                                _isContentVisible = true;
                              } else {
                                _isContentVisible = false;
                              }
                            });
                          },
                        ),
                        Visibility(
                          visible: _isContentVisible,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10),
                                child: Text(
                                  "Please discribe your issue",
                                  style:
                                  TextStyle(fontSize: 15),
                                ),
                              ),
                              TextField(
                                controller: _textController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText:
                                  'Write your Description here',
                                ),
                                maxLines: 10,
                              ),
                            ],
                          ),
                        )
                      ]);
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15,bottom: 10,right: 15),
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
                      Spacer(),
                      OutlinedButton(
                        onPressed: _isButtonEnabled
                            ? () {
                          Navigator.pop(
                            context,
                          );
                        }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 9, right: 9, top: 10, bottom: 10),
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
            );
          }
}
import 'package:flutter/material.dart';

class AdPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GestureDetector(
            child: Center(
              child: Hero(
                  tag: 'imageHero',
                  child:Stack(
                    children:[
                      Container(
                        height: double.infinity,
                          width: double.infinity,
                          child: Image.asset("assets/adpopup.png",fit: BoxFit.fitWidth,)),
                      Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40,right: 20),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5000))
                              ),
                              child: IconButton(
                                icon: Icon(Icons.clear_rounded, color: Colors.black),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                          ),
                        ],
                      ),
                     ),
                  ])
              ),
            ),
            // onTap: () {
            //   Navigator.pop(context);
            // },
          ),
        ),
      ),
    );
  }
}
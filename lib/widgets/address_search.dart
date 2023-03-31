import 'package:flutter/material.dart';

class AddresSearch extends StatefulWidget {
  const AddresSearch({Key? key}) : super(key: key);

  @override
  State<AddresSearch> createState() => _AddresSearchState();
}

class _AddresSearchState extends State<AddresSearch> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "name": "Use current location",
      "age": "Cybercity Rainbow,"
          " Narsingi-Puppalaguda Main Road, Hariram Hills, Opposite IDL, Moosapet, Hyderabad-500018"
    },
    {
      "name": "Home",
      "age": "My Home Avatar, DLF New Heights "
          "Gachibowli Extension, Financial District, Hyderabad-500075"
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
           Container(
             decoration: BoxDecoration(

               border: Border(

                 bottom: BorderSide(width:2.0, color: Colors.black38),
               ),
             ),
             child: Row(
              children: <Widget> [
                IconButton(
                  iconSize: 25,
                  icon: const Icon(
                      Icons.arrow_back,color: Colors.blue,),
                  onPressed: () => Navigator.of(context).pop(),
                ),

                Expanded(
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 24,
                      ),
                      labelText: 'Search your location/society/apartment',
                    ),
                  ),
                ),
              ],
          ),
           ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _foundUsers.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Icon(
                              Icons.add_location_alt_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              _foundUsers[index]['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(_foundUsers[index]["age"]),
                          ),
                        ),
                        Container(
                          color: Colors.black12,
                          height: 2,
                        )
                      ],
                    ),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}

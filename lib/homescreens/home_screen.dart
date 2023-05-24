import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models1.dart';
import '../models/models1.dart';
import '../repositries/screen_repo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
    required this.list,
    // required this.listperson,
  });
  // final Listperson listperson;
  final Listperson list;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Listperson> listperson = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: FutureBuilder(
            future: fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    itemCount: listperson.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          margin: EdgeInsets.only(bottom: 10),
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(index, "Id: ",
                                    listperson[index].id.toString()),
                                getText(index, "Name: ",
                                    listperson[index].name.toString()),
                                getText(index, "Username: ",
                                    listperson[index].username.toString()),
                                getText(index, "Email: ",
                                    listperson[index].email.toString()),
                                getText(index, "Address:",
                                    listperson[index].address!.city.toString()),
                                getText(index, "Phone: ",
                                    listperson[index].phone.toString()),
                                getText(index, "Website: ",
                                    listperson[index].website.toString()),
                                getText(index, "Company: ",
                                    listperson[index].company!.name.toString()),
                              ]));
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
    /* return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 40,
              ),
            ),
            Text("goodAfterNoon Srijan "),
            Center(
              child: Text(
                "your Friend list",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text("Id:  ${widget.listperson.id}"),
                ),
              ],
            ),
            Row(
              children: [
                Text("Name:       ${widget.listperson.name}"),
              ],
            ),
            Row(
              children: [
                Text("Company:    ${widget.listperson.company?.bs}"),
              ],
            ),
            Row(
              children: [
                Text("Address:    ${widget.listperson.address?.city}"),
              ],
            ),
            Row(
              children: [
                Text("Username:   ${widget.listperson.username}"),
              ],
            ),
            Row(
              children: [
                Text("Email:       ${widget.listperson.email}"),
              ],
            ),
            Row(
              children: [
                Text("Phone:        ${widget.listperson.phone}"),
              ],
            ),
            Row(
              children: [
                Text("Website:    ${widget.listperson.website}"),
              ],
            ),
          ],*/
  }

  Text getText(int index, String fieldName, String context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: fieldName,
      ),
      TextSpan(
        text: context,
      )
    ]));
  }

  Future<List<Listperson>> fetch() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        listperson.add(Listperson.fromJson(index));
      }
      return listperson;
    } else {
      return listperson;
    }
  }
}

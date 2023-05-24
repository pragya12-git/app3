import 'dart:convert';

import 'package:app3/detailBuilder/detail_builders.dart';
import 'package:app3/homescreens/home_screen2.dart';
import 'package:app3/models/models2.dart';
import 'package:app3/repositries/screen_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app3/screens/login_page.dart';
import 'package:intl/intl.dart';

import '../models/models1.dart';
import 'package:http/http.dart' as http;

class Home1 extends StatefulWidget {
  Home1({
    super.key,
    required this.details,
  });

  final Logindetails details;

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final Login login1 = Login();

  List<Listperson> listperson = [];

  @override
  void initState() {
    _refresh();
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    try {
      List<Listperson> person = await login1.getdata();

      setState(() {
        listperson = person;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    String greeting;
    int currentHour = currentTime.hour;
    if (currentHour >= 0 && currentHour < 12) {
      greeting = 'Good Morning!';
    } else if (currentHour >= 12 && currentHour < 17) {
      greeting = 'Good Afternoon!';
    } else {
      greeting = 'Good Evening!';
    }

    return WillPopScope(
      onWillPop: () => onBackButtonPressed(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen2(details: widget.details)));
                  },
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdxXZkn5DxqvgPplxM4C91e9A-k3ZHBkBlE-56e2kr&s",
                    fit: BoxFit.cover,
                    height: 35.0,
                  )),
              Text(greeting,
                  style: TextStyle(fontSize: 13, color: Colors.blue)),
              Text("Srijan",
                  style: TextStyle(fontSize: 13, color: Colors.blue)),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          // title: Text("Do you want to logout?"),
                          content: Text("Do you want to logout?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: new Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => LoginScreen())));
                              },
                              child: new Text('Yes'),
                            ),
                          ],
                        ));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.blue,
              ),
            )
          ],
        ),
        body: listperson.isEmpty
            ? Center(child: (CircularProgressIndicator()))
            : RefreshIndicator(
                onRefresh: () => _refresh(),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listperson.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(
                        listperson[index].name.toString(),
                        style: TextStyle(color: Colors.blue),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailBuilders(
                              label: "Id",
                              value: listperson[index].id.toString()),
                          DetailBuilders(
                              label: "Username",
                              value: listperson[index].username.toString()),
                          DetailBuilders(
                              label: "Email",
                              value: listperson[index].email.toString()),
                          DetailBuilders(
                              label: "Address",
                              value:
                                  listperson[index].address!.street.toString()),
                          DetailBuilders(
                              label: "Phone",
                              value: listperson[index].phone.toString()),
                          DetailBuilders(
                              label: "Website",
                              value: listperson[index].website.toString()),
                          DetailBuilders(
                              label: "Company",
                              value: listperson[index].company!.bs.toString()),
                        ],
                      ),
                      // Text(listperson[index].username.toString()),
                      // Text(listperson[index].email.toString()),
                    ));
                  },
                ),
              ),
      ),
    );
  }

  Future<bool> onBackButtonPressed() async {
    return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want Logout?"),
              //content: new Text('yes no'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: new Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => LoginScreen()),
                        ));

                    //Navigator.pop(context);
                  },
                  child: new Text('Yes'),
                ),
              ],
            )));
  }

  Future<void> _refresh() async {
    //  await Future.delayed(
    //  Duration(seconds: 4),
    // );
    setState(() {
      listperson = listperson;
    });

    await Future.delayed(
      Duration(seconds: 4),
    );
  }
}

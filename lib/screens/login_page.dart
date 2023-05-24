import 'dart:convert';

import 'package:app3/homescreens/home_screen1.dart';
import 'package:app3/homescreens/home_screen.dart';
import 'package:app3/homescreens/home_screen2.dart';
import 'package:app3/models/models1.dart';
import 'package:flutter/material.dart';
import 'package:app3/repositries/screen_repo.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController userctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => onButtonPressed(),
        child: Scaffold(
          body: Form(
            key: _formkey,
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "Username must be required";
                      }
                    },
                    controller: userctrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'password',
                    ),
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "password must be required";
                      }
                    },
                    controller: passctrl,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      Login login = Login();
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                content: Text("Loading please wait"),
                                actions: <Widget>[
                                  Center(child: CircularProgressIndicator())
                                ],
                              ));

                      var details = await login.screen(
                          username: userctrl.text, password: passctrl.text);
                      Navigator.pop(context);

                      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Home1(
                                    details: details,
                                  ))));
                    }
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ));
  }

  Future<bool> onButtonPressed() async {
    return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want Exit?"),
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
                    SystemNavigator.pop();
                  },
                  child: new Text('Yes'),
                ),
              ],
            )));
  }
}

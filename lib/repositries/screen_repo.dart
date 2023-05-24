import 'dart:convert';
import 'package:app3/models/models1.dart';
import 'package:app3/models/models2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login {
  screen({required String username, required String password}) async {
    var request;
    Map<String, dynamic> requestbody = {
      "Email": username,
      "Password": password,
    };
    request = await http.post(
      Uri.parse("http://app.neoassure.com/api/Mobile/login"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(requestbody),
    );

    print(request.statusCode);
    print(requestbody);
    print(request.body);

    // var response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    // print(response);
    // print(response.statusCode);
    // print(response.body);

    //Listperson list = Listperson.fromJson(jsonDecode(response.body));

    // List data = jsonDecode(response.body);
    // list.forEach(
    //  (element) {
    //  Map obj = element;
    //  String name = obj["name"];
    //  print(name);
    //  },
    // );

    print(123);

    Logindetails logindetails = Logindetails.fromJson(jsonDecode(request.body));
    print(logindetails.success);
    print(logindetails.message);
    print(logindetails.message?.address);
    print(logindetails.message?.email);
    return logindetails;
    // print(list.id);
  }

  Future<List<Listperson>> getdata() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    print(response);
    print(response.statusCode);
    print(response.body);

    // Listperson list = Listperson.fromJson(jsonDecode(response.body));

    // print(list.email);

    var jsonData = jsonDecode(response.body);
    List<Listperson> person = [];
    for (var u in jsonData) {
      Listperson list = Listperson.fromJson(u);
      person.add(list);
      print(list.address?.city);
      print(list.id);
      print(list.company?.bs);
      print(list.email);
      print(list.phone);
      print(list.company);
    }
    return person;

    // print(list.name);
  }

  /* Future<List<Listperson>> fetch() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());
    List<Listperson> listperson = [];
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        listperson.add(Listperson.fromJson(index));
      }
      return listperson;
    } else {
      return listperson;
    }
  }*/
}

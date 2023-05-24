import 'package:app3/models/models2.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({
    super.key,
    required this.details,
  });
  final Logindetails details;

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Stack(children: <Widget>[
            Hero(
                tag: "User1",
                child: CachedNetworkImage(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdxXZkn5DxqvgPplxM4C91e9A-k3ZHBkBlE-56e2kr&s",
                  height: 350,
                  width: 350,
                )),
            IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.blue,
              ),
            )
          ]),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: Text(
                "FullName :${widget.details.message!.fullName.toString()} "),
          ),
          ListTile(
              leading: Icon(
                Icons.place,
                color: Colors.blue,
              ),
              title: Text(
                  "Address : ${widget.details.message!.address.toString()}")),
          ListTile(
              leading: Icon(Icons.email, color: Colors.red),
              title:
                  Text("Email : ${widget.details.message!.email.toString()}")),
          ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              title: Text(
                  "MobileNumber : ${widget.details.message!.mobileNumber.toString()}")),
          ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text(
                  "RoleName: ${widget.details.message!.roleName.toString()}")),

          /* Row(children: [
            Expanded(flex: 2, child: Text("FullName")),
            Expanded(
                flex: 2,
                child: Text(widget.details.message!.fullName.toString())),
          ]),
          Row(
            children: [
              Expanded(flex: 2, child: Text("Email")),
              Expanded(
                  flex: 2,
                  child: Text(widget.details.message!.email.toString())),
            ],
          ),*/

          /*Text("FullName: ${widget.details.message!.fullName.toString()}"),
          Text("Email:${widget.details.message!.email.toString()}"),
          Text("Address:${widget.details.message!.address.toString()}"),
          Text(
              "MobileNumber: ${widget.details.message!.mobileNumber.toString()}"),
          Text("RoleId: ${widget.details.message!.roleId.toString()}"),
          Text("RoleName: ${widget.details.message!.roleName.toString()}"),
        ],
      ),*/
        ]));
  }
}

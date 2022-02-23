import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'HomeDatabase.dart';

class EditDatabase extends StatelessWidget {
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();

  final RealtimeDatabase = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = RealtimeDatabase.ref().child('Users');
    return Scaffold(
      backgroundColor: Color(0xff009966),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Add Users"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                controller: Name,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintStyle: TextStyle(color: Color(0xff99CCCC), fontSize: 16),
                  hintText: 'Name',
                ),
                validator: (ValueKey) {
                  if (ValueKey!.isEmpty) {
                    return "* Required";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                controller: Phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.perm_phone_msg_outlined,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintStyle: TextStyle(color: Color(0xff99CCCC), fontSize: 16),
                  hintText: 'Phone',
                ),
                validator: (ValueKey) {
                  if (ValueKey!.isEmpty) {
                    return "* Required";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(60),
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                color: Color(0xff003333),
                onPressed: () {
                  ref.push().set({Name.text: Phone.text}).asStream();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => HomeDatabase()));
                },
                child: Text(
                  "save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff99CCCC),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

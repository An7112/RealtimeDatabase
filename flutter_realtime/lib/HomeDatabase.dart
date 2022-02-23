import 'package:flutter/material.dart';
import 'package:flutter_realtime/EditDatabase.dart';

class HomeDatabase extends StatefulWidget {
  HomeDatabase({Key? key}) : super(key: key);

  @override
  State<HomeDatabase> createState() => _HomeDatabaseState();
}

class _HomeDatabaseState extends State<HomeDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff009966),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditDatabase(),
            ),
          );
        },
        child: Icon(
          Icons.person_add_alt,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Users',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EditDatabase(),
              ),
            );
          },
        ),
      ),
    );
  }
}

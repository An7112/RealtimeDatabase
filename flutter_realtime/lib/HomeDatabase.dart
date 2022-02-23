import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realtime/EditDatabase.dart';

class HomeDatabase extends StatefulWidget {
  HomeDatabase({Key? key}) : super(key: key);

  @override
  State<HomeDatabase> createState() => _HomeDatabaseState();
}

class _HomeDatabaseState extends State<HomeDatabase> {
  final RealtimeDatabase = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = RealtimeDatabase.ref().child('Users');
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
      body: FirebaseAnimatedList(
        query: ref, //Dữ liệu bên DatabaseCustom sẽ được đưa vào từ đây (ref)
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.indigo[100],
                  trailing: IconButton(
                    icon: Icon(
                      Icons.person_add_disabled_outlined,
                    ),
                    onPressed: () {
                      ref.child(snapshot.key!).remove();
                    },
                  ),
                  title: Text(
                    snapshot.value.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

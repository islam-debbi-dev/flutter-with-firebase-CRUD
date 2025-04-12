import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/api_firebase.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Display'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: ApiFirebase().streamPersonsFromFirestore(),
            builder: (context, snapshot) {
              List<Widget> teacherWidgets = [];
              if (snapshot.hasData) {
                final users = snapshot.data!.docs.toList();
                for (var user in users) {
                  final teacherWidget = Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            width: 250,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xFF33BBC5)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 25),
                              child: Text(
                                '${user['name']}                 ${user['email']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){
                     //     ApiFirebase.updatePersonInFirestore(user)
                        }, icon: Icon(Icons.update))
                      ],
                    ),
                  );
                  teacherWidgets.add(teacherWidget);
                }
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: teacherWidgets,
                    ),
                  ),
                ],
              );
            }));
  }
}

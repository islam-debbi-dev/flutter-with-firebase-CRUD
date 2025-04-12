import 'package:flutter/material.dart';
import 'package:flutter_right_setpes/services/api_firebase.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 70, right: 70),
            child: TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                hintStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IconButton(
              onPressed: () {
                ApiFirebase.deleteUserFromFirestore(idController.text);
                idController.clear();
              },
              icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}

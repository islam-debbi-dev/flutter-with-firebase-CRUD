import 'package:flutter/material.dart';

import '../models/person.dart';
import '../services/api_firebase.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late PersonModel person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              // Removed color property to avoid conflict with decoration
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.greenAccent]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: nameController,
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
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        hintText: 'Enter your age',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 34, 45, 55)),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  ElevatedButton.icon(
                      onPressed: () {
                        person = PersonModel(
                          id: nameController.text +
                              ageController.text +
                              emailController.text +
                              passwordController.text,
                          name: nameController.text,
                          age: ageController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        ApiFirebase.updatePersonInFirestore(person);
                        nameController.clear();
                        ageController.clear();
                        emailController.clear();
                        passwordController.clear();
                      },
                      icon: Icon(Icons.create, color: Colors.blue),
                      label: Text(
                        'Create',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, left: 75),
              child: Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

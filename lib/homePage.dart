import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: FlatButton(
          color: Colors.blue,
          onPressed: () {
            auth.authStateChanges().listen((User user) {
              if (user == null) {
                //Navigator.pop(context);
                print(user);
                print('User is currently signed out!');
              } else {
                Navigator.pop(context);
                auth.signOut();
                print('User is signed in!');
              }
            });
          },
          child: Text("signOut"),
        ),
      ),
    );
  }
}

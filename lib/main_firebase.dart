import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xuberance2021/ui/menu.dart';
import 'package:xuberance2021/ui/testing_homepage.dart';

class FirebaseInit extends StatefulWidget {
  @override
  _FirebaseInitState createState() => _FirebaseInitState();
}

class _FirebaseInitState extends State<FirebaseInit> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // TODO(xuberance-gh): add proper error handling.
          return Center(
            child: Text(
              "firebase init snapshot has error",
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: MenuPage(
              firestoreInstance: FirebaseFirestore.instance,
              authInstance: FirebaseAuth.instance,
            ),
          );
        } else {
          // TODO: Handle case where there is no internet connection.
          // TODO(xuberance-gh): Add loading screen.
          return Center(
            child: Text(
              "loading firebase",
            ),
          );
        }
      },
    );
  }
}

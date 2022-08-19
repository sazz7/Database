import 'package:firebase_core/firebase_core.dart';
import 'pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:_initialization,builder: (context, snapshot) {
      if(snapshot.hasError){
        print("Somthing went wrong");
      }
      if(snapshot.connectionState == ConnectionState.done){
        return MaterialApp(
          title: "Database",
          theme: ThemeData(
            primaryColor: Colors.teal,
          ),
          home: HomePage(),
        );
      }
      return CircularProgressIndicator();
    },);
  }
}

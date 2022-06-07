import 'package:database/pages/add_page.dart';
import 'package:database/pages/list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // final
  const HomePage({Key? key,
    // required
  }) : super (key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Database"),
          MaterialButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => AddPage()));
            },
            child: Text("Add",style: TextStyle(fontSize: 20),),
            color: Colors.white,
          )
        ],),
      ),
      body: ListPage()
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/pages/edit.dart';
import 'package:flutter/material.dart';

class ListUser extends StatefulWidget {

  const ListUser({Key? key,

  }) : super(key: key);
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection("user").snapshots();
  deleteUser(id){
    print("User Deleted $id");
  }
  @override
  
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            print("Somthing went wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // data read


          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(),
                  // Column width size
                  columnWidths: {
                    //Column index size
                    1: FixedColumnWidth(140),
                  },
                  //Table object position
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                        children: [
                          _tablecell(name: "Name",font: FontWeight.bold,color: Colors.greenAccent,fonts: 20),
                          _tablecell(name: "Email",font: FontWeight.bold,color: Colors.greenAccent,fonts: 20),
                          _tablecell(name: "Action",font: FontWeight.bold,color: Colors.greenAccent,fonts: 20),
                        ]
                    ),
                    TableRow(children: [
                      _tablecell(name: "name"),
                      _tablecell(name: "name@gmail.com"),
                      TableCell(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Edit()));
                            },
                            icon: Icon(Icons.edit,color: Colors.green),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.delete,color: Colors.red,),
                          ),
                        ],
                      ))
                    ])
                  ],
                ),
              ),
            ),
          );
        });
  }
}


class _tablecell extends StatelessWidget {
  final String name;
  final font;
  final color;
  final double? fonts;
  const _tablecell ({Key? key,
    required this.name,
    this.font,
    this.color,
    this.fonts,
  }) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return TableCell(child: Container(
      color: color,
      child: Center(child: Text(name,style: TextStyle(fontWeight: font,fontSize: fonts),)),
    ));
  }
}


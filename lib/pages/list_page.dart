import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              _tablecell(name: "name",font: FontWeight.normal),
              _tablecell(name: "name@gmail.com",font: FontWeight.normal),
              TableCell(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.delete),
                  ),
                ],
              ))
            ])
          ],
        ),
      ),
    );
  }
}

class _tablecell extends StatelessWidget {
  final String name;
  final font;
  final color;
  final double? fonts;
  const _tablecell ({Key? key,
    required this.name,
    required this.font,
    this.color,
    this.fonts,
  }) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return TableCell(child: Container(
      color: color,
      child: Text(name,style: TextStyle(fontWeight: font,fontSize: fonts),),
    ));
  }
}


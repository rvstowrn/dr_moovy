import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MachineDetailsPage extends StatefulWidget {
  MachineDetailsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MachineDetailsPageState createState() => _MachineDetailsPageState();
}

class _MachineDetailsPageState extends State<MachineDetailsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 55, 55, 1),
      body:SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.symmetric(vertical:5,horizontal:10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.teal[600],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DETAILS : Machine 1",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color:Colors.white,
                      fontSize: 15
                    ),
                  ),
                  Icon(Icons.reply,color: Colors.white,),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width-60,
              margin: const EdgeInsets.symmetric(horizontal:30),
              padding: const EdgeInsets.symmetric(vertical:5,horizontal:10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.teal[600],
              ),
              child: Text("Intoduction:\nPrecautions:\nUsage:",
                style: TextStyle(
                  fontSize: 15,
                  height: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}
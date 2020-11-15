import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  
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
                  Text("INFO",
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
              margin: const EdgeInsets.symmetric(horizontal:30),
              padding: const EdgeInsets.symmetric(vertical:5,horizontal:10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.teal[600],
              ),
              child: Text("Click on 'GO' to direct the robot to that particular machine. You can know more about the machine by clicking on 'details'.",
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
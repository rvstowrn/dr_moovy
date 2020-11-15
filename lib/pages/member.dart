import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  
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
                  Text("TEAM",
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
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal:30,vertical: 10),
                padding: const EdgeInsets.symmetric(vertical:5,horizontal:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.teal[600],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 250.0,
                      height: 250.0,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/faby_logo.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height:20),
                    Text("SHUBHAM AGGARWAL\nTEAM LEAD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height:30),
                    Text("DESCRIPTION",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 2,
                        color: Colors.grey[300],
                      ),
                    ),

                  ],
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}
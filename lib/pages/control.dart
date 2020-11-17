import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ControlPage extends StatefulWidget {
  ControlPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double screenWidth;
  double screenHeight;
  double videoContainerDimension;

  void setStates(context){
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
      videoContainerDimension = (screenWidth<screenHeight)?screenWidth:screenHeight;
      videoContainerDimension-=150;
    });
  }

  Widget vSpace(k){ return SizedBox(height: k*1.0,); }
  Widget hSpace(k){ return SizedBox(width: k*1.0,); }

  Widget appBar(context){
    return Container(
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.symmetric(vertical:5,horizontal:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.teal[600],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ROBOT CONTROL",
            style: TextStyle(
              fontWeight:FontWeight.bold,
              color:Colors.white,
              fontSize: 15
            ),
          ),
          GestureDetector(
            onTap: () {Navigator.pop(context);},
            child:Icon(Icons.reply,color: Colors.white,),
          )
        ],
      ),
    );
  }
  
  Widget videoContainer(){
    return Container(
      height: videoContainerDimension,
      width: videoContainerDimension,
      decoration: BoxDecoration(
          border: Border.all(width: 3,color: Colors.green),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.black,
      ),
    );
  }

  Widget navIcon(angle,icon){
    return GestureDetector(
      onTapDown: (var e) { },
      onTapUp: (var e) { },
      child: Transform.rotate(
        angle: angle * math.pi / 180,
        child: Icon(
          icon,
          color: Colors.red,
          size: 40,
        ),
      ),
    );
  }

  List<Widget> navigationBoard(){
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          navIcon(-135,Icons.play_circle_filled),
          hSpace(5),
          navIcon(-90,Icons.play_circle_filled),
          hSpace(5),
          navIcon(-45,Icons.play_circle_filled),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          navIcon(-180,Icons.play_circle_filled),
          hSpace(5),
          navIcon(90,Icons.adjust),
          hSpace(5),
          navIcon(0,Icons.play_circle_filled),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          navIcon(135,Icons.play_circle_filled),
          hSpace(5),
          navIcon(90,Icons.play_circle_filled),
          hSpace(5),
          navIcon(45,Icons.play_circle_filled),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          navIcon(0,Icons.rotate_left),
          hSpace(5),
          navIcon(0,Icons.rotate_right),
        ],
      ),
    ];
  }

  Widget portraitController(){
    return Column(
      children: [
        SizedBox(height:20),
        videoContainer(),
        vSpace(10),
        Expanded(child: Container()),
        ...navigationBoard(),
        vSpace(15)
      ],
    );
  }

  Widget landscapeController(){
    return Row(
      children: [
        hSpace(20),
        videoContainer(),
        hSpace(10),
        Expanded(child: Container()),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:navigationBoard(),
        ),
        hSpace(10),
      ],
    );
  }

  Widget returnController(){
    Orientation orientation = MediaQuery.of(context).orientation;
    return (orientation == Orientation.portrait)?portraitController():landscapeController();
  }

  Widget controllerCasing(){
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(30,0,30,20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.teal[600],
        ),
        child:returnController(),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    setStates(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 55, 55, 1),
      body:SafeArea(
        child: Column(
          children: [
            appBar(context),
            controllerCasing(),
          ],
        ),
      ),
    );
  }
}
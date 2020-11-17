import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../teamList.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  var maxHeight;
  var maxWidth;
  var containerWidth;
  var screenMode;

  void setStates(context){
    setState(() {
      maxHeight= MediaQuery.of(context).size.height;
      maxWidth= MediaQuery.of(context).size.width;
      containerWidth = MediaQuery.of(context).size.width/2-40;
      screenMode = "portrait"; 
    });
    if(maxWidth>maxHeight){
      setState(() { 
        containerWidth = (maxWidth-100)/4; 
        screenMode = "landscape"; 
      });
    }
  }
  
  Widget appbar(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:10),
      padding: const EdgeInsets.all(10),
      width: maxWidth-20,
      decoration: BoxDecoration(
        color: Colors.teal[600],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
          GestureDetector(
            onTap: () {Navigator.pop(context);},
            child:Icon(Icons.reply,color: Colors.white,),
          )
        ],
      ),
    );
  }

  Widget teamText(str,size,space){
    return Text(str,
      style: TextStyle(
        fontSize:size.toDouble(),
        color: Colors.white,
        letterSpacing: space.toDouble(),
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget teamWidget(teamObj){
    return Container(
      width: containerWidth,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal[600],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children:[
          Image.asset("assets/${teamObj['imgsrc']}"),
          teamText(teamObj["name"],14,0),          
          teamText(teamObj["role"],14,0),          
        ],
      ),
    );
  }

  List<Widget> createTeamLayout(context){
    int elementsInRow = (screenMode == "portrait")? 2 : 4;
    int listLength = teamList.length;
    int noOfRows = (listLength/elementsInRow).ceil();
    int index = 0;
    List<Widget> teamLayout = new List(); 
    teamLayout.add(appbar(context));
    for(int i= 0 ; i < noOfRows ; i++){
      List<Widget> rowChildren = new List(); 
      for(int j=0;j<elementsInRow && index!=listLength;j++){
        rowChildren.add(teamWidget(teamList[index]));
        index++;
      }
      teamLayout.add(Row(children: rowChildren));
    }
    return teamLayout;
  } 

  @override
  Widget build(BuildContext context) {
    setStates(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 55, 55, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30,20,30,20),
          child:Column(
            children:createTeamLayout(context),
          ),
        ),
      ),
    );
  }

}
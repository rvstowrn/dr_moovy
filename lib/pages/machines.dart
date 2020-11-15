import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../machineList.dart';

class MachinesPage extends StatefulWidget {
  @override
  _MachinesPageState createState() => _MachinesPageState();
}

class _MachinesPageState extends State<MachinesPage> {
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
  
  Widget appbar() {
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
          Row(
            children: [
              Text("MACHINES",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  color:Colors.white,
                  fontSize: 15
                ),
              ),
              SizedBox(width:5),
              Icon(Icons.info,color: Colors.white,),
            ],
          ),
          Icon(Icons.reply,color: Colors.white,),
        ],
      ),
    );
  }

  Widget machineText(str,size,space){
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

  Widget machineWidget(machineObj){
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
          machineText(machineObj["name"],14,0),          
          SizedBox(height:10),
          RaisedButton(
            color: Colors.greenAccent[400],
            child:machineText("GO",15,1),
            onPressed: (){},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          RaisedButton(
            color: Colors.green[700],
            child:machineText("details",15,1),
            onPressed: (){},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> createMachineLayout(){
    int elementsInRow = (screenMode == "portrait")? 2 : 4;
    int listLength = machineList.length;
    int noOfRows = (listLength/elementsInRow).ceil();
    int index = 0;
    List<Widget> machineLayout = new List(); 
    machineLayout.add(appbar());
    for(int i= 0 ; i < noOfRows ; i++){
      List<Widget> rowChildren = new List(); 
      for(int j=0;j<elementsInRow && index!=listLength;j++){
        rowChildren.add(machineWidget(machineList[index]));
        index++;
      }
      machineLayout.add(Row(children: rowChildren));
    }
    return machineLayout;
  } 

  @override
  Widget build(BuildContext context) {
    setStates(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 55, 55, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30,5,30,20),
          child:Column(
            children:createMachineLayout(),
          ),
        ),
      ),
    );
  }

}
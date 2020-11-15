import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  var ht,wt,hp,wp,hl,wl;

  Widget button() {
    return Material(
      color: Colors.blueGrey[900],
      child: IconButton(
        icon: Icon(Icons.keyboard_arrow_left),
        color: Colors.lightGreen,
        splashColor: Colors.red,
        padding: EdgeInsets.all(10),
        onPressed: () {},
      ),
    );
  }

  Widget team(h,w,name,img,htimg) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      height: h,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5.2,),],
        color: Colors.teal[800],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            radius: htimg,
            backgroundImage: img,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: ht*0.05,
            ),
          ),
        ],
      ),
    );
  }

  Widget row(h,w,name1,name2,img,htimg) {
    return Material(
      color: Colors.blueGrey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          team(h, w, name1, img,htimg),
          team(h, w, name2, img,htimg),
        ],
      ),
    );
  }

  Widget appbar(ha,wa) {
    return Container(
      child: Card(
        color: Colors.teal[800],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: Container(
          height: ha,
          width: wa,
          child: Center(
            child: Text('TEAM MEMBERS', style: TextStyle(
                color: Colors.white70, fontWeight: FontWeight.bold,fontSize: ht*0.03)),
          ),
        ),
      ),
    );
  }

  Widget portrait(ha,wa,h,w,htimg) {
    return Material(
      child: Container(
        height: ht,
        width: wt,
        color: Colors.blueGrey[900],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              button(),
              appbar(ha, wa),
              row(h, w, 'A','X', AssetImage(''),htimg),
              row(h, w, 'B','Y', AssetImage(''),htimg),
              row(h, w, 'C','Z', AssetImage(''),htimg),
            ],
          ),
        ),
      ),
    );
  }

  Widget landscape() {
    return Material(
      child: portrait(ht*0.2,wt*0.9,hl,wl,ht*0.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    hp = ht*0.2;
    wp = wt*0.4;
    hl = ht*0.4;
    wl = wt*0.4;
    return MaterialApp(
      home: OrientationBuilder(
        builder: (context,orientation) {
          if (orientation == Orientation.portrait){
            return portrait(ht*0.1,wt*0.9,hp,wp,ht*0.05);
          }else{
            return landscape();
          }
        },
      ),
    );
  }
}

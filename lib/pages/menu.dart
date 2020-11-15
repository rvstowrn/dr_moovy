import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var screenHeight;
  var screenWidth;

  Widget casing(elements){
    return Container(
      margin: const EdgeInsets.symmetric(vertical:5), 
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:elements,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey[700],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }

  Widget txtElement(str){
    return Text(str,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget instaButton(str,pressHandler){
    List<Color> instaGradient = [
      Color.fromRGBO(255, 235, 59, 1),
      Color.fromRGBO(239, 108, 0, 1),
      Color.fromRGBO(173, 20, 87, 1),
      Color.fromRGBO(49, 27, 146, 1)
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: instaGradient,
          stops: [0.12,0.4,0.8,1.0],
          tileMode: TileMode.clamp,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical:20),
        onPressed: pressHandler,
        child:txtElement(str),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      )
    );
  }
  
  Widget menuButton(str,btncolor,pressHandler){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: RaisedButton(
        padding: const EdgeInsets.symmetric(vertical:20),
        color: btncolor,
        onPressed: pressHandler,
        child:txtElement(str),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      )
    );
  }

  Widget vSpace(k){
    return SizedBox(height:k*1.0);
  }

  Widget base() {
    List<Widget> robotElements = [vSpace(5),txtElement('ROBOT STATUS'),vSpace(5),menuButton("available", Colors.green,(){})];
    List<Widget> machineSingleton = [menuButton("MACHINES", Colors.brown[400],(){})];
    List<Widget> controllerSingleton = [menuButton("CONTROLLER", Colors.orange[700],(){})];
    List<Widget> optionElements = [
      menuButton("SUGGESTIONS", Colors.blue[700],(){}),
      menuButton("ABOUT US", Colors.grey[400],(){}),
      instaButton("@fablab_faby",(){}),
      menuButton("faby.tech", Colors.green[700],(){}),
      menuButton("LOGOUT", Colors.deepOrangeAccent[700],(){})
    ];
    return Material(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.blueGrey[900],
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: <Widget>[
            vSpace(20),
            casing(robotElements),
            vSpace(20),
            casing(machineSingleton),
            casing(controllerSingleton),
            vSpace(20),
            casing(optionElements),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      screenHeight = MediaQuery.of(context).size.height;
      screenWidth = MediaQuery.of(context).size.width;
    });
    return base();
  }

}












// Krishna Menu Code

// class MenuPage extends StatefulWidget {
//   @override
//   _MenuPageState createState() => _MenuPageState();
// }

// class _MenuPageState extends State<MenuPage> {
//   var ht,wt;

//   Widget button() {
//     return Material(
//       color: Colors.blueGrey[900],
//       child: IconButton(
//         icon: Icon(Icons.keyboard_arrow_left),
//         color: Colors.lightGreen,
//         splashColor: Colors.red,
//         padding: EdgeInsets.all(10),
//         onPressed: () {},
//       ),
//     );
//   }

//   Widget cards(h,w,p,s,ftsz,col) {
//     return Material(
//       child: Container(
//         height: h,
//         width: w,
//         padding: EdgeInsets.all(p),
//         child: RaisedButton(
//           textColor: Colors.white70,
//           onPressed: () {},
//           child: Text(s,style: TextStyle(
//             fontSize: ftsz,
//             fontWeight: FontWeight.bold,
//           ),),
//           color: col,
//         ),
//       ),
//     );
//   }

//   Widget first(h,w,p,s,ftsz,col) {
//     return Container(
//       height: h,
//       width: w,
//       color: Colors.black87,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Text(
//             'ROBOT STATUS',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: ftsz,
//             ),
//           ),
//           cards(h, w, p, s, ftsz, col)
//         ],
//       ),
//     );
//   }

//   Widget portrait(h,w,p,ftsz) {
//     return Material(
//       child: Container(
//         height: ht,
//         width: wt,
//         color: Colors.blueGrey[900],
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Padding(padding: EdgeInsets.all(10)),
//               button(),
//               first(h, w, p, 'ACTIVE', ftsz, Colors.lightGreenAccent),
//               cards(h, w, p, 'MACHINES', ftsz, Colors.brown),
//               cards(h, w, p, 'CONTROLLER', ftsz, Colors.orangeAccent),
//               cards(h, w, p, 'SUGGESTIONS', ftsz, Colors.blueAccent),
//               cards(h, w, p, 'ABOUT US', ftsz, Colors.grey),
//               cards(h, w, p, 'INSTAGRAM', ftsz, [
//                 Color(0xFFFFCC80),
//                 Color(0xFFFFB74D),
//                 Color(0xFFFF5722),
//                 Color(0xFFF44336),
//                 Color(0xFFD50000),
//                 Color(0xFFEC407A),
//                 Color(0xFFC51162),
//                 Color(0xFF8E24AA),
//                 Color(0xFF651FFF),
//                 Color(0xFF2962FF),
//               ]),
//               cards(h, w, p, 'faby.tech', ftsz, Colors.lightGreen),
//               cards(h, w, p, 'LOG OUT', ftsz, Colors.brown),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget landscape() {
//     return portrait(ht*0.2,wt*0.85,ht*0.2,ht*0.1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     ht = MediaQuery.of(context).size.height;
//     wt = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: OrientationBuilder(
//         builder: (context,orientation) {
//           if (orientation == Orientation.portrait){
//             return portrait(ht*0.1,wt*0.85,ht*0.1,ht*0.05);
//           }else{
//             return landscape();
//           }
//         },
//       ),
//     );
//   }
// }

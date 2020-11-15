import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var maxWidth;
  var maxHeight;

  void setDimensions(context){
    setState(() {
      maxHeight = MediaQuery.of(context).size.height;
      maxWidth= MediaQuery.of(context).size.width;
    });
    if(maxWidth>maxHeight){
      setState(() { maxHeight = maxWidth; });
    }
  }

  Widget vSpace(k){
    return SizedBox(height:k*1.0);
  }

  Widget label(str) {
    return Text(str,
      style: TextStyle(
        fontSize:20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4,
        color: Colors.white70,
      ),
    );
  }
  
  Widget input(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius:const BorderRadius.all(
          const Radius.circular(30.0),
        ), 
      ),
      margin: const EdgeInsets.symmetric(horizontal:40),
      child:new Theme(
        data: new ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child:TextField(
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.grey[200]
          ),
          decoration: InputDecoration(
            border: new UnderlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            fillColor: Colors.black87,
            filled: true,
          ),
        ),
      ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    setDimensions(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 55, 55, 1),
      body:SingleChildScrollView (
        child:Container( 
          height: maxHeight,
          width: maxWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              CircleAvatar(
                radius: 75.0,
                child:Image.asset('assets/faby_logo.png'),
              ),
              vSpace(40),
              label("username"),
              vSpace(10),
              input(),
              vSpace(20),
              label("password"),
              vSpace(10),
              input(),
              vSpace(20),
              RaisedButton(
                onPressed: (){},
                color: Colors.green,
                elevation: 10,
                child: Text('LOGIN',
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}






// KRISHNA CODE


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {

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

//   Widget image(h,w) {
//     return Container(
//       height: h,
//       width: w,
//       child: Image.asset(''),
//     );
//   }

//   Widget login(s,h,w) {
//     return Material(
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Text(
//               s,
//               style: TextStyle(
//                 color: Colors.white70,
//               ),
//             ),
//             Container(
//               height: h,
//               width: w,
//               child: TextFormField(
//                 style: TextStyle(color: Colors.white70),
//                 decoration: InputDecoration(
//                   focusColor: Colors.black87,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.redAccent),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget raisebutton(hr,wr,ftsz) {
//     return Container(
//       height: hr,
//       width: wr,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(15.0)),
//       ),
//       child: RaisedButton(
//         onPressed: () {},
//         child: Text('LOGIN', style: TextStyle(
//           color: Colors.white70,
//           fontWeight: FontWeight.bold,
//           fontSize: ftsz,
//         ),),
//         color: Colors.lightGreenAccent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//         ),
//       ),
//     );
//   }

//   Widget portrait(hi,wi,hl,wl,hr,wr,ftsz) {
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
//               image(hi, wi),
//               login('USERNAME', hl, wl),
//               login('PASSWORD', hl, wl),
//               raisebutton(hr, wr, ftsz),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget landscape() {
//     return portrait(ht*0.4,wt*0.4,ht*0.2,wt*0.8,ht*0.2,wt*0.1,ht*0.2);
//   }

//   @override
//   Widget build(BuildContext context) {
//     ht = MediaQuery.of(context).size.height;
//     wt = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: OrientationBuilder(
//         builder: (context,orientation) {
//           if (orientation == Orientation.portrait){
//             return portrait(ht*0.2,wt*0.4,ht*0.1,wt*0.8,ht*0.1,wt*0.1,ht*0.1);
//           }else{
//             return landscape();
//           }
//         },
//       ),
//     );
//   }
// }
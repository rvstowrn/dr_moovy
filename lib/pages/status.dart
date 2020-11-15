// import 'package:flutter/material.dart';
// import 'package:flutter_thermometer/thermometer.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';


// // void main() {
// //   runApp(Battery());
// // }


// class Battery extends StatefulWidget {
//   @override
//   _BatteryState createState() => _BatteryState();
// }

// class _BatteryState extends State<Battery> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BatteryPage(),
//     );
//   }
// }

// class BatteryPage extends StatefulWidget {
//   @override
//   _BatteryPageState createState() => _BatteryPageState();
// }

// class _BatteryPageState extends State<BatteryPage> {
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


//   Widget battery(vb,s) {
//     return Material(
//       child: Container(
//         height: 400,
//         width: 300,
//         color: Colors.blueGrey[900],
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             SfRadialGauge(
//               axes: <RadialAxis>[
//                 RadialAxis(minimum: 0, maximum: 100,
//                 ranges: <GaugeRange>[
//                   GaugeRange(startValue: 0, endValue: 50, color:Colors.lightGreen),
//                   GaugeRange(startValue: 0, endValue: 50, color:Colors.orangeAccent),
//                   GaugeRange(startValue: 0, endValue: 50, color:Colors.redAccent),
//                 ],
//                   pointers: <GaugePointer>[
//                     NeedlePointer(value: vb),
//                   ],
//                   annotations: <GaugeAnnotation>[
//                     GaugeAnnotation(
//                       widget: Container(
//                         child: Text(s,style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold,color: Colors.white70),),
//                       )
//                     )
//                   ]
//                 ),

//               ],
//             ),
//             Text(
//               'BATTERY',
//               style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold,color: Colors.white70),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget thermometer(v,s) {
//     return Material(
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 200,
//             width: 100,
//             child: Thermometer(
//               value: v,
//               minValue: 0,
//               maxValue: 100,
//               backgroundColor: Colors.blueGrey[900],
//               mercuryColor: Colors.orangeAccent,
//             ),
//           ),
//           Text(s,style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold,color: Colors.white70),)
//         ],
//       ),
//     );
//   }

//   Widget temperature() {
//     return Material(
//       child: Container(
//         height: 300,
//         width: 300,
//         color: Colors.blueGrey[900],
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text('TEMPERATURE',style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.white70),),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   thermometer(50.0,'Raspberry Pi'),
//                   thermometer(70.0,'Arduino'),
//                   thermometer(30.0,'Motors'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget portrait() {
//     return Material(
//       child: Container(
//         height: ht,
//         width: wt,
//         color: Colors.blueGrey[900],
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               button(),
//               temperature(),
//               Padding(padding: EdgeInsets.all(20.0)),
//               battery(70.0,'70.0'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget landscape() {
//     return Material(
//       child: Container(
//         height: ht,
//         width: wt,
//         color: Colors.blueGrey[900],
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               button(),
//               temperature(),
//               Padding(padding: EdgeInsets.all(20.0)),
//               battery(70.0,'70.0'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     ht = MediaQuery.of(context).size.height;
//     wt = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: OrientationBuilder(
//         builder: (context,orientation) {
//           if (orientation == Orientation.portrait){
//             return portrait();
//           }else{
//             return landscape();
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_thermometer/thermometer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  
  Widget appBar(context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:20,vertical:10),
      padding: const EdgeInsets.symmetric(vertical:5,horizontal:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.teal[600],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("STATUS",
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

  Widget sectionHeading(str,align){
    return Text(str,
      style: TextStyle(
        color:Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1
      ),
      textAlign: align,
    );
  }

  Widget thermometer(val,str){
    return Expanded(
      child:Column(
        children: [
          Container(
            height:150,
            child: Thermometer(
              value: val,
              minValue: 0,
              maxValue: 100,
              mercuryColor: Colors.orangeAccent,
            ),
          ),
          SizedBox(height:3),
          Text(str,
            style: TextStyle(
              color:Colors.white
            ),
          ),
        ],
      ),
    );
  }

  Widget batteryGauge(val){
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          pointers: <GaugePointer>[NeedlePointer(value: val)],
          radiusFactor: 0.9,
          startAngle: 180,
          endAngle: 0,
          minimum: 0, 
          maximum: 100,
          ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 25, color:Colors.red,startWidth: 20,endWidth: 20),
            GaugeRange(startValue: 25,endValue: 50,color: Colors.yellow,startWidth: 20,endWidth: 20),
            GaugeRange(startValue: 50,endValue: 75,color: Colors.orange,startWidth: 20,endWidth: 20),
            GaugeRange(startValue: 75,endValue: 100,color: Colors.green,startWidth: 20,endWidth: 20)
          ],
        )
      ],
    );
  }

  Widget batterySection(){
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color.fromRGBO(90,90,90,1),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          sectionHeading("BATTERY", TextAlign.center),
          batteryGauge(65.0),
        ],
      ),
    );
  }
  
  Widget temperatureSection(){
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color.fromRGBO(90,90,90,1),
      ),
      child: Column(
        children: [
          Expanded(child: sectionHeading("TEMPERATURE", TextAlign.center),),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children:[
              thermometer(20.0,"BATTERY"),
              thermometer(30.0,"PI"),
              thermometer(40.0,"ARDUINO"),
            ]
          ),
        ],
      ),
    );
  }

  List<Widget> statusSections(context){
    return [
      Expanded(child: batterySection()),
      Expanded(child: temperatureSection()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(55,55,55,1),
      body: SafeArea(
        child: Column(
          children: [
            appBar(context),
            Expanded(
              child: OrientationBuilder(
                builder: (context,orientation) {
                  if (orientation == Orientation.portrait){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:statusSections(context)
                    );
                  }else{
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:statusSections(context)
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class StatusPagePage extends StatefulWidget {
//   @override
//   _StatusPagePageState createState() => _StatusPagePageState();
// }

// class _StatusPagePageState extends State<StatusPagePage> {
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

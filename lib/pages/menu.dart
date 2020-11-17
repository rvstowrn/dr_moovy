import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var screenHeight;
  var screenWidth;
  var menuContext;
  
  dynamic navigate(route){
    return () => {
      Navigator.pushNamed(context,route)
    };
  }

  dynamic logoutHandler(){
    return () => {
      Navigator.pushNamed(context,"/login")
    };
  }

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
    List<Widget> robotElements = [vSpace(5),txtElement('ROBOT STATUS'),vSpace(5),menuButton("available",Colors.green,navigate('/status'))];
    List<Widget> machineSingleton = [menuButton("MACHINES", Colors.brown[400],navigate("/machines"))];
    List<Widget> controllerSingleton = [menuButton("CONTROLLER", Colors.orange[700],navigate("/control"))];
    List<Widget> optionElements = [
      menuButton("SUGGESTIONS", Colors.blue[700],navigate("/suggestion")),
      menuButton("ABOUT US", Colors.grey[400],navigate("/team")),
      instaButton("@fablab_faby",(){}),
      menuButton("faby.tech", Colors.green[700],(){}),
      menuButton("LOGOUT", Colors.deepOrangeAccent[700],logoutHandler())
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
      menuContext = context;
    });
    return base();
  }
}
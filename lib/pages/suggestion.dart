import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestionPage extends StatefulWidget {
  SuggestionPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  var maxHeight;
  var maxWidth;

  void setDimensions(context){
    setState(() {
      maxHeight = MediaQuery.of(context).size.height;
      maxWidth= MediaQuery.of(context).size.width;
    });
    if(maxWidth>maxHeight){
      setState(() { maxHeight = maxWidth; });
    }
  }

  Widget suggestionButton(str,color){
    return RaisedButton(
      padding: const EdgeInsets.all(5),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(str,
        style: TextStyle(
          color:Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      color: color,
      onPressed: () {},  
    );
  }

  Widget inputField(lines,hint){
    return TextField(
      textAlign: TextAlign.center,
      minLines: lines,
      maxLines: lines,
      style: new TextStyle(
        fontSize: 16.0,
        color: Colors.grey[800]
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize:20,),
        fillColor: Colors.grey[300],
        filled: true,
      ),
    );
  }
  
  Widget build(BuildContext context) {
    setDimensions(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 55, 55, 1),
      body:SingleChildScrollView(
        child:Container(
          height: maxHeight,
          width: maxWidth,
          child:Column(
            children:[
              Expanded(
                flex:1,
                child:Container(
                  padding: const EdgeInsets.symmetric(horizontal:20,vertical:40),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal:10),
                    color: Colors.teal[700],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SUGGESTIONS",
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
                ),
              ),
              Expanded(
                flex:1,
                child:Container(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: inputField(4, "SUBJECT")
                ),
              ),
              Expanded(
                flex:2,
                child:Container(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: inputField(14, "DESCRIPTION"),
                ),
              ),
              Expanded(
                flex:1,
                child:Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      suggestionButton("CANCEL", Colors.red),
                      suggestionButton("SUBMIT", Colors.green),
                    ],
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
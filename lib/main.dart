import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/directory.dart';
void main() => runApp(AppBase());

class AppBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr Moovy',
      initialRoute: '/menu',
      routes: {
        '/splash': (context) => SplashPage(),                   // UI [], CODE [], LOGIC []
        '/login': (context) => LoginPage(),                     // UI [], CODE [], LOGIC []  
        // '/status': (context) => StatusPage(),                   // UI [], CODE [], LOGIC [] left
        '/menu': (context) => MenuPage(),                       // UI [], CODE [], LOGIC []
        '/suggestion': (context) => SuggestionPage(),           // UI [], CODE [], LOGIC []
        '/feedback': (context) => FeedbackPage(),               // UI [], CODE [], LOGIC []
        '/machines': (context) => MachinesPage(),               // UI [], CODE [], LOGIC []
        '/machinedetails': (context) => MachineDetailsPage(),   // UI [], CODE [], LOGIC [] 
        '/info': (context) => InfoPage(),                       // UI [], CODE [], LOGIC []
        '/team': (context) => TeamPage(),                       // UI [], CODE [], LOGIC [] half
        '/member': (context) => MemberPage(),                   // UI [], CODE [], LOGIC [] 
        '/control': (context) => ControlPage(),                 // UI [], CODE [], LOGIC [] left
      },
    );
  }
}

// WORK
// Globals (appbar,vspace,hspace,setStates)
// Test on different screen sizes 
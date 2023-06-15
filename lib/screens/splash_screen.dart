import 'dart:async';

import 'package:flutter/material.dart';

import 'package:free_man/main.dart';
import 'package:free_man/features/auth/auth.dart';
import 'package:free_man/services/user_service.dart';
class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
 String token="";

  gettoken()async{
  token=await getToken();
}
late Timer timer;
  nave(){
    timer=Timer(Duration(seconds: 3), () {Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
     return token!=""?HomePage():AuthScreen();
    }), (route) => false);});
  }
@override
  void initState() {
   gettoken();
   nave();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(


      child: Image.asset('assets/splash.jpg' ),


      ),
    );
  }
}

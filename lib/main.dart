



import 'package:free_man/screens/GG.dart';
import 'package:free_man/screens/drawar.dart';
import 'package:free_man/screens/some_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:free_man/features/auth/auth.dart';
import 'package:free_man/screens/splash_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

import 'package:flutter/material.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'GG',
      debugShowCheckedModeBanner: false,

      home:SplashScreen1(),
    );
  }
}

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selcetitem=0;
  String name='';
  String email='';
  getuser()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      email=  pref.getString('email')!;
      name=   pref.getString('name')!;
    });
  }
  @override
  void initState() {
    getuser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:_selcetitem==1?const SomeScreen():GG(),
      bottomNavigationBar: DotNavigationBar(
          currentIndex: _selcetitem,
          items: [
            DotNavigationBarItem(
                icon: Icon(Icons.home),
                selectedColor: Color(0xFFF1f94aa),
                unselectedColor: Colors.grey),
            DotNavigationBarItem(
                icon: Icon(Icons.favorite),
                selectedColor: Colors.redAccent,
                unselectedColor: Colors.grey),

          ],
          onTap: (i) async {
            setState(() {
              _selcetitem = i;
            });
          }),

      drawer: Drawer1(name:name,email:email),
    );

  }
}

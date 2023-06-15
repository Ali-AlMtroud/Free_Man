import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:free_man/models/api_response.dart';
import 'package:free_man/models/user.dart';
import 'package:free_man/features/auth/auth.dart';
import 'package:free_man/services/user_service.dart';


class Drawer1 extends StatefulWidget {
  final name;
  final email;

  const Drawer1({ key, required this.name, required this.email});

  @override
  _Drawer1State createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {

@override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 8),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFFF1f94aa)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListTile(
                  leading:  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/user1.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                  title: Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                   widget.email,
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text('recode out from app'),
            leading: Icon(Icons.logout),
            onTap: () {
              logout().then((value) => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) =>AuthScreen(),
                    ),
                        (route) => false)
              });
              }
          ),
          Divider(
            color: Colors.grey,
          ),
          ExpansionTile(title:Text("Contact info"),leading: Icon(Icons.contact_support),children: [
           Container(
            color:Color(0xFFF1f94aa).withOpacity(0.3), //Colors.black12,

             child: Column(
               children: [
                 ListTile(

                   title: Text(
                     'Phone',
                     style: TextStyle(
                       fontSize: 20,
                       fontFamily: 'RobotoCondensed',

                     ),
                   ),
                   subtitle: Text('+963654515650'),
                   leading: Icon(Icons.phone),
                   onTap: () {},

                 ),
                 Divider(
                   color: Colors.grey,
                 ),
                 ListTile(

                   title: Text(
                     'facebook',
                     style: TextStyle(
                       fontSize: 20,
                       fontFamily: 'RobotoCondensed',

                     ),
                   ),
                   subtitle: Text('Www.facebook.com/ecommerce'),
                   leading: Icon(Icons.attach_email_outlined),
                   onTap: () {},

                 )
               ],
             ),
           )
          ],)
        ],
      ),
      elevation: 5,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:free_man/core/config/constant.dart';
import 'package:free_man/models/api_response.dart';
import 'package:free_man/models/user.dart';
import 'package:free_man/services/user_service.dart';
import 'package:http/http.dart' as http;
import '../../../main.dart';
import 'decoration_functions.dart';
import 'sign_in_up_bar.dart';
import 'title.dart';

class Register extends StatefulWidget {
  Register({Key? key, required this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _Fname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _jobTitle = TextEditingController();
  TextEditingController _Lname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _location = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();
  bool Unvisible = true;
  bool loading = false;

//--------------- handel api-------------
  void _registerUser() async {
    ApiResponse response = await register(
      _Fname.text,
      _Lname.text,
      _email.text,
      _password.text,
    );
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      showSnackBar(context, response.error.toString());
    }
  }

  // Save and redirect to home
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    await pref.setString('email', user.email ?? "");
    await pref.setString('Fname', user.Fname ?? "");
    await pref.setString('Lname', user.Lname ?? "");
    await pref.setString('phone', user.phone ?? "");
    await pref.setString('jobTitle', user.jobTittle ?? "");
    await pref.setString('location', user.location ?? "");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => HomePage()), (route) => false);
  }

//-------------------------------------end--------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LoginTitle(
                title: 'Create\nAccount',
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Form(
              key: _key,
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: _Fname,
                        validator: (str) {
                          if (str == "") {
                            return 'First Name is require';
                          }
                          return null;
                        },
                        decoration:
                        registerInputDecoration(hintText: 'First Name'),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: _Fname,
                        validator: (str) {
                          if (str == "") {
                            return 'Last Name is require';
                          }
                          return null;
                        },
                        decoration:
                        registerInputDecoration(hintText: 'Last  Name'),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        validator: (str) {
                          if (str == "") {
                            return 'Email is require';
                          }
                          if (!str!.contains('@')) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        decoration: registerInputDecoration(hintText: 'Email'),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                        controller: _password,
                        validator: (str) {
                          if (str == "" || str!.length < 8) {
                            return 'Password is short';
                          }
                          return null;
                        },
                        obscureText: Unvisible,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 10),
                            hintStyle: const TextStyle(
                                fontSize: 18, color: Colors.white60),
                            hintText: 'password',
                            suffixIcon: IconButton(
                              icon: Icon(Unvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  Unvisible = !Unvisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white)))),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _email,
                        validator: (str) {
                          if (str == "") {
                            return 'Email is require';
                          }
                          if (!str!.contains('@')) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        decoration: registerInputDecoration(hintText: 'Email'),
                      )),
                  SignUpBar(
                    label: 'Sign up',
                    isLoading: loading,
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        _registerUser();
                        setState(() {
                          loading = !loading;
                        });
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        widget.onSignInPressed?.call();
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

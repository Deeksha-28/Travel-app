import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/SignUp.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHRyYXZlbCUyMGxvZ2luJTIwcGFnZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              fit: BoxFit.cover,

            ),
          ),

          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,

                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Email';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  prefixIcon: Icon(Icons.email)),
                              onSaved: (input) => _email = input),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.length < 6)
                                  return 'Provide Minimum 6 Character';
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                  fontSize: 18
                                ),

                                prefixIcon: Icon(Icons.lock)
                                ,
                                fillColor: Colors.white,

                              ),
                              obscureText: true,
                              onSaved: (input) => _password = input,),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: login,
                          child: Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Text('Create an Account?',
                    style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.white, fontSize: 20, ),
                ),),
                  onTap: navigateToSignUp,
                )
              ],
            ),
          ),
        ),

    );

  }
}

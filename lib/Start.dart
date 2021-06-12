import 'package:app/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'SignUp.dart';
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
        await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
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
                  "https://images.unsplash.com/photo-1535392432937-a27c36ec07b5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aGF3YWlpfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              fit: BoxFit.cover,

            ),
          ),
        child: Column(
          children:<Widget>[

            SizedBox(height: 35.0),
            Container(
              height: 260,

            ),
            RichText(
              text: TextSpan(
                text: 'Welcome to', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),

                  children:<TextSpan>[
                    TextSpan(
                    text:"Trescape", style: TextStyle(
                        fontSize:30.0,
                        fontWeight: FontWeight.bold, color: Colors.pink, fontStyle: FontStyle.italic))
                  ]
              )
            ),
            SizedBox(height: 10.0),


            SizedBox(height: 100.0),

          Row( mainAxisAlignment: MainAxisAlignment.center,

            children:<Widget>[
              RaisedButton(
                padding: EdgeInsets.only(left: 30,right: 30),
                onPressed: navigateToLogin,
              child: Text('Login',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.pinkAccent,
              ),

              SizedBox(width:20.0),
              RaisedButton(
                padding: EdgeInsets.only(left: 30,right: 30),
                onPressed: navigateToSignUp,
                child: Text('Register',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.pinkAccent,
              ),

            ]
          ),
            SizedBox(height:20.0),
            SignInButton(Buttons.Google,
              text: "Sign up with Google",
              onPressed: googleSignIn)
          ]

        )
      ),

    );
  }
}

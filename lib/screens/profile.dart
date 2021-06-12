import 'package:app/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState()=> _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Start()));
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }
  List<IconData> _icons = [
    FontAwesomeIcons.edit,

    FontAwesomeIcons.user,
    FontAwesomeIcons.biking,
  ];

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: !isloggedin
              ? CircularProgressIndicator()
              : Column(
            children: <Widget>[

              SizedBox(height: 40.0),




                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage('https://images.unsplash.com/photo-1474978528675-4a50a4508dc3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                ),






              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),



        ListTile(



          title: Text('Deeksha ',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: Colors.white, fontSize: 18, )
            ),),





        ),
        Divider(
          color: Colors.white,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          title: Text('Email: ${user.email} ',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: Colors.white, fontSize: 18, )
            ),),



        ),
        Divider(
          color: Colors.white,

          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
              SizedBox(height: 50.0),

              RaisedButton(
                padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                onPressed: signOut,
                child: Text('Signout',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.black, fontSize: 22, ),
                  ),),
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )
            ],
          ),
        ),
    backgroundColor: Colors.black,);
  }
}

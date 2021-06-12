
import 'package:app/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Start.dart';

import 'package:app/screens/explore_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/map_screen.dart';
import 'package:app/components/app_bar.dart';
import 'package:app/components/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
   User firebaseUser= _auth.currentUser;
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
  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    //Center(child: Text('Home Screen')),
    HomeScreen(),
    Explore(),
    Map_screen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: appBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: SizedBox(
        height: 75.0,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.globe),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.compass),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.locationArrow),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              title: Text(''),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.pink[400],
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          iconSize: 30.0,
          elevation: 0.0,
          backgroundColor: Colors.grey[850],
        ),
      ),
    );
  }

}

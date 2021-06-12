import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/home_screen.dart';
import '../screens/profile.dart';
import '../screens/explore_screen.dart';
Widget drawer() {

  return Container(
    child: Drawer(
      child: Container(
        color: Colors.grey[400],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    'Trescape',
                      style: GoogleFonts.lora(
                        textStyle: TextStyle(color: Colors.white, fontSize:30,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                      ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[

                  ListTile(
                    title: Text('Home',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.black, fontSize: 18, )
                    ),),

                    onTap: () => HomeScreen(),


                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    title: Text('Explore',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black, fontSize: 18, )
                    ),),
                    onTap: () => Explore(),


                  ),
                  Divider(
                    color: Colors.black,

                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    title: Text('Logout',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.black, fontSize: 18, )
                      ),),


                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],)
            ),
          ],
        ),
      ),
    ),
  );
}

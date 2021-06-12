import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/explore_screen.dart';
Widget appBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.black38,
    toolbarHeight: 70,





    title: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
        child: Text(
          'Trescape',
          style: GoogleFonts.lora(
            textStyle: TextStyle(color: Colors.black, fontSize: 40, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    titleSpacing: 00.0,
    centerTitle: true,


    actions: <Widget>[

      IconButton(
        icon: Icon(
          Icons.favorite,
          color: Colors.pink,
        ),
        onPressed: () => {

        },
      ),
    ],
  );
}

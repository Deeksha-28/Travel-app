import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/components/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activity.dart';

class Explore extends StatelessWidget {
  var i =2;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(


      child: Column(
        children: <Widget>[
          Container(

            color: Colors.black,
            child: SizedBox(


              height: 50.0,
              child:  Row(






                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(


                    child: Text('Discover',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),),
                    color: Colors.black38,


                  ),

                  RaisedButton(
                    onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Activity()),

                      );

                    },
                    color: Colors.black,



                    child: Text('Activities',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),),


                  ),
                ],
              ),

            ),


          ),
          for(var i=1; i<16;i++)

                      StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('ima').snapshots(),
                        builder: (context, snapshot){
                          if(!snapshot.hasData) return Text('Loading data please wait');

                          return Stack(


                            children:
                            <Widget>[
                              SizedBox(height:270.0),
                              Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(1.0, 2.0),
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                ),

                                child:

                                Image.network(snapshot.data.docs[0]['image${i}']['img'],
                                  fit: BoxFit.fill,
                                  width: 388,
                                  height: 250,



                                  /*fit: BoxFit.fitWidth,*/



                                ),),



                              new Positioned(
                                left: 20.0,
                                top: 10.0,
                                child:
                                Text(

                                  snapshot.data.docs[0]['image${i}']['Desc'],

                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.red, fontSize: 28,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                                    ),

                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),









                            ],





                          );
            },

          ),




      ]),
      ),
      backgroundColor: Colors.black87,

    );
  }
}




/*
                  Text(snapshot.data.docs[1]['testing'],
                    style:TextStyle(
                  color: Colors.white
              ),),
                    Text(snapshot.data.docs[1]['testt'],
                    style:TextStyle(
                        color: Colors.white
                    ),),*/

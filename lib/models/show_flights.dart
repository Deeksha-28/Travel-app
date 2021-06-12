import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_fonts/google_fonts.dart';
class show_flights extends StatefulWidget {
  @override
  _show_flights createState() => _show_flights();
}

class _show_flights extends State<show_flights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          title: Text("Flights",
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.white, fontSize: 25,fontStyle: FontStyle.italic ),
            ),
          ),



        ),
    body: SingleChildScrollView(


      child: Column(
          children: <Widget>[

            for(var i=1; i<3;i++)

              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('flightss').snapshots(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) return Text('Loading data please wait');
                  return Row(

                    children:
                    <Widget>[
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Column(


                    children:
                    <Widget>[

                      Container(


                        child: Text(

                          'Flight${i}',

                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.teal, fontSize: 35,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                            ),


                          ),

                        ),
                      ),
                        Container(


                        child: Text(

                          'Name : '+ snapshot.data.docs[0]['detail${i}']['name'],

                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black, fontSize: 28,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                            ),

                          ),
                          textAlign: TextAlign.left,
                        ),
                        ),


                  Container(
                        child:
                  Text(
                  'Price : ' +snapshot.data.docs[0]['detail${i}']['price'],

                  style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, fontSize: 28,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                  ),

                  ),
                  textAlign: TextAlign.left,
                  ),),
                      Container(
                  child:
                      Text(
                          'Time : ' +snapshot.data.docs[0]['detail${i}']['time'],

                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black, fontSize: 28,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                          ),

                        ),
                        textAlign: TextAlign.left,
                      ),)
                      ,


                  ]


                      ),

                      SizedBox(width: 40,),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.black,

                        onPressed: () {

                          SnackBar(
                            content: Text(
                                'Your Flight has been booked'),
                          );

                        },



                        child: Text('Book Now',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.white, fontSize: 20),
                          ),),





                      ),

                      SizedBox(height: 40,),

                  ],

                  );






                },

              ),




          ]),



    )
    );
  }
}

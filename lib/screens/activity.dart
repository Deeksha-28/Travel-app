import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/components/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Activity extends StatefulWidget {

  @override
  _Activity createState() => _Activity();
}

class _Activity extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: appBar(),
      body: SingleChildScrollView(



        child: Column(

           children: <Widget>[
              Container(


                color: Colors.black,
                child: SizedBox(
                  height: 50.0,
                  child: Row(


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



                        child: Text('Activities',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.white, fontSize: 20),
                          ),),


                      ),
                    ],
                  ),
                ),


              ),
              for(var i=1; i<7;i++)
                StreamBuilder(

                  stream: FirebaseFirestore.instance.collection('activitie').snapshots(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData) return Text('Loading data please wait');
                    return

                      Column(
                          children: <Widget>[
                      Stack(


                        children:
                        <Widget>[
                          SizedBox(height:260.0),
                          Container(


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                              BoxShadow(
                              color: Colors.black,
                              offset: Offset(1.0, 2.0),
                              blurRadius: 10.0,
                              ),
                              ],
                    ),

                            child:


                          Image.network(snapshot.data.docs[0]['city${i}']['city']['img'],
                            fit: BoxFit.fill,
                            width: 388,
                            height: 250,




                            /*fit: BoxFit.fitWidth,*/



                          ),
                          ),



                          new Positioned(
                            left: 20.0,
                            top: 10.0,
                            child:
                    Text(

                            snapshot.data.docs[0]['city${i}']['city']['city'],

                            style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.pinkAccent, fontSize: 28,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                                ),

                            ),
                      textAlign: TextAlign.left,
                          ),
                    ),









                        ],





                    ),


                            CarouselSlider(
                              items: [
                              Container(
                                child:Column(

                              children: [
                    Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(1.0, 2.0),
                                      blurRadius: 10.0,
                                    ),
                                  ],

                                ),

                      child: Image.network(snapshot.data.docs[0]['city${i}']['act1']['img'],
                                    fit: BoxFit.fill,
                                    width: 388,
                                    height: 250,





                                  ),
                    ),
                                  SizedBox(height: 10,),



                                  Text(

                                    snapshot.data.docs[0]['city${i}']['act1']['desc'],

                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(color: Colors.red, fontSize: 24,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,

                                      ),

                                    ),


                                  ),
                                Text(

                                  snapshot.data.docs[0]['city${i}']['act1']['price'],

                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.red, fontSize: 24,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,

                                    ),

                                  ),


                                ),
                                ]),

                              ),





                                Container(

                                  child:Column(

                                      children: [
                                Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                    BoxShadow(
                    color: Colors.black,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 10.0,
                    ),
                    ],
                    ),

                    child:



                                        Image.network(snapshot.data.docs[0]['city${i}']['act2']['img'],
                                          fit: BoxFit.fill,
                                          width: 388,
                                          height: 250,





                                        ),
                                ),
                                        SizedBox(height: 10,),




                                        Text(

                                          snapshot.data.docs[0]['city${i}']['act2']['desc'],

                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(color: Colors.red, fontSize: 24,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                                            ),

                                          ),

                                        ),
                                        Text(

                                          snapshot.data.docs[0]['city${i}']['act2']['price'],

                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(color: Colors.red, fontSize: 24,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                                            ),

                                          ),

                                        ),

                                      ]),),
                                Container(

                                  child:Column(

                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(1.0, 2.0),
                                                blurRadius: 10.0,
                                              ),
                                            ],
                                          ),

                                          child:



                                          Image.network(snapshot.data.docs[0]['city${i}']['act3']['img'],
                                            fit: BoxFit.fill,
                                            width: 388,
                                            height: 250,





                                          ),
                                        ),
                                        SizedBox(height: 10,),




                                        Text(

                                          snapshot.data.docs[0]['city${i}']['act3']['desc'],

                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(color: Colors.red, fontSize: 24,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                                            ),

                                          ),

                                        ),
                                        Text(

                                          snapshot.data.docs[0]['city${i}']['act3']['price'],

                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(color: Colors.red, fontSize: 24,fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold,
                                            ),

                                          ),

                                        ),

                                      ]),),












                              ],
                              //Slider Container properties
                              options: CarouselOptions(
                                    height: 350,
                                enableInfiniteScroll: false,

                              ),
                            ),





                    ],);





                        




    }

                ),




            ]),

      ),



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







/*Image.network(snapshot.data.docs[0]['image2']['img'],

                                width: 400.0,
                                height: 250,

                              ),
                              Text(
                                  snapshot.data.docs[0]['image2']['Desc'],
                                  style: TextStyle(
                                    color: Colors.white,
                                  )
                              ),*/

/*     Row(
                            children: [
                              CarouselSlider(
                                items: [

                                  //1st Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data.docs[0]['city${i}']['act1']['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  //2nd Image of Slider
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data.docs[0]['city${i}']['act2']['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),


                                ],

                                //Slider Container properties
                                options: CarouselOptions(
                                  height: 180.0,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                                  viewportFraction: 0.8,
                                ),
                              ),
                            ],
                          )
*/

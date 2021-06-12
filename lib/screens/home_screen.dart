import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/destination_carousel.dart';
import'package:app/widgets/hotel_carousel.dart';
import 'package:app/models/flight_search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.olacabs.com';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

/*
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }
*/


  void _ltaxiURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  /*taxiURL() async {
    const url = 'https://www.olacabs.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/
  trainURL() async {
    const url = 'https://www.irctc.co.in/nget/train-search';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  hotelURL() async {
    const url = 'https://www.goibibo.com/hotels/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          children: <Widget>[/*
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What Would You Like To Find?',

                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.purple, fontSize: 30, fontStyle: FontStyle.italic),
                ),

              ),
            ),*/

            Row(

              children: <Widget>[
                SizedBox(width: 13),

            MaterialButton(

            onPressed: () {
                    setState(() {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlightSearchPage()),
                    );
                    });

                    },



              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.flight,
                    size: 40,
                    color: Colors.blue,

                   ),
                  Text("Flights",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.black, fontSize: 16, ),
                    ),
                  ),


                ],
              ),

          shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10),


              side: BorderSide(color: Colors.blue, width: 2),

          ),
                      padding: EdgeInsets.all(10),


                    ),
                SizedBox(width: 5),

                MaterialButton(
                  onPressed: () {
                    _ltaxiURL();

                  },
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.local_taxi,
                        size: 40,
                        color: Colors.deepOrangeAccent,
                      ),
                      Text("Taxi",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.black, fontSize: 16, ),
                        ),
                      ),


                    ],
                  ),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),


                      side: BorderSide(color: Colors.deepOrangeAccent, width: 2
                      )
                  ),
                  padding: EdgeInsets.all(10),


                ),
                SizedBox(width: 5),

                MaterialButton(
                  onPressed: () {
                    trainURL();

                  },
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.train,
                        size: 40,
                        color: Colors.green,
                      ),
                      Text("Trains",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.black, fontSize: 16, ),
                        ),
                      ),


                    ],
                  ),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                      side: BorderSide(color: Colors.green, width: 2)
                  ),
                  padding: EdgeInsets.all(10),


                ),

                SizedBox(width: 5),

                MaterialButton(
                  onPressed: () {
                    hotelURL();

                  },
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.home,
                        size: 40,
                        color: Colors.pinkAccent,
                      ),
                      Text("Hotels",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.black, fontSize: 16, ),
                        ),
                      ),


                    ],
                  ),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                      side: BorderSide(color: Colors.pinkAccent, width: 2)
                  ),
                  padding: EdgeInsets.all(10),


                ),
                SizedBox(width: 10),


              ],
              
            ),


            SizedBox(height: 40),
            DestinationCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel(),
          ],
        ),
      ),
      backgroundColor: Colors.white70,


      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentTab,
      //   onTap: (int value) {
      //     setState(() {
      //       _currentTab = value;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.search,
      //         size: 30.0,
      //       ),
      //       title: SizedBox.shrink(),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.local_pizza,
      //         size: 30.0,
      //       ),
      //       title: SizedBox.shrink(),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: CircleAvatar(
      //         radius: 15.0,
      //         backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
      //       ),
      //       title: SizedBox.shrink(),
      //     )
      //   ],
      // ),
     );
  }
}

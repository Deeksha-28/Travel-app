import 'package:flutter/material.dart';
import 'package:app/models/hotel_model.dart';
import 'package:google_fonts/google_fonts.dart';
class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Exclusive Hotels',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic ),
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.pink, fontSize: 18,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 220.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      left: 10,
                      right: 10,
                      child: Container(
                        height: 120.0,
                        width: 270.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                hotel.name,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color: Colors.black, fontSize: 20,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold ),
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                hotel.address,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color: Colors.black, fontSize: 15, fontStyle: FontStyle.italic ),
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                '\$${hotel.price} / night',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          height: 180.0,
                          width: 180.0,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

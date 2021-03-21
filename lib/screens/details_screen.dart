import 'dart:convert';

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

// ignore: non_constant_identifier_names
final HeroTag;
// ignore: non_constant_identifier_names
final FoodName;
// ignore: non_constant_identifier_names
final FoodPrice;

  // ignore: non_constant_identifier_names
  DetailsPage({this.HeroTag, this.FoodName, this.FoodPrice});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selected = "WEIGHT";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: Text("Details",
        style: TextStyle(fontFamily: "Montserrat", fontSize: 20.0, fontWeight: FontWeight.bold),
         ),
        centerTitle: true,
        backgroundColor: Color(0xFF7A9BEE),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz),
            color: Colors.white,

          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height -  82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                
                child: Container(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0), topRight: Radius.circular(75.0))
                  ),

                )
                ),
                Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100.0,
                  child: Hero(
                    tag: widget.HeroTag, 
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.HeroTag),
                          fit: BoxFit.cover
                        )
                      ),
                      height: 200, 
                      width: 200,
                    )
                    )
                ),
                SizedBox(height: 40.0),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.FoodName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.FoodPrice,
                        style: TextStyle(fontWeight: FontWeight.w600, 
                        color: Colors.grey,
                        fontSize: 30.0,)),
                      Container(height: 25.0, color: Colors.grey, width: 1.0),
                        Container(
                          height: 45.0,
                          width: 100.0,

                          decoration: BoxDecoration(
                            color: Color(0xFF7A9BEE),
                            borderRadius: BorderRadius.circular(28.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0)),
                                  child: Center(
                                    
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      )
                                  ),
                      
                                ),

                              ),
                              Text("2", 
                              style: TextStyle(color: Colors.white, fontSize: 25.0),),
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(7.0)),
                                  child: Center(
                                    child: Icon(Icons.add,
                                    size: 20.0,
                                    color: Color(0xFF7A9BEE),
                                  )
                                  ),


                                )
                              )

                            ]
                          ),
                        )
                      ],
                    ),
                SizedBox(height: 30.0),
                Container(
               height:150.0,
               child: ListView(
                 scrollDirection: Axis.horizontal,
                 children: [
                           _WidgetBuildInfo('WEIGHT', '300', 'G'),
                          SizedBox(width: 10.0),
                            _WidgetBuildInfo('CALORIES', '267', 'CAL'),
                            SizedBox(width: 10.0),
                            _WidgetBuildInfo('VITAMINS', 'A, B6', 'VIT'),
                            SizedBox(width: 10.0),
                            _WidgetBuildInfo('AVAIL', 'NO', 'AV')
               ],)
             ),
             SizedBox(height: 20.0),
             Padding(
               padding: EdgeInsets.only(bottom: 15.0),
               child: Container(
                 height: 50.0,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0))
                 ),
                 child: Center(
                  child: Text(
                     '\$52.00',
                     style :TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat'
                     )
                  ),
                 ),
               ),
             )
                    
                  ]
                ),
              ),
            
             
            ]
          )
        ],
      )
    );
}
    // ignore: non_constant_identifier_names
    _WidgetBuildInfo(String cardtitle, String info, String units ){
      return InkWell(
        onTap: (){
          SelectedCard(cardtitle);
        },

        //Creating the ripple animation effect when the widget is clicked
        child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardtitle == selected ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardtitle == selected ? 
            Colors.transparent :
            Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
          width: 0.75
          ),
        ),  
        height: 100.0,
        width: 100.0, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(
                cardtitle, 
                style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      color:
                          cardtitle == selected ? Colors.white : Colors.grey.withOpacity(0.7),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info,
                    style:  TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: cardtitle == selected
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold)
                  ),
                Text(
                  units,
                  style: 
                     TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        color: cardtitle == selected
                            ? Colors.white
                            : Colors.black,
                      )
                  )
                
                ],

              ),
              
              
              )
            
          ]
        ),
        ),
 
      );




    }
    // ignore: non_constant_identifier_names
    SelectedCard(cardtitle){
      setState(() {
        selected = cardtitle;
      });
    }
  }


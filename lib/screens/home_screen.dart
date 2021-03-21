import "package:flutter/material.dart";
import 'package:nutritionapp/screens/details_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        padding: EdgeInsets.only(top: 40.0, left: 0.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.arrow_back_ios), 
              color: Colors.white,
              onPressed: (){}),
              
              Container(
                width: 125.0,
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.filter_list),
                    onPressed: (){},
                    color: Colors.white,

                    ),
                    
                    IconButton(icon: Icon(Icons.menu),
                    onPressed: (){},
                    color: Colors.white,
                    ) 


                  ]
                ) ,

              ) 

            ]
          ) ,
          SizedBox(height: 70.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  "Healthy",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0

                  )
                ),
                SizedBox(width: 10.0),
                Text(
                  "Food",
                  style: TextStyle(fontSize: 25.0, 
                  color: Colors.white),
                )

              ]
            ),
          ),
          SizedBox(height:45.0),
          Container(
            height: MediaQuery.of(context).size.height - 185,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(75.0))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25, right: 20.0),
              children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 300,
                      child: ListView(children: [
                           _buidItemWidget("assets/img/plate1.png", "Salmon Bowl", "\$24.00"),
                            _buidItemWidget("assets/img/plate4.png", "Spring Bowl", "\$24.00"),
                            _buidItemWidget("assets/img/plate5.png", "Avocado Bowl", "\$24.00"),
                            _buidItemWidget("assets/img/plate6.png", "Berry Bowl", "\$24.00"),



                      ],),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Container(
                    height: 60.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1.0,
                        color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Center(
                      child: Icon(Icons.search,color: Colors.black,),
                    ),

                  ),

                    Container(
                    height: 60.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1.0,
                        color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Center(
                      child: Icon(Icons.shopping_bag,),
                    ),

                  ),
                  Container(
                      height : 65.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFF1C1428)),
                      child: Center(
                          child: Text('Checkout',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 15.0))),
                    )
                  
                  
                  ]
                )

              ],

            ),

          )
        ],
      ),
      

      
      
      


    );
  }

  Widget _buidItemWidget(String imgpath, String foodname, String price){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(HeroTag: imgpath, FoodName: foodname, FoodPrice: price)));

        },
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: imgpath,
              
              child: Image(image: AssetImage(imgpath),
              fit: BoxFit.cover,
              height: 75.0,
              width: 75.0,
              
              ),
              ),
             
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(foodname,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      
                       ),
                    
                    ),
                    SizedBox(height: 5.0,),
                    Text(price,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14.0

                    ),),
                
                ]
              ),
                  IconButton(icon: Icon(Icons.add), 
                    onPressed: (){},
                    color: Colors.black,)
          ]
        ),),
      
      
      );


  }
}

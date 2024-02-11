import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  // This widget is the root of your application.

  //to dr
  @override
  Widget build(BuildContext context) {
    //inside 'scaffold' we can chage background, body
    //inside the body we can create container
    //everithing in flutter is a wigget
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    }
}






        // //Basic guid for flutter
        // backgroundColor: Color.fromARGB(255, 173, 211, 113),
        // //to create app bar
        // appBar: AppBar(
        //   title: Text("Commen Cents"),
        //   backgroundColor: Color.fromARGB(255, 119, 192, 121),
        //   elevation: 0,
        //   //adding menu
        //   leading: Icon(Icons.menu),
        //  adding actoons such as login/out
        //   actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        // ),
        // /*body: Center(
        //   child: Container(
        //     height: 600,
        //     width: 1000,
        //     color: Color.fromARGB(255, 119, 192, 121),
        //     //this will allow us to add text
        //     padding: EdgeInsets.all(25),
        //     /*child: Text(
        //         "Hana T",
        //         // to edit the text
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 28,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),*/
        //     //if we want to add icons, this make a heart simbole
        //     /*  child: Icon(
        //         Icons.favorite,
        //         color: Colors.white,
        //         size: 64,
        //       ),*/
        //   ),
        // ),*/

        // //to add column inside body using container
        // // is we want fix row or column we can use 'body= columen' or 'body= row'
        // // but to have scroll ability we can use 'listview' and add width t0it 
        // body: ListView(
        //   //this allows the list to be able to scroll
        //   scrollDirection: Axis.vertical,
        //     //for horizontal alignment with space between
        //     //mainAxisAlignment: MainAxisAlignment.spaceBetween,

        //     //to have the alignment cross to the left
        //     // crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       //first box

        //       //is we want to expand the container across
        //       //Expanded(
        //         //child: 
        //         Container(

        //           //if we want to use expant we dont need to use height and width
        //           height: 200,
        //           //width: 200,
        //           color: Colors.green,
        //         ),
        //       //),

        //      // Expanded(
        //         //if we adjest the 
        //        // flex: 1,
        //        // child:
        //         Container(
        //            height: 400,
        //            //width: 200,
        //           color: Colors.green[200],
        //         ),
        //       //),
        //       //2nd box

        //       //3rd box
        //       //to add color deeps we use'[]'
        //       // Expanded(
        //       //   child: 
        //         Container(
        //            height: 500,
        //           //width: 200,
        //           color: Colors.green[300],
        //         ),
        //      // ),
        //     ],
        //     ),

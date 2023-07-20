import 'package:flutter/material.dart';

import 'Categories.dart';
import 'deli.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon(Icons.arrow_back_ios_outlined),
        title: Text("bigbasket"),

      ),
      body: ListView(
        children: [
          Container(
              height: 35,
              child: Center(child: Text("My Account",style: TextStyle(fontSize: 20),))),
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.purpleAccent,Colors.deepPurpleAccent]),
              ),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Icon(Icons.person,size: 60,)),
                  Text(""),
                  // TextFormField(
                  //   style: TextStyle(color: Colors.yellowAccent),
                  //   decoration: InputDecoration(
                  //       // fillColor: Colors.grey.shade800,
                  //       // filled: true,
                  //       // Text("+91-",style: TextStyle(color: Colors.black),),
                  //       // helperText: "+91-" ,
                  //       prefixIcon: Padding(
                  //         padding: const EdgeInsets.all(18.0),
                  //         child: Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(50),
                  //               color: Colors.purple,
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Icon(Icons.person,size: 60,),
                  //             )),
                  //       ),
                  //       hintText: ("  Name "),
                  //       hintStyle: TextStyle(color: Colors.yellow,fontSize: 60)
                  //     // suffixIcon: Icon(Icons.qr_code_scanner,color: Colors.black,),
                  //     // border: InputBorder.none,
                  //   // text  //   TextStyle(color: Colors.yellow,fontSize: 40)
                  //   ),
                  //
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(

                        // hoverColor: Colors.purpleAccent,
                        // splashColor: Colors.purpleAccent,
                        tileColor: Colors.purpleAccent,
                        leading:  Icon(Icons.place),
                        title: Text("Delivery to coimbatore rabi-643002  "),
                        trailing : GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Deli()));

                          },
                          child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Icon(Icons.arrow_forward_ios,size: 12,color: Colors.white,)),
                        ),


                      ),

                    ),
                  ),
                  Text(""),
                  // TextFormField(
                  //   style: TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //
                  //     // fillColor: Colors.grey.shade800,
                  //     // filled: true,
                  //     // Text("+91-",style: TextStyle(color: Colors.black),),
                  //     // helperText: "+91-" ,
                  //       prefixIcon: Text("+91-",style: TextStyle(color: Colors.black,fontSize: 40),),
                  //       hintText: (" Enter your number"),
                  //       hintStyle: TextStyle(color: Colors.yellow,fontSize: 40)
                  //     // suffixIcon: Icon(Icons.qr_code_scanner,color: Colors.black,),
                  //     // border: InputBorder.none,
                  //
                  //   ),
                  //
                  // )
                ],
              ),




              // TextFormField(
              //   decoration: InputDecoration(
              //       hintText: "EnterYourName"
              //
              //   ),
              //
              // ),
            ),
          // User(),
          Row(
            children: [
              Text("Diet Ideas",style: TextStyle(fontSize: 40,color: Colors.brown),),

            ],
          ),
          Container(
            height: 900,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/diet.jpeg"),fit: BoxFit.fill),
            ),
          ),
          Text(""),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Category()));

              }, child: Text('Continue',style: TextStyle(color: Colors.yellow,fontSize: 16),)),

        ],
      ),
    );
  }
}

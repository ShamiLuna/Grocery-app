import 'package:flutter/material.dart';
import 'package:shagroceries/S3.dart';
import 'package:shagroceries/Splahand1.dart';
import 'package:shagroceries/Stroe.dart';
import 'package:shagroceries/cart.dart';
 class Deli extends StatefulWidget {
   const Deli({Key? key}) : super(key: key);

   @override
   State<Deli> createState() => _DeliState();
 }

 class _DeliState extends State<Deli> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.deepPurpleAccent,
         leading: GestureDetector(
             onTap: ()
             {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const Sony1()),
               );
             },

             child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)),
         title: Text("Choose Delivery Address",style: TextStyle(color: Colors.white),

       ),
     ),
     body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               style: TextStyle(color: Colors.black),
               decoration: InputDecoration(
                   fillColor: Colors.grey.shade700,
                   filled: true,
                   // Text("+91-",style: TextStyle(color: Colors.black),),
                   // helperText: "+91-" ,
                   prefixIcon: Icon(Icons.search,color: Colors.grey,),
                   hintText: ("Search for area,apartment,or pin code"),
                   hintStyle: TextStyle(color: Colors.grey)
                 // suffixIcon: Icon(Icons.qr_code_scanner,color: Colors.black,),
                 // border: InputBorder.none,

               ),

             ),
           ),
           Container(
             height: 40,
             width: 400,
             decoration: BoxDecoration(

               border: Border.all(),
               borderRadius: BorderRadius.circular(8),
               color: Colors.white,
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(child: Row(
                 children: [
                   Text("              "),
                   Icon(Icons.location_history),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const HomePage()),
                       );
                     },

                     child: Text("     Choose current location",style: TextStyle(
                         fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                   ),
                   // ElevatedButton(onPressed: (){
                   //     Navigator.push(
                   //       context,
                   //       MaterialPageRoute(builder: (context) => const Up()),
                   //     );
                   //   },
                   //  child: Text("Go")),
                 ],
               )),
             ),
           ),
           SizedBox(
             height: 100,
           ),
           ElevatedButton(onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const Str()),
             );
           },
               child: Text("Go")),
         ],
     ),
     );
   }
 }

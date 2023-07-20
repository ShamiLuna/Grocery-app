import 'package:flutter/material.dart';
import 'package:shagroceries/Stroe.dart';
import 'package:shagroceries/user.dart';

import 'S3.dart';

class log extends StatefulWidget {
  const log({Key? key}) : super(key: key);

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 600,
          ),
          Container(
            height: 100,
            width: 100,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),

              image: DecorationImage(image: AssetImage("assets/icon.jpeg"),fit: BoxFit.fill)
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              style: TextStyle(color: Colors.yellowAccent),
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade800,
                  filled: true,
                  // Text("+91-",style: TextStyle(color: Colors.black),),
                  // helperText: "+91-" ,
                  prefixIcon: Text(" +91",style: TextStyle(fontSize: 25,color: Colors.yellow),),
                  hintText: ("     Enter your mobile number"),
                  hintStyle: TextStyle(color: Colors.yellow)
                // suffixIcon: Icon(Icons.qr_code_scanner,color: Colors.black,),
                // border: InputBorder.none,

              ),

            ),
          ),
          SizedBox(
            height: 150,

          ),
          // User(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Sonym()));

              }, child: Text('Continue',style: TextStyle(color: Colors.yellow,fontSize: 16),)),

        ],
      ),
    );
  }
}

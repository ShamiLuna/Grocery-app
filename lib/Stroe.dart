import 'package:flutter/material.dart';
import 'package:shagroceries/S3.dart';

import 'deli.dart';

class Str extends StatelessWidget {
  const Str({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          ListTile(

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
          Row(
            children: [
              Text("Shop groceries from stores",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 28),),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sonym()),
                  );
                },
                child: Container(
                  height: 110,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(image: AssetImage("sm1n.jpeg"),fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sonym()),
                  );
                },
                child: Container(
                  height: 110,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(image: AssetImage("assets/sm2n.jpeg"),),
                  ),

                ),
              ),
              
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sonym()),
                  );
                },
                child: Container(
                  height: 110,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(image: AssetImage("sm3n.jpeg")),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sonym()),
                  );
                },
                child: Container(
                  height: 110,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(image: AssetImage("sm4n.jpeg")),
                  ),
                ),
              ),

            ],

          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sonym()),
                  );
                },
                child: Container(
                  height: 110,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(image: AssetImage("sm3n.jpeg"),fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sonym()),
                  );
                },
                child: Container(
                  height: 110,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(image: AssetImage("sm4n.jpeg"),fit: BoxFit.fill),
                  ),
                ),
              ),

            ],

          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Do more ",style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,fontSize: 27),),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sonym()),
                  );
                },
                child: Container(
                  height: 250,
                  width: 190,
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    image: DecorationImage(image: AssetImage("s4.jpeg",),fit: BoxFit.fill),
                  ),

                ),
              ),
              SizedBox(
                width: 20,
              ),
              // Container(
              //   height: 250,
              //   width: 160,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(image: AssetImage("sm4n.jpeg")),
              //   ),
              // ),

            ],

          ),
        ],
      ),
    );
  }
}

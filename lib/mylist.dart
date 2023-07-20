import 'package:flutter/material.dart';
import 'package:shagroceries/2.dart';
import 'package:shagroceries/S3.dart';

class Myl extends StatelessWidget {
  const Myl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent ,
          leading: GestureDetector(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sonym()),
                );
              },
              child: Icon(Icons.arrow_back_ios_outlined)),
          title: Text("bigbasket"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.mic,color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_basket,color: Colors.black,),
            ),
          ]
      ),
      body:  ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.menu,color: Colors.black),
                    hintText: ("Search by dish name or ingredients"),
                    suffixIcon: Icon(Icons.search,color: Colors.black,),
                    border: InputBorder.none,

                  ),

                ),
              ),
            ),
          ),
          Row(
            children: [
            Text("   274141-7 recipes",style: TextStyle(fontSize: 20),)  ,

            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 36,
                  width: 128,
                  decoration: BoxDecoration(
                    color: Colors.red,

                  ),
                  child: Row(
                    children: [
                      Text(
                        "  Show Filters   "
                      ),
                      Icon(Icons.filter_alt_sharp),
                    ],
                  ),
                ),
              ),

            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/R1.jpeg"))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/R2.jpeg"),fit: BoxFit.fill)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/R3.jpeg"))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/R4.jpeg"))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/R6.jpeg"))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/R7.jpeg"))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/R8.jpeg"))
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
      

    );
  }
}

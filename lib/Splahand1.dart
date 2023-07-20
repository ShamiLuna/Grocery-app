import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shagroceries/S3.dart';
import 'package:shagroceries/deli.dart';
import 'package:shagroceries/signin.dart';
// import 'package:ott/sonym.dart';
// import 'package:tesssss/sonym.dart';
// import 'package:tesssss/up.dart';
// import 'color.dart';



class Sony extends StatefulWidget {
  const Sony({Key? key}) : super(key: key);

  @override
  State<Sony> createState() => _SonyState();
}

class _SonyState extends State<Sony> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black ,
      splash: "assets/SM.jpeg",
      duration: 20,
      nextScreen: Sony1(),
      splashTransition: SplashTransition.decoratedBoxTransition,
      //pageTransitionType: PageTransitionType.scale,
    );
  }
}

class Sony1 extends StatefulWidget {
  const Sony1({Key? key}) : super(key: key);

  @override
  State<Sony1> createState() => _Sony1State();
}

class _Sony1State extends State<Sony1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
        title: Text("Sign in to continue",style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Deli()));
                },
                child: Center(child: Text("Skip",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),))),
          ),

        ],
      ),
      body:  Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Stack(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      pageSnapping: true,
                      height: 400,
                      aspectRatio: 16/4,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                      enlargeCenterPage: false,
                      enlargeFactor: 0.1,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: thug.length, itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                      height: 220,
                      width: 420,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(thug[index].image),fit: BoxFit.fill,

                        ),
                      ),
                      // child: Row(
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Icon(Icons.star_border_purple500,color: Colors.yellow,),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    );

                  },),

                ]
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
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
                      height: 35,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        color: Colors.red,

                      ),
                      child:  Center(child: Text('Start shopping',style: TextStyle(color: Colors.white,fontSize: 16),)),
                    ),
                  ),
                SizedBox(
                  height: 15,
                ),

            // Center(child: Text("Or",style: TextStyle(color: Colors.orangeAccent),)),
            Container(
              height: 35,
              width: 400,
              decoration: BoxDecoration(

                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const log()));

                  },
                  child: Text("Login/Signup",style: TextStyle(
                      fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Deli()));

                }, child: Text('Continue as guest',style: TextStyle(color: Colors.white,fontSize: 16),))
          ],
        ),
      ),
    ],
    ),
    ));
  }
}
// class Model
// {
//   String? image;
//   String? text;
//
//   Model(this.image,this.text);
// }
//
// List lots = modelData.map((e) => Model(e["image"],e["text"])).toList();
//
// var modelData = [
//   {"image":"assets/abc.jpg","text":"hi"},
//   {"image":"assets/efg.jpg","text":"hi2"},
//   {"image":"assets/hij.jpg","text":"hi3"},
//   {"image":"assets/download.jpg","text":"hi4"},
//   {"image":"assets/lll.jpg","text":"hi5"},
//   {"image":"assets/img.png","text":"hi6"}
//
//
//
// ];

class Modele
{
  String? image;
  String? text;


  Modele(this.image,this.text);
}

List thug = modeleData.map((e) => Modele(e["image"],e["text"])).toList();

var modeleData = [
  {"image":"assets/w1.jpeg","text":"New Movie"},
  {"image":"assets/w2.jpeg","text":"New Show"},
  {"image":"assets/w3.jpeg","text":""},
  // {"image":"assets/mov5.jpg","text":"New Season"},
  // {"image":"assets/mov 8.jpg","text":"Play Now"},
  // {"image":"assets/mov3.jpg","text":""}



];
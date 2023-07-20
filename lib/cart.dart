import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shagroceries/S3.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shagroceries/Stroe.dart';

import '2.dart';
import 'DetailsPage.dart';
import 'color.dart';
import 'deli.dart';
// import 'package:badges/badges.dart';
class Csrt extends StatefulWidget {
  const Csrt({Key? key}) : super(key: key);

  @override
  State<Csrt> createState() => _CsrtState();
}

class _CsrtState extends State<Csrt> {
  Future<List<Products>> FetchAgify()async{
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final respont = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    print(respont.body);
    // sharedPreferences.setString('resp', respont.body.toString());
    var data = jsonDecode(respont.body);
    return (data as List).map((x)=>
        Products.fromJson(x)
    ).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent ,
        // leading: Icon(Icons.menu),
        title: Text("Product List"),
        centerTitle: true,
        actions: [
          Badge(
              isLabelVisible: true,
              child: Icon(Icons.shopping_basket)),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      drawer:
      Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,

              ),
              child: Text('Hello,'),

            ),
            ListTile(
              // hoverColor: Colors.purpleAccent,
              // splashColor: Colors.purpleAccent,
              tileColor: Colors.purpleAccent,
              leading:  Icon(Icons.place),
              title: Text("Delivery to coimbatore rabi-643002  "),
              trailing :  Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Deli()));
                      },
                      child: Icon(Icons.arrow_forward_ios,size: 12,color: Colors.white,))),


            ),
            Divider(
              indent: 10,
            ),
            ListTile(
              title: Text("Home"),
            ),
            ListTile(
              title: Text("My Account"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Recipes"),
            ),
            ListTile(
              title: Text("Offers"),
            ),
            ListTile(
              title: Text("Notifications"),
            ),
            ListTile(
              title: Text("fAQs"),
            ),
            // ListTile(
            //   title: const Text('Item 1'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
            // ListTile(
            //   title: const Text('Item 2'),
            //   onTap: () {
            //     // Update the state of the app.
            //     // ...
            //   },
            // ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            // hoverColor: Colors.purpleAccent,
            // splashColor: Colors.purpleAccent,
           iconColor: Colors.purpleAccent,
            textColor: Colors.purpleAccent,

            // tileColor: Colors.purpleAccent,
            leading:  Icon(Icons.place),
            title: Text("Delivery to coimbatore rabi-643002  "),
            trailing : Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    // border: Border.all(),
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Icon(Icons.arrow_forward_ios,size: 12,color: Colors.white,)),


          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(

                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 3.5,
                ),
                borderRadius: BorderRadius.circular(10),

                // backgroundBlendMode: BlendMode.lighten,

              ),

              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Add \u{20B9}138.00 of items to check out.",style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 7,
                      // shadowColor: Colors.grey,
                      // color: Colors.grey,
                      child: Container(
                        // color: Colors.grey.shade300,
                           height: 50,
                        width: 399,
                        child: Center(child: Text("Add more items",style: TextStyle(
                          fontSize: 24,fontWeight: FontWeight.w500,
                        ),)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            indent: 7,
            // color: Colors.black,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Clear cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              ),
            ],
          ),
          Divider(
            indent: 7,
            // color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
            child: Container(
              height: 40,
              width: 400,
              color: Colors.grey.shade300,
              child: Row(
                children: [
                  Text("  Foodgrains, Oil & Masala           "),
                  Text("                                1 item"),
                ],
              ),
            ),
          ),
        Card(
         elevation: 1,
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
              color: Colors.white
              ),
              child: Row(
                children: [
                  Container(
                       height: 160,
                        width: 100,
                    decoration: BoxDecoration(
                      // border: Border.all(),
                    image: DecorationImage(image: AssetImage("assets/goldwinnwe.jpeg"),fit: BoxFit.fill)
                    ),

                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Gold Winner - Refined - Sunflower Oil",style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,

                        ),),
                        Text("1 L - Pouch                         ",style: TextStyle(
                          fontSize: 15,fontWeight: FontWeight.w700,

                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("\u{20B9}",textAlign: TextAlign.start,style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 18,fontWeight: FontWeight.w600),),
                            Text("129",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 15,fontWeight: FontWeight.w600),),
                            Text("                            ",style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        // Text("129                          ",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 15),),
                        Text("\u{20B9}111                                     ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.red),),
                      ],
                    ),
                  ),
                 Column(
                   children: [
                     SizedBox(
                       height: 130,
                     ),
                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Container(
                         height: 30,
                         width: 90,
                         decoration: BoxDecoration(
                           // border: Border.all(),
                           color: Colors.red,
                         ),
                         child: Row(
                           children: [
                             Container(
                               height: 30,
                               width: 30,
                               decoration: BoxDecoration(
                                   border: Border.all()
                               ),
                               child: Center(child: Text("-",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),),
                             ),
                             Container(
                               height: 30,
                               width: 30,
                               decoration: BoxDecoration(
                                   border: Border.all()
                               ),
                               child: Center(child: Text("1",style: TextStyle(fontWeight: FontWeight.w500,)),),
                             ),
                             Container(
                               height: 30,
                               width: 30,
                               decoration: BoxDecoration(
                                   border: Border.all()
                               ),
                               child: Center(child: Text("+",style: TextStyle(fontWeight: FontWeight.w500,)),),
                             ),

                           ],
                         ),



                       ),
                     ),
                   ],
                 ),
                ],
              ),
            ),
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Recommended for you",style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Container(
            height: 400,

            decoration: BoxDecoration(
            ),
            child:FutureBuilder<List<Products>>(
              future: FetchAgify(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailsPage(snapshot.data![index].id.toString())));
                                },
                                child: Container(
                                  height: 120,
                                  width: 220,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Text(snapshot.data![index].id.toString()),
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemSize: 19,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Row(
                                children: [

                                  Text("   \u{20B9}",textAlign: TextAlign.start,),
                                  Text((snapshot.data![index].price.toString()),style: TextStyle(fontSize: 20),),
                                  Text("(\u{20B9} )",style: TextStyle(fontSize: 20),),Text((snapshot.data![index].price.toString()),style: TextStyle(fontSize: 20),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("M.R.P.:",style: TextStyle(fontSize: 20),),
                                  Text("\u{20B9}",textAlign: TextAlign.start,style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20),),
                                  Text("129 ",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20),),

                                ],
                              ),
                              Container(
                                height: 50,
                                width: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),

                                    color: Colors.yellow

                                ),

                                child: Center(child: Text("Add to cart",style: TextStyle(fontSize: 22),)),
                              ),

                            ],
                          ),
                        );
                      }
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            // child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: lis.length,
            //     itemBuilder: (BuildContext context,index)
            //     {
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             // GestureDetector(
            //             //   onTap: ()
            //             //   {
            //             //     Navigator.push(
            //             //       context,
            //             //       MaterialPageRoute(builder: (context) => const Gogi()),
            //             //     );
            //             //   },
            //             //   child:
            //             //   Container(
            //             //     height: 160,
            //             //     width:170,
            //             //     decoration: BoxDecoration(
            //             //       borderRadius: BorderRadius.circular(30),
            //             //       image: DecorationImage(
            //             //         image: AssetImage(lis[index].image),fit: BoxFit.fill,
            //             //       ),
            //             //     ),
            //             //
            //             //   ),
            //             // ),
            //             Text(lis[index].text),
            //             RatingBar.builder(
            //               initialRating: 4,
            //               minRating: 1,
            //               direction: Axis.horizontal,
            //               allowHalfRating: true,
            //               itemCount: 5,
            //               itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            //               itemBuilder: (context, _) => Icon(
            //                 Icons.star,
            //                 color: Colors.amber,
            //               ),
            //               itemSize: 19,
            //               onRatingUpdate: (rating) {
            //                 print(rating);
            //               },
            //             ),
            //             Row(
            //               children: [
            //
            //                 Text("   \u{20B9}",textAlign: TextAlign.start,),
            //                 Text("111",style: TextStyle(fontSize: 20),),
            //                 Text("(\u{20B9} 111/L)",style: TextStyle(fontSize: 20),),
            //               ],
            //             ),
            //             Row(
            //               children: [
            //                 Text("M.R.P.:",style: TextStyle(fontSize: 20),),
            //                 Text("\u{20B9}",textAlign: TextAlign.start,style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20),),
            //                 Text("129 ",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20),),
            //
            //               ],
            //             ),
            //             Container(
            //                 height: 28,
            //                 width: 70,
            //                 decoration: BoxDecoration(color: Colors.brown),
            //                 child: Text(" 14% Off",style: TextStyle(fontSize: 17,color: Colors.white),)),
            //             // Text(""),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             FutureBuilder<List<Products>>(
            //               future: FetchAgify (),
            //               builder: (context, snapshot) {
            //                 if (snapshot.hasData) {
            //                   return ListView.builder(
            //                       itemCount: snapshot.data!.length,
            //                       scrollDirection: Axis.horizontal,
            //                       itemBuilder: (BuildContext context, int index) {
            //                         return Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Column(
            //                             children: [
            //                               GestureDetector(
            //                                 onTap: (){
            //                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailsPage(snapshot.data![index].id.toString())));
            //                                 },
            //                                 child: Container(
            //                                   height: 70,
            //                                   width: 70,
            //                                   decoration: BoxDecoration(
            //                                     borderRadius: BorderRadius.circular(30),
            //                                     image: DecorationImage(
            //                                       image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ),
            //                               Column(
            //                                 children: [
            //                                   Text(snapshot.data![index].price.toString()),
            //                                   Center(child: Text("Add to cart",style: TextStyle(fontSize: 22),)),
            //                                 ],
            //                               ),
            //                             ],
            //                           ),
            //                         );
            //                       }
            //                   );
            //                 } else if (snapshot.hasError) {
            //                   return Text('${snapshot.error}');
            //                 }
            //
            //                 // By default, show a loading spinner.
            //                 return const CircularProgressIndicator();
            //               },
            //             ),
            //             GestureDetector(
            //               onTap: (){
            //                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const Up()));
            //               },
            //               child: Container(
            //                 height: 50,
            //                 width: 160,
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(10),
            //
            //                     color: Colors.yellow
            //
            //                 ),
            //
            //                 child: Center(child: Text("Add to cart",style: TextStyle(fontSize: 22),)),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     }
            // ),

          ),
        ],
      ),
    bottomNavigationBar: Row(
      children: [
        Text("  Total : ",style: TextStyle(fontWeight:  FontWeight.w500,fontSize: 20),),
        Text("\u{20B9}111 ",style: TextStyle(fontWeight:  FontWeight.w500,fontSize: 20),),
        SizedBox(
          width: 175,
        ),

        Container(
          height: 40,
          width: 100,
          color: Colors.red,
          child: Center(child: Text("Checkout",style: TextStyle(color: Colors.white),)),
        ),
      ],
    ),
    );
  }
}




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
  serviceEnabled and permissionGranted are used
  to check if location service is enable and permission is granted
  */
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  LocationData? _userLocation;

  // This function will get user location
  Future<void> _getUserLocation() async {
    Location location = Location();

    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await location.getLocation();
    setState(() {
      _userLocation = locationData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current location"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: _getUserLocation,
                  child: const Text('Check Location')),
              const SizedBox(height: 25),
              // Display latitude & longtitude
              _userLocation != null
                  ? Wrap(
                children: [
                  Text('Your latitude: ${_userLocation?.latitude}'),
                  const SizedBox(width: 10),
                  Text('Your longtitude: ${_userLocation?.longitude}')
                ],
              )
                  : const Text(
                  'Please enable location service and grant permission'),
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
        ),
      ),
    );
  }
}
//
// // class Shap extends StatefulWidget {
// //   const Shap({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Shap> createState() => _ShapState();
// // }
//
// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// // ignore_for_file: public_member_api_docs
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'SharedPreferences Demo',
//       home: SharedPreferencesDemo(),
//     );
//   }
// }
//
// class SharedPreferencesDemo extends StatefulWidget {
//   const SharedPreferencesDemo({super.key});
//
//   @override
//   SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
// }
//
// class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   late Future<int> SharedPreferencese;
//
//   Future<void> _incrementCounter() async {
//     final SharedPreferences prefs = await _prefs;
//     final int counter = (prefs.getInt('counter') ?? 0) + 1;
//
//     setState(() {
//       SharedPreferencese = prefs.setInt('counter', counter).then((bool success) {
//         return counter;
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     SharedPreferencese = _prefs.then((SharedPreferences prefs) {
//       return prefs.getInt('counter') ?? 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SharedPreferences Demo'),
//       ),
//       body: Center(
//           child: FutureBuilder<int>(
//               future: SharedPreferencese,
//               builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.none:
//                   case ConnectionState.waiting:
//                     return const CircularProgressIndicator();
//                   case ConnectionState.active:
//                   case ConnectionState.done:
//                     if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     } else {
//                       return Text(
//                         'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
//                             'This should persist across restarts.',
//                       );
//                     }
//                 }
//               })),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
class SharedPreferences
{
  String? image;
  String? text;

  SharedPreferences(this.image,this.text);

  Object? getString(String s) {}

  static getInstance() {}
}

List liso = modelorData.map((e) => SharedPreferences(e["image"],e["text"])).toList();

var modelorData = [
  {"image":"assets/goldwinnwe.jpeg","text":"GoldWinner"},
  {"image":"assets/anil2.jpeg","text":"Anil"},
  {"image":"assets/tomato.jpeg","text":"Tomato"},

  {"image":"assets/cum.jpeg","text":"Jeera"},

  {"image":"assets/harpic.jpeg","text":"Harpic"},
  {"image":"assets/tata.jpeg","text":"Tata salt"},
  {"image":"assets/sugar.jpeg","text":"Tata salt"}



];
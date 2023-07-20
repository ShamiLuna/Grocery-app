import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shagroceries/Categories.dart';
import 'package:shagroceries/Splahand1.dart';
import 'package:shagroceries/Stroe.dart';
import 'package:shagroceries/cart.dart';
import 'package:shagroceries/mylist.dart';
import 'package:http/http.dart'as http;

import '2.dart';
import 'DetailsPage.dart';
import 'color.dart';
import 'deli.dart';
// import 'package:ott/Flicker.dart';
// import 'package:ott/sony2.dart';
// import 'package:ott/sony3.dart';
// import 'package:ott/sony4.dart';
// import 'package:ott/Song liv.dart';
// import 'package:tesssss/Flicker.dart';
// import 'package:tesssss/Song%20liv.dart';
// import 'package:tesssss/calc.dart';
// import 'package:tesssss/cell.dart';
// import 'package:tesssss/drop.dart';
// import 'package:tesssss/nowmi.dart';
// import 'package:tesssss/sony2.dart';
// import 'package:tesssss/sony3.dart';
// import 'package:tesssss/sony4.dart';
// import 'package:tesssss/up.dart';
// import 'package:tesssss/vico.dart';
class Sonym extends StatefulWidget {
  const Sonym({Key? key}) : super(key: key);

  @override
  State<Sonym> createState() => _SonymState();
}

class _SonymState extends State<Sonym> {

  int big = 0 ;
  final eyes=[
    Up(),
    Category(),
    Str(),
    Myl(),
    Csrt (),


  ];
  void ears(mowth)
  {
    setState(() {
      big = mowth ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: eyes[big],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedItemColor: Colors.deepPurpleAccent,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem( icon: Icon(Icons.home,),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.view_column,),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.store_mall_directory_outlined,),label: "Stores"),
          BottomNavigationBarItem(icon: Icon(Icons.note_add_sharp),label: "Recipes"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket, ),label: "Basket"),
        ],
        currentIndex: big,
        onTap: ears,
      ),
    );
  }
}
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:tesssss/color.dart';
// import 'package:tesssss/redmi.dart';
// import 'package:tesssss/sara.dart';


class Up extends StatelessWidget {
  const Up({Key? key}) : super(key: key);
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
          title: Container(
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
                  prefixIcon: Icon(Icons.search,color: Colors.black),
                  hintText: ("Search 18000+ products"),
                  // suffixIcon: Icon(Icons.qr_code_scanner,color: Colors.black,),
                  border: InputBorder.none,

                ),

              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.mic,color: Colors.black,),
            ),
          ]
      ),
      body:
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListTile(
               // hoverColor: Colors.purpleAccent,
              // splashColor: Colors.purpleAccent,
              tileColor: Colors.purpleAccent,
                leading:  Icon(Icons.place),
                 title: Text("Delivery to coimbatore rabi-643002  "),
                 trailing : Container(
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
            GestureDetector(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  Up()));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                ),
                child: FutureBuilder<List<Products>>(
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
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Text(snapshot.data![index].id.toString())),

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
              ),
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo,
                      green,
                    ],
                  ),
              ),
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ups()),
                  );
                },
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 280,
                        aspectRatio: 16/4,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.1,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: flago.length, itemBuilder: (BuildContext context, int index, int realIndex) {
                      return Container(
                        height: 220,
                        width: 420,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(flago[index].image),fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },),

                    Expanded(
                      child: FutureBuilder<List<Products>>(
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
                                            height: 180,
                                            width: 220,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              image: DecorationImage(
                                                image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Text(snapshot.data![index].category.toString())),

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
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Text("Shop By Category",style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
            //     ],
            //   ),
            // ),
            //  Padding(
            //    padding: const EdgeInsets.all(8.0),
            //    child: GestureDetector(
            //      onTap: ()
            //      {
            //        Navigator.push(
            //          context,
            //          MaterialPageRoute(builder: (context) => const Up()),
            //        );
            //      },
            //      child: Container(
            //        height: 600,
            //        width: 400,
            //        decoration: BoxDecoration(
            //          image: DecorationImage(image: AssetImage("assets/up.jpeg"),fit: BoxFit.fill)
            //        ),
            //      ),
            //    ),
            //  ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                children: [
                  Text("Deals of today",style: head,),
                ],
            ),
             ),

            Card(
              elevation: 9,
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Up()),
                  );
                },
                child:FutureBuilder<List<Products>>(
                  future: FetchAgify(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return
                      Container(
                      height: 390,
                      child:
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            childAspectRatio: 2/2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 1),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index)

                        {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailsPage(snapshot.data![index].id.toString())));
                                },
                                child: Container(
                                  height: 160,
                                  width: 185,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(snapshot.data![index].price.toString()),
                                ],
                              )
                            ],
                          );

                        },),);
                     else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
                // Container(
                //   height: 390,
                //
                //   child:
                //   GridView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //         maxCrossAxisExtent: 250,
                //         childAspectRatio: 2/2,
                //         mainAxisSpacing: 5,
                //         crossAxisSpacing: 1),
                //     itemCount: flag.length,
                //     itemBuilder: (BuildContext context, int index)
                //
                //     {
                //       return Column(
                //         children: [
                //           Container(
                //             height: 160,
                //             width: 185,
                //             decoration: BoxDecoration(
                //               image: DecorationImage(
                //                 image: AssetImage(flag[index].image),fit: BoxFit.fill,
                //               ),
                //             ),
                //           ),
                //           Row(
                //             children: [
                //               Text(flag[index].text),
                //             ],
                //           )
                //         ],
                //       );
                //
                //     },),
                // ),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
class Ups extends StatelessWidget {
  const Ups({Key? key}) : super(key: key);
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
          title: Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Seasonal treats")),
              // child: TextFormField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.search,color: Colors.black),
              //     hintText: ("Search 18000+ products"),
              //     // suffixIcon: Icon(Icons.qr_code_scanner,color: Colors.black,),
              //     border: InputBorder.none,
              //
              //   ),
              //
              // ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.mic,color: Colors.black,),
            ),
          ]
      ),
      body:
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListTile(
              // hoverColor: Colors.purpleAccent,
              // splashColor: Colors.purpleAccent,
              tileColor: Colors.purpleAccent,
              leading:  Icon(Icons.place),
              title: Text("Delivery to coimbatore rabi-643002  "),
              trailing : Container(
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
            GestureDetector(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  Up()));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                ),
                child: FutureBuilder<List<Products>>(
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
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Text(snapshot.data![index].id.toString())),

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
              ),
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo,
                    green,
                  ],
                ),
              ),
              child: GestureDetector(
                // onTap: ()
                // {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const Gogi()),
                //   );
                // },
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 280,
                        aspectRatio: 16/4,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.1,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: flago.length, itemBuilder: (BuildContext context, int index, int realIndex) {
                      return Container(
                        height: 220,
                        width: 420,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(flago[index].image),fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },),

                    Expanded(
                      child: FutureBuilder<List<Products>>(
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
                                            height: 180,
                                            width: 220,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              image: DecorationImage(
                                                image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Text(snapshot.data![index].category.toString())),

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
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Text("Shop By Category",style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.bold),),
            //     ],
            //   ),
            // ),
            //  Padding(
            //    padding: const EdgeInsets.all(8.0),
            //    child: GestureDetector(
            //      onTap: ()
            //      {
            //        Navigator.push(
            //          context,
            //          MaterialPageRoute(builder: (context) => const Up()),
            //        );
            //      },
            //      child: Container(
            //        height: 600,
            //        width: 400,
            //        decoration: BoxDecoration(
            //          image: DecorationImage(image: AssetImage("assets/up.jpeg"),fit: BoxFit.fill)
            //        ),
            //      ),
            //    ),
            //  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Deals of today",style: head,),
                ],
              ),
            ),

            Card(
              elevation: 9,
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Up()),
                  );
                },
                child:FutureBuilder<List<Products>>(
                  future: FetchAgify(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return
                        Container(
                          height: 390,
                          child:
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                childAspectRatio: 2/2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 1),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index)

                            {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailsPage(snapshot.data![index].id.toString())));
                                    },
                                    child: Container(
                                      height: 160,
                                      width: 185,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot.data![index].image.toString()),fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(snapshot.data![index].price.toString()),
                                    ],
                                  )
                                ],
                              );

                            },),);
                    else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
                // Container(
                //   height: 390,
                //
                //   child:
                //   GridView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //         maxCrossAxisExtent: 250,
                //         childAspectRatio: 2/2,
                //         mainAxisSpacing: 5,
                //         crossAxisSpacing: 1),
                //     itemCount: flag.length,
                //     itemBuilder: (BuildContext context, int index)
                //
                //     {
                //       return Column(
                //         children: [
                //           Container(
                //             height: 160,
                //             width: 185,
                //             decoration: BoxDecoration(
                //               image: DecorationImage(
                //                 image: AssetImage(flag[index].image),fit: BoxFit.fill,
                //               ),
                //             ),
                //           ),
                //           Row(
                //             children: [
                //               Text(flag[index].text),
                //             ],
                //           )
                //         ],
                //       );
                //
                //     },),
                // ),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
class Model
{
  String? image;
  String? text;

  Model(this.image,this.text);
}

List flag = modelData.map((e) => Model(e["image"],e["text"])).toList();

var modelData = [
  {"image":"assets/anil2.jpeg","text":"21% off"},
  {"image":"assets/cum.jpeg","text":"34% off"},
  {"image":"assets/goldwinnwe.jpeg","text":"39% off"},
  {"image":"assets/harpic.jpeg","text":"36% off"},
  {"image":"assets/tata.jpeg","text":"hi5"},
  {"image":"assets/sugar.jpeg","text":"hi6"}



];

class Modelt
{
  String? image;
  String? text;

  Modelt(this.image,this.text);
}

List flago = modeltData.map((e) => Modelt(e["image"],e["text"])).toList();

var modeltData = [
  {"image":"assets/sp1.jpeg","text":"21% off"},
  {"image":"assets/sp2.jpeg","text":"34% off"},
  {"image":"assets/sp3.jpeg","text":"39% off"},
  {"image":"assets/sp4.jpeg","text":"36% off"},
  {"image":"assets/sp5.jpeg","text":"hi5"},
  {"image":"assets/sp6.jpeg","text":"hi6"},
  {"image":"assets/sp7.jpeg","text":"hi6"},
  // {"image":"assets/sp8.jpeg","text":"hi6"},
  {"image":"assets/sp12.jpeg","text":"hi6"},




];

class Products {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;


  Products(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    title = json['title'].toString();
    price =double.parse( json['price'].toString());
    description = json['description'].toString();
    category = json['category'].toString();
    image = json['image'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;

    return data;
  }
}


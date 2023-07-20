import 'dart:convert';

// import 'package:apipro/CatFactApi.dart';
// import 'package:apipro/DetailsPage.dart';
// import 'package:apipro/Model/CatFact.dart';
// import 'package:apipro/Model/Products.dart';
// import 'package:apipro/Model/Zippo.dart';
// import 'package:apipro/placesApi.dart';
import 'package:flutter/material.dart';
import 'package:shagroceries/DetailsPage.dart';
import 'package:shagroceries/Products.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ProductsAPI extends StatefulWidget {
  const ProductsAPI({Key? key}) : super(key: key);

  @override
  State<ProductsAPI> createState() => _ProductsAPIState();
}

class _ProductsAPIState extends State<ProductsAPI> {

  Future<List<Products>> FetchAgify()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final respont = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    print(respont.body);
    sharedPreferences.setString('resp', respont.body.toString());
    var data = jsonDecode(respont.body);
    return (data as List).map((x)=>
      Products.fromJson(x)
    ).toList();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgifyIO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
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
                            Text(snapshot.data![index].price.toString()),
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
    );
  }
}


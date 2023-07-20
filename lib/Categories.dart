import 'package:flutter/material.dart';
import 'package:shagroceries/S3.dart';
import 'package:shagroceries/user.dart';

import 'deli.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          // leading: Icon(Icons.menu,color: Colors.black,),
          title: Text("Shop By Category",style: TextStyle(color: Colors.white),) ,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_basket,color: Colors.black,),
            ),
          ]
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
                 trailing: GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const User()));

                     },
                     child: Icon(Icons.arrow_forward_ios)),
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
        // Drawer(
        // child: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children:
        //      [
        //        // Text("hi"),
        //        ListTile(
        //          title: Text("Hello"),
        //        ),
        //        ListTile(
        //          // hoverColor: Colors.purpleAccent,
        //          // splashColor: Colors.purpleAccent,
        //          tileColor: Colors.purpleAccent,
        //          leading:  Icon(Icons.place),
        //          title: Text("Delivery to coimbatore rabi-643002  "),
        //          trailing :  Container(
        //              height: 20,
        //              width: 20,
        //              decoration: BoxDecoration(
        //                  border: Border.all(),
        //                  color: Colors.black,
        //                  borderRadius: BorderRadius.circular(30)
        //              ),
        //              child: GestureDetector(
        //                  onTap: (){
        //                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Deli()));
        //
        //                  },
        //                  child: Icon(Icons.arrow_forward_ios,size: 12,color: Colors.white,))),
        //
        //
        //        ),
        //        Divider(
        //          indent: 10,
        //        ),
        //        ListTile(
        //          title: Text("Home"),
        //        ),
        //        ListTile(
        //          title: Text("My Account"),
        //          trailing: Icon(Icons.add),
        //        ),
        //        ListTile(
        //          title: Text("Recipes"),
        //        ),
        //        ListTile(
        //          title: Text("Offers"),
        //        ),
        //        ListTile(
        //          title: Text("Notifications"),
        //        ),
        //        ListTile(
        //          title: Text("fAQs"),
        //        ),
        //      ]
        //   ),
        // ),
      // ),


      body: ListView(
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
                    prefixIcon: Icon(Icons.search,color: Colors.black),
                    hintText: ("Search 18000+ products"),
                    suffixIcon: Icon(Icons.mic,color: Colors.black,),
                    border: InputBorder.none,

                  ),

                ),
              ),

            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.apple_sharp),
                title: Text("Fruits & Vegetables"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.oil_barrel),
                title: Text("Foodgrains,Oil & Masala"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.cake),
                title: Text("Bakery,Cakes & Dairy"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.local_drink),
                title: Text("Beverages"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.brightness_auto_outlined),
                title: Text("Snacks & Branded Foods"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.handshake_outlined),
                title: Text("Beauty & Hygiene"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.cleaning_services),
                title: Text("Cleaning & Household"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.pets),
                title: Text("Kitchen , Garden & Pets"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.egg),
                title: Text("Egg,Meat & Fish"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.web_asset_rounded),
                title: Text("Gourmet & World Food"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 9,
              child: ListTile(
                leading: Icon(Icons.baby_changing_station_outlined),
                title: Text("Baby Care"),
                trailing: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

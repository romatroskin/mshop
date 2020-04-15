import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mshop/screens/products/product_details.dart';
import 'package:recase/recase.dart';
class FeaturedCard extends StatelessWidget {
  final String name;
  final String price;
  final String picture;
  final String id;
  final DocumentSnapshot documentSnapshot;

  FeaturedCard({@required this.name,@required this.price,@required this.picture, this.id,this.documentSnapshot, brand});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        width: 180,
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=> ProductDetails()));
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                  Color.fromARGB(62, 168, 174, 201),
                  offset: Offset(0, 9),
                  blurRadius: 14,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    "$picture",
                    height: 220,
                    width: 200,
                    fit: BoxFit.cover,
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          // Box decoration takes a gradient
                          gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          ),
                        ),

                        child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container()
                        )),
                  ),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: RichText(text: TextSpan(children: [
                          TextSpan(text: '${name.titleCase} \n', style: TextStyle(fontSize: 18)),
                          TextSpan(text: '\UGX ${price.toString()} \n', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

                        ]))
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

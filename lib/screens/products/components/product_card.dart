import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mshop/models/product.dart';
import 'package:mshop/screens/products/product_details.dart';
import 'package:recase/recase.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String picture;
  final String brand;
  final bool onSale;
  final String rating;
  final String id;
  final DocumentSnapshot documentSnapshot;
  final Product product;
  final String discount;
  final String discountamount;

  ProductCard({
    @required this.name,
    @required this.price,
    @required this.picture,
    @required this.brand,
    @required this.onSale,
    @required this.rating,
    @required this.discount,
    this.id,
    this.documentSnapshot,
    this.product,
    this.discountamount, 
    
  });

  @override
  Widget build(BuildContext context) {
    // return  Container(
    //   child: Row(
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ClipRRect(
    //           borderRadius: BorderRadius.circular(10),
    //           child: Image.network(
    //               "$picture",
    //               height: 150,
    //               width: 150,
    //               fit: BoxFit.cover,
    //             ),
    //         ),
    //       ),

    //       SizedBox(width: 10,),

    //       RichText(text: TextSpan(
    //           children: [
    //             TextSpan(text: '${name.titleCase} \n', style: TextStyle(fontSize: 20),),
    //             TextSpan(text: 'by: $brand \n', style: TextStyle(fontSize: 16, color: Colors.grey),),

    //             TextSpan(text: '\UGx${price.toString()} \t', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
    //             TextSpan(text: 'ON SALE ' ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.red),),

    //           ], style: TextStyle(color: Colors.black)
    //       ),)
    //     ],
    //   ),
    // );
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(9.0),
    //     boxShadow: [
    //       BoxShadow(
    //           color: Colors.grey[300], offset: Offset(0, 3), blurRadius: 3.0),
    //     ],
    //   ),
    //   child: Column(
    //     children: <Widget>[
    //       Image.network(
    //         "$picture",
    //         height: 150,
    //         width: 150,
    //         fit: BoxFit.cover,
    //       ),
    //       Text('${name.titleCase}'),
    //       Text('$brand'),
    //       Row(
    //         children: <Widget>[
    //           Text('\UGx${price.toString()}'),
    //           Spacer(),
    //           Text('ONSALE'),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      child: Stack(
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => 
                          ProductDetails(
                                product: product
                              )
                              )
                              );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      // height: (MediaQuery.of(context).size.width / 2 - 5),
                      width: double.infinity,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "$picture",
                        height: 150,
                        width: 150,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ListTile(
                        title: Text(
                          '${name.titleCase}',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  '$brand',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 1),
                                  child: Text('UGX${price.toString()}',
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Text('UGX $discountamount',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.green,
                                          decoration:
                                              TextDecoration.lineThrough)),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 1),
                                  child: Text('ON SALE',
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15)),
                                ),
                                Spacer(),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 1),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Text('$rating',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey,
                                              fontSize: 18)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 10,
              left: 155,
              child: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Center(
                      child: Text(
                    '$discount',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))))
        ],
      ),
    );
  }
}

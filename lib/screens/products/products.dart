import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mshop/screens/products/components/product_card.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  String id;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 17,
                      mainAxisSpacing: 17,
                    ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (_, index) {
                      DocumentSnapshot data = snapshot.data.documents[index];
                      return ProductCard(
                        documentSnapshot: data,
                        id: data.documentID,
                        name: data['name'],
                        brand: data['brand'],
                        price: data['price'],
                        picture: data['picture'],
                        onSale: data['sale'],
                        rating: data['rating'],
                        discount: data['discount'],
                        discountamount: data['discountamount'],
                      );
                    });
              
      },
    );
  }
}

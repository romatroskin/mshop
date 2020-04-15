import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mshop/screens/products/components/featured_card.dart';


class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  String id;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').where('featured', isEqualTo: true).snapshots(),
      builder: (context, snapshot){
        return !snapshot.hasData 
        ? Center(child: CircularProgressIndicator(),)
        :  ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (_, index) {
                DocumentSnapshot data =snapshot.data.documents[index];
                return FeaturedCard(
                  documentSnapshot: data,
                  id: data.documentID,
                  name: data['name'],
                  price: data['price'],
                  picture: data['picture'],
                );
              });
      },
    );
  }
}

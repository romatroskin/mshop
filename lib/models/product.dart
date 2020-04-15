import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  static const ID = "id";
  static const CATEGORY = "category";
  static const NAME = "name";
  static const PRICE = "price";
  static const BRAND = "brand";
  static const COLORS = "colors";
  static const QUANTITY = "quantity";
  static const SIZES = "sizes";
  static const SALE = "sale";
  static const FEATURED = "featured";
  static const PICTURE = "picture";
  static const RATING = "rating";
  static const DISCOUNT = "discount";
   static const DISCOUNTAMOUNT = "discountamount";


  String _id;
  String _name;
  String _brand;
  String _category;
  String _picture;
  String _price;
  int _quantity;
  List _colors;
  List _sizes;
  bool _onSale;
  bool _featured;
  String _rating;
  String _discount;
  String _discountamount;

//  getters
  String get name => _name;
  String get id => _id;
  String get category => _category;
  String get brand => _brand;
  String get picture => _picture;
  String get price => _price;
  String get rating => _rating;
  String get discount => _discount;
  String get discountamount => _discountamount;
  int get quantity => _quantity;
  List get colors => _colors;
  List get sizes => _sizes;
  bool get onSale => _onSale;
  bool get featured => _featured;

//  named constructure
  Product.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data;
    _name = data[NAME];
    _id = data[NAME];
    _category = data[NAME];
    _brand = data[BRAND];
    _price = data[PRICE];
      _quantity = data[QUANTITY];
    _colors = data[COLORS];
    _onSale = data[SALE];
    _featured = data[FEATURED];
    _picture = data[PICTURE];
    _rating = data[RATING];
    _discount = data[DISCOUNT];
  }

}
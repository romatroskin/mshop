import 'package:flutter/material.dart';
import 'package:mshop/models/product.dart';


class BannerImage extends StatelessWidget {
  

  final Product product;

  const BannerImage({Key key,this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      height: 200,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('A room without\nbooks is like a\nbody without a ', style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: Colors.lightBlueAccent
                ),),
                SizedBox(height: 10,),
                BlueButton()
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 10,
                  top: 10,
                  child: Transform.rotate(
                    angle: 0.0,
                    child: Image.asset('assets/images/shan.jpg'),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class BlueButton extends StatelessWidget {
  final Product product;

  const BlueButton({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'collection',
        style: TextStyle(
          color: Colors.white,
          // fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      color: Colors.lightBlueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
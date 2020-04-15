// import 'package:flutter/material.dart';
// import 'package:mshop/screens/checkout/cart/cart.dart';
// import 'package:mshop/screens/products/components/products.dart';

// class CustomAppBar extends StatelessWidget {
//   List<Products> _cart =List<Products>();

//   @override
//   Widget build(BuildContext context) {
//     return             Stack(
//       alignment: Alignment.topRight,
      
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(left:20.0,right: 60,top: 20),
//               child: Text('What are\nyou Shopping for?', style: TextStyle(fontSize: 30, color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w400),),
//             ),
//             GestureDetector(
//               onTap: () {
//                 // if (_cart.isNotEmpty)
//                 //   Navigator.of(context).push(
//                 //     MaterialPageRoute(
//                 //       builder: (context) => Cart(_cart),
//                 //     ),
//                 //   );
//               },
//                           child: Stack(
//                 children: <Widget>[
//                   Icon(Icons.shopping_cart),
//                   if (_cart.length > 0)
//                       Padding(
//                         padding: const EdgeInsets.only(left: 2.0),
//                         child: CircleAvatar(
//                           radius: 8.0,
//                           backgroundColor: Colors.red,
//                           foregroundColor: Colors.white,
//                           child: Text(
//                             _cart.length.toString(),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                 ]
                    
//               ),
//             )
//           ],
//         ),
//       ],
//     )
//     ;
//   }
// }

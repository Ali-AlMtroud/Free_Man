import 'package:free_man/models/user.dart';

class ProductFavorite{
  final id;
  final name;
  final price;
  final quantity;
  final description;
  final photo;
  final likes_counter;
  final views;
//  String photo;

//  final likesCount;
  // final comment_count;

  ProductFavorite( {
    required this.views,
    required this.id,
    required this.name,
  required  this.likes_counter,
    required this.price,
    required this.quantity,

    required this.description,

    required this.photo

  });

// map json to product model

  factory ProductFavorite.fromJson(Map<dynamic, dynamic> json) {
    return ProductFavorite(
        id: json["product"]['id']??0,
        name: json["product"]['name']??"",
        price: json["product"]['price']??0,
        quantity: json["product"]['quantity']??0,
        description: json["product"]['description']??"",
        likes_counter: json["product"]['likes_counter']??0,
        views: json['product']['views']??0,
        photo: json["product"]['image']??'https://rotationalmoulding.com/wp-content/uploads/2017/02/NoImageAvailable-300x199.jpg'
    );
  }
}

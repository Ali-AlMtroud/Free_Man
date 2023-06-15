import 'package:free_man/models/user.dart';

class Product {
  final id;
  final name;
  final price;
  final quantity;
  final description;
  final user_name;
  final user_email;
  final views;
  final category;
  final likes_counter;
  final is_liked;
  final photo;
  final is_fav;
//  String photo;

//  final likesCount;
  // final comment_count;

  Product( {
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.quantity,
    required this.user_name,
    required this.user_email,
    required this.description,
    required this.views,
    required this.likes_counter,
    required this.is_liked,
    required this.photo,
    required this.is_fav

  });

// map json to product model

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
        id: json['id']??0,
        name: json['name']??"",
        category: json['category']['name']??"",
        price: json['price']??0,
        quantity: json['quantity']??0,
        user_name: json['user']['name']??"",
        user_email: json['user']['email']??"",
        description: json['description']??"",
        views: json['views']??"",
        is_liked: json['is_liked']??false,
        likes_counter: json['likes_counter']??0,
        is_fav:json['is_fav']??false ,
        photo: json['image']??'https://rotationalmoulding.com/wp-content/uploads/2017/02/NoImageAvailable-300x199.jpg'
    );
  }
}
